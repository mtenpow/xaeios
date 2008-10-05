using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using System.Xml;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.Rules.Patterns;
using XaeiO.Compiler.Rules.Patterns.CodeGeneration;
using ImageFormat = XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

using Tenpow.Collections.Generic;

using Newtonsoft.Json;

using Reflection = System.Reflection;
// TODO: Take advantage of javascript === operator
// TODO: Safari backend should pass context in as arguments rather than restore context from a context object
// TODO: Preemptive methods can only be overriden by preemptive methods.  Likewise, non-preemptive methods only non-preemptive.
// TODO: assignment to a boolean expression should convert zero int literals to false and non-zero into literals to true
// TODO: Exeption handling for non-preemptive methods with execution blocks
// TODO: Do not allow creation of native delegates with preemptive methods
// TODO: Do not allow non-preemptive methods to call non-native delegates
// TODO: return value register is not declared as a variable in non-preemptive methods
// TODO: Finally blocks must rethrow the exception!!!!

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public partial class XaeiOSBackEnd : CompilerTierBase, IBackEnd
    {
        private Dictionary<MethodDefinition, uint> _methodCodeIndexMap;
        private Dictionary<string, CompilerImplementedMethodCodeEmitter> _compilerImplementedMethods;
        private Dictionary<string, InlineCompilerImplementedMethodCodeEmitter> _inlineCompilerImplementedMethods;
        private Dictionary<FieldDefinition, uint> _staticFieldDataPointerMap;
        private Dictionary<VTable, uint> _vtableDataPointerMap;
        private Dictionary<TypeDefinition, Dictionary<FieldDefinition, uint>> _fieldLayoutMap;
        private MetadataIndexMap<ParameterReference> _parameterReferenceMetadataIndexMap;
        private MetadataIndexMap<MethodReference> _methodReferenceMetadataIndexMap;
        private MetadataIndexMap<FieldReference> _fieldReferenceMetadataIndexMap;
        private MetadataIndexMap<TypeReference> _typeReferenceMetadataIndexMap;
        private MetadataIndexMap<AssemblyNameReference> _assemblyReferenceMetadataIndexMap;
        private Dictionary<MethodDefinition, List<UnboundFixup>> _unboundFixups;
        private List<UnboundFixup> _imageUnboundFixups;
        private Dictionary<TypeDefinition, VTable> _vtableMap;
        private List<object> _dataStore;
        private AssemblyCompileInfo _assemblyCompileInfo;
        private XaeiOSCompiler _xaeiOSCompiler;
        private MethodCompileInfo _methodCompileInfo;
        private Dictionary<string, int> _parameterSequenceMap;
        private CFG _cfg;
        private int _temporaryRegisterCounter;
        private List<MethodDefinition> _staticConstructors;

        private CodeFormatter _headerSectionFormatter;
        private CodeFormatter _codeSectionFormatter;
        private CodeFormatter _dataSectionFormatter;
        private CodeFormatter _initializationSectionFormatter;

        private ImageFormat.FixupType _defaultFixupType;

        #region IBackEnd Members

        public void EmitAssembly(AssemblyCompileInfo assemblyCompileInfo)
        {
            // TODO: Why locking?

            // TODO: break up this method
            lock (this)
            {
                // reset all data structures and variables
                Reset();
                _assemblyCompileInfo = assemblyCompileInfo;

                if (Compiler.Options.IncrementalCompilation)
                {
                    // skip emitting if incremental compile info state is available
                    // we have the output stored in th incremental compilation state
                    if (Compiler.IncrementalCompilationState.ContainsValidPersistedState(_assemblyCompileInfo.Assembly))
                    {
                        Console.WriteLine("Emitting {0} from incremental compilation state", _assemblyCompileInfo.Assembly);
                        string backendOutputBase64 = Compiler.IncrementalCompilationState[assemblyCompileInfo.Assembly].BackEndOutput;
                        Debug.Assert(backendOutputBase64 != null, "BackEnd output was null!");
                        string filename = GetOutputFilePath(_assemblyCompileInfo.Assembly);
                        File.WriteAllBytes(filename, Convert.FromBase64String(backendOutputBase64));
                        return;
                    }
                }

                // TODO: How do we deal with multi-module assemblies? - just emit one module

                /* Object file layout
                 * 
                 * - class metadata
                 * - fixups
                 * - method IL code
                 * - code section
                 * - data section (vtables and static class data)
                 * - initialization section
                 */

                // TODO: finish initialization section: entrypoint, setup base table references, link vtables do metadata

                #region Compiler implemented methods
                RegisterInlineCompilerImplementedMethodCodeEmitter(OSCorlibInstanceOfMethod, EmitOSCorlibInstanceOfCall);
                RegisterCompilerImplementedMethodCodeEmitter(OSCorlibDelegateInvokeMethod, EmitDelegateInvokeMethodCode);
                RegisterCompilerImplementedMethodCodeEmitter(OSCorlibDelegateInvokeNativeMethod, EmitDelegateInvokeNativeMethodCode);
                RegisterCompilerImplementedMethodCodeEmitter(KernelYieldMethod, EmitKernelYieldMethodCode);
                #endregion

                Dictionary<MethodDefinition, List<List<GenericParameter>>> templatedMethods = new Dictionary<MethodDefinition, List<List<GenericParameter>>>();
                foreach (MethodCompileInfo compileInfo in _assemblyCompileInfo.MethodCompileInfos.Values)
                {
                    // assign each method a code index
                    // for extern methods, only those marked with CompilerImpl and not Inline should get a code index
                    if (compileInfo.Method.RVA == 0)
                    {
                        // extern method

                        // CompilerImpl?
                        CustomAttribute xaeiosMethodImplAttribute;
                        if (AttributeHelper.TryGetCustomAttribute(compileInfo.Method, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out xaeiosMethodImplAttribute))
                        {
                            MethodImplOptions methodImplOptions = (MethodImplOptions)xaeiosMethodImplAttribute.ConstructorParameters[0];
                            if ((methodImplOptions & MethodImplOptions.CompilerImpl) > 0 && // compiler implemented?
                                (methodImplOptions & MethodImplOptions.Inline) == 0 && // not inline
                                !AttributeHelper.HasCustomAttribute(compileInfo.Method, "System.Runtime.InteropServices", "IntrinsicAttribute")) // not instrinsic
                            {
                                if (!_compilerImplementedMethods.ContainsKey(compileInfo.Method.ToString()))
                                {
                                    // oops no code emitter registered for this method
                                    throw new CompilerException("Unable to implement method marked as CompilerImpl: " + compileInfo.Method);
                                }
                                else
                                {
                                    // ok, this method gets a code index
                                    _methodCodeIndexMap[compileInfo.Method] = (uint)_methodCodeIndexMap.Count;
                                }
                            }
                        }
                    }
                    else
                    {
                        // methods with IL code always get a code index
                        _methodCodeIndexMap[compileInfo.Method] = (uint)_methodCodeIndexMap.Count;

                        #region Find generic parameters marked with the template attribute and perform the templating
                        foreach (CFGNode n in compileInfo.CFG.Vertices)
                        {
                            CodeUtility.MatchCode<IMethodInvokeExpression>(n.BasicBlock, delegate(IMethodInvokeExpression expression)
                            {
                                IMethodReferenceExpression methodReferenceExpression = expression.Method as IMethodReferenceExpression;
                                if (methodReferenceExpression != null)
                                {
                                    if (methodReferenceExpression.Method.GenericParameters.Count > 0)
                                    {
                                        MethodDefinition methodDefinition;
                                        if (ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, _assemblyCompileInfo.Assembly.Resolver, out methodDefinition))
                                        {
                                            // find template attributes
                                            List<GenericParameter> newGenericParameters = new List<GenericParameter>(methodDefinition.GenericParameters.Count);
                                            bool foundTemplateAttribute = false;
                                            for (int i = 0; i < methodDefinition.GenericParameters.Count; i++)
                                            {
                                                GenericParameter genericParameter = methodDefinition.GenericParameters[i];
                                                if (AttributeHelper.HasCustomAttribute(genericParameter, "System", "TemplateAttribute"))
                                                {
                                                    foundTemplateAttribute = true;
                                                    newGenericParameters[i] = methodReferenceExpression.Method.GenericParameters[i];
                                                }
                                                else
                                                {
                                                    newGenericParameters[i] = genericParameter;
                                                }
                                            }
                                            if (foundTemplateAttribute)
                                            {
                                                List<List<GenericParameter>> otherTemplatedGenericParameterLists;
                                                if (!templatedMethods.TryGetValue(methodDefinition, out otherTemplatedGenericParameterLists))
                                                {
                                                    templatedMethods[methodDefinition] = otherTemplatedGenericParameterLists = new List<List<GenericParameter>>();
                                                }
                                                foreach (List<GenericParameter> genericParameters in otherTemplatedGenericParameterLists)
                                                {
                                                    bool passedAllParameterTests = true;
                                                    for (int i = 0; i < genericParameters.Count; i++)
                                                    {
                                                        if (!ReferenceComparer.GenericParameterEquals(genericParameters[i], newGenericParameters[i]))
                                                        {
                                                            passedAllParameterTests = false;
                                                            break;
                                                        }
                                                    }
                                                    if (!passedAllParameterTests)
                                                    {
                                                        otherTemplatedGenericParameterLists.Add(newGenericParameters);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                return false;
                            });
                        }
                        #endregion
                    }
                }

                /* Object layout
                 * 
                 * Objects are represented as JavaScript arrays
                 * 
                 * Arrays are allocated faster than objects/JS classes.  Indexing them is also faster.
                 * 
                 * - VTable <-- Index 0
                 * - Field 1 <-- Index 1
                 * - Field 2
                 * - .......
                 * - Field n
                 * 
                 */

                // setup vtables, field offsets, and static field data pointers
                foreach (ModuleDefinition moduleDefinition in _assemblyCompileInfo.Assembly.Modules)
                {
                    foreach (TypeDefinition typeDefinition in moduleDefinition.Types)
                    {
                        if (IsOmittedType(typeDefinition))
                        {
                            continue;
                        }

                        SetupVTable(typeDefinition);
                        SetupFieldLayoutAndAddStaticFieldsToDataStore(typeDefinition);
                    }
                }

                #region write code section
                _defaultFixupType = ImageFormat.FixupType.CodeSection;
                // emit code for each method
                Dictionary<MethodCompileInfo, CodeFormatter> codeFormatterMap = new Dictionary<MethodCompileInfo, CodeFormatter>();
                foreach (MethodCompileInfo compileInfo in _assemblyCompileInfo.MethodCompileInfos.Values)
                {
                    if (_methodCodeIndexMap.ContainsKey(compileInfo.Method))
                    {
                        EmitCode(compileInfo);
                        codeFormatterMap[compileInfo] = _codeFormatter;
                    }
                }

                // write code to code section formatter and adjust fixup entries
                using (IEnumerator<KeyValuePair<MethodCompileInfo, CodeFormatter>> enumerator = codeFormatterMap.GetEnumerator())
                {
                    if (enumerator.MoveNext())
                    {
                        while (true)
                        {
                            KeyValuePair<MethodCompileInfo, CodeFormatter> codeMapping = enumerator.Current;
                            foreach (UnboundFixup fixup in _unboundFixups[codeMapping.Key.Method])
                            {
                                fixup.Offset += (uint)_codeSectionFormatter.GetOffset();
                            }
                            _codeSectionFormatter.Write(codeMapping.Value.ToString());
                            if (enumerator.MoveNext())
                            {
                                _codeSectionFormatter.Write(",");
                                _codeSectionFormatter.WriteLine();
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
                #endregion

                #region write data section

                _defaultFixupType = ImageFormat.FixupType.DataSection;
                using (IEnumerator<object> enumerator = _dataStore.GetEnumerator())
                {
                    if (enumerator.MoveNext())
                    {
                        while (true)
                        {
                            VTable vtable = enumerator.Current as VTable;
                            if (vtable != null)
                            {
                                if (DebugSettings.CommentCode)
                                {
                                    _dataSectionFormatter.WriteLine();
                                    _dataSectionFormatter.Write("// ");
                                    AddVTableDataPointerFixup(vtable.Type, _dataSectionFormatter.GetOffset(), ImageFormat.FixupType.DataSection);
                                    _dataSectionFormatter.Write(": ");
                                    _dataSectionFormatter.Write(vtable.Type.ToString());
                                    _dataSectionFormatter.WriteLine();
                                }

                                bool needCommaNewLine;
                                _dataSectionFormatter.Write("{");
                                _dataSectionFormatter.WriteLine();
                                _dataSectionFormatter.WriteIndent();

                                VTableFlags flags = VTableFlags.None;
                                if (vtable.Type.IsInterface)
                                {
                                    flags |= VTableFlags.IsInterface;
                                }
                                _dataSectionFormatter.WriteFormat("f: {0}", (int)flags);
                                needCommaNewLine = true;

                                #region interface map
                                if (vtable.InterfaceMap.Count > 0)
                                {
                                    if (needCommaNewLine)
                                    {
                                        needCommaNewLine = false;
                                        _dataSectionFormatter.Write(",");
                                        _dataSectionFormatter.WriteLine();
                                    }
                                    _dataSectionFormatter.Write("i:");
                                    _dataSectionFormatter.WriteLine();
                                    _dataSectionFormatter.Write("{");
                                    _dataSectionFormatter.WriteLine();
                                    _dataSectionFormatter.WriteIndent();

                                    foreach (KeyValuePair<TypeDefinition, Dictionary<MethodDefinition, MethodDefinition>> interfaceMapping in vtable.InterfaceMap)
                                    {
                                        if (needCommaNewLine)
                                        {
                                            needCommaNewLine = false;
                                            _dataSectionFormatter.Write(",");
                                            _dataSectionFormatter.WriteLine();
                                        }
                                        TypeDefinition interfaceType = interfaceMapping.Key;
                                        Dictionary<MethodDefinition, MethodDefinition> methodImplementations = interfaceMapping.Value;
                                        //_dataSectionFormatter.FlushIndents();
                                        AddVTableDataPointerFixup(interfaceType, _dataSectionFormatter.GetOffset(), ImageFormat.FixupType.DataSection);
                                        _dataSectionFormatter.Write(":");
                                        if (DebugSettings.CommentCode)
                                        {
                                            _dataSectionFormatter.Write("// Interface map: ");
                                            _dataSectionFormatter.Write(interfaceType.ToString());
                                        }
                                        _dataSectionFormatter.WriteLine();
                                        _dataSectionFormatter.Write("{");
                                        _dataSectionFormatter.WriteLine();
                                        _dataSectionFormatter.WriteIndent();

                                        foreach (KeyValuePair<MethodDefinition, MethodDefinition> methodImplementation in methodImplementations)
                                        {
                                            if (needCommaNewLine)
                                            {
                                                needCommaNewLine = false;
                                                _dataSectionFormatter.Write(",");
                                                _dataSectionFormatter.WriteLine();
                                            }
                                            // TODO: interface methods implemented as abstract methods should have their interface maps slot set to the "Method not found" exception throwing method
                                            AddVTableSlotFixup(methodImplementation.Key, _dataSectionFormatter.GetOffset(), ImageFormat.FixupType.DataSection);
                                            _dataSectionFormatter.Write(":" + CodeStore + "[");
                                            AddMethodCodePointerFixup(methodImplementation.Value, _dataSectionFormatter.GetOffset(), ImageFormat.FixupType.DataSection);
                                            _dataSectionFormatter.Write("]");
                                            if (DebugSettings.CommentCode)
                                            {
                                                _dataSectionFormatter.Write("/* ");
                                                _dataSectionFormatter.Write(methodImplementation.Key.Name);
                                                _dataSectionFormatter.Write(" -> ");
                                                _dataSectionFormatter.Write(methodImplementation.Value.ToString());
                                                _dataSectionFormatter.Write(" */");
                                            }
                                            needCommaNewLine = true;
                                        }

                                        _dataSectionFormatter.WriteLine();
                                        _dataSectionFormatter.WriteOutdent();
                                        _dataSectionFormatter.Write("}");
                                        needCommaNewLine = true;
                                    }

                                    _dataSectionFormatter.WriteLine();
                                    _dataSectionFormatter.WriteOutdent();
                                    _dataSectionFormatter.Write("}");
                                    needCommaNewLine = true;
                                }
                                #endregion

                                for (int i = 0; i < vtable.Slots.Count; i++)
                                {
                                    if (needCommaNewLine)
                                    {
                                        needCommaNewLine = false;
                                        _dataSectionFormatter.Write(",");
                                        _dataSectionFormatter.WriteLine();
                                    }
                                    MethodDefinition methodDefinition = vtable.Slots[i];
                                    _dataSectionFormatter.WriteFormat("{0}:", i);
                                    if (methodDefinition.IsAbstract)
                                    {
                                        _dataSectionFormatter.Write("null");
                                    }
                                    else
                                    {
                                        _dataSectionFormatter.Write(CodeStore + "[");
                                        AddMethodCodePointerFixup(methodDefinition, (uint)_dataSectionFormatter.GetOffset(), ImageFormat.FixupType.DataSection);
                                        _dataSectionFormatter.Write("]");
                                    }

                                    if (DebugSettings.CommentCode)
                                    {
                                        _dataSectionFormatter.Write("/* ");
                                        _dataSectionFormatter.Write(methodDefinition.ToString());
                                        _dataSectionFormatter.Write(" */");
                                    }

                                    needCommaNewLine = true;
                                }

                                _dataSectionFormatter.WriteLine();
                                _dataSectionFormatter.WriteOutdent();
                                _dataSectionFormatter.Write("}");
                            }
                            else
                            {
                                FieldDefinition staticFieldDefinition = enumerator.Current as FieldDefinition;
                                if (staticFieldDefinition != null)
                                {
                                    Debug.Assert(staticFieldDefinition.IsStatic);
                                    EmitFieldInitialValue(staticFieldDefinition, _dataSectionFormatter, ImageFormat.FixupType.DataSection);
                                    if (DebugSettings.CommentCode)
                                    {
                                        _dataSectionFormatter.WriteFormat("/* {0} */", staticFieldDefinition.ToString());
                                    }
                                }
                                else
                                {
                                    throw new CompilerException("Illegal data " + enumerator.Current + "in data store");
                                }
                            }

                            if (enumerator.MoveNext())
                            {
                                _dataSectionFormatter.Write(",");
                                _dataSectionFormatter.WriteLine();
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
                #endregion

                #region write reflection metadata initialization
                EmitReflectionMetadataInitializationCode(_assemblyCompileInfo.Assembly);
                #endregion

                #region fixups
                Dictionary<string, List<UnboundFixup>> fixupsMap = new Dictionary<string, List<UnboundFixup>>();
                fixupsMap["Code"] = new List<UnboundFixup>();
                fixupsMap["Data"] = new List<UnboundFixup>();
                fixupsMap["Initialization"] = new List<UnboundFixup>();
                Dictionary<UnboundFixup, int> fixupBindingMap = new Dictionary<UnboundFixup, int>();
                foreach (List<UnboundFixup> fixups in _unboundFixups.Values)
                {
                    foreach (UnboundFixup fixup in fixups)
                    {
                        BindFixup(fixup, fixupsMap, fixupBindingMap);
                    }
                }
                foreach (UnboundFixup fixup in _imageUnboundFixups)
                {
                    BindFixup(fixup, fixupsMap, fixupBindingMap);
                }
                foreach (List<UnboundFixup> fixups in fixupsMap.Values)
                {
                    fixups.Sort(delegate(UnboundFixup a, UnboundFixup b)
                    {
                        return (int)(a.Offset - b.Offset);
                    });
                }

                #endregion

                #region build image file
                ImageFormat.ImageHeader imageHeader = new ImageFormat.ImageHeader();

                #region add metadata
                ImageFormat.Metadata metadata = imageHeader.Metadata = new ImageFormat.Metadata();

                ImageFormat.AssemblyName assemblyName = new ImageFormat.AssemblyName();
                assemblyName.Name = _assemblyCompileInfo.Assembly.Name.Name;
                assemblyName.Version = _assemblyCompileInfo.Assembly.Name.Version.ToString();
                assemblyName.Culture = _assemblyCompileInfo.Assembly.Name.Culture;
                metadata.Name = assemblyName;

                if (_assemblyCompileInfo.Assembly.EntryPoint != null)
                {
                    if (AttributeHelper.HasCustomAttribute(_assemblyCompileInfo.Assembly.EntryPoint, "XaeiOS.Boot", "BootMethod"))
                    {
                        metadata.BootMethod = GetReferenceMetadataIndex(_assemblyCompileInfo.Assembly.EntryPoint);
                    }
                    else
                    {
                        metadata.BootMethod = GetReferenceMetadataIndex(OSCorlibBootManagerBootModuleEntryPoint);
                    }

                    // TODO: ensure entrypoint uses the xaeios calling convention
                    metadata.EntryPoint = GetReferenceMetadataIndex(_assemblyCompileInfo.Assembly.EntryPoint);
                }

                #region types
                ImageFormat.Types types = metadata.Types = new ImageFormat.Types();

                foreach (ModuleDefinition moduleDefinition in _assemblyCompileInfo.Assembly.Modules)
                {
                    foreach (TypeDefinition typeDefinition in moduleDefinition.Types)
                    {
                        if (IsOmittedType(typeDefinition))
                        {
                            continue;
                        }
                        ImageFormat.Type type = new ImageFormat.Type();
                        type.Namespace = typeDefinition.Namespace;
                        type.Name = typeDefinition.Name;
                        type.IsInterface = typeDefinition.IsInterface;
                        type.IsAbstract = typeDefinition.IsAbstract;
                        // TODO: type.Interfaces

                        TypeReference declaringType = GetDeclaringType(typeDefinition);
                        if (declaringType != null)
                        {
                            type.DeclaringType = GetReferenceMetadataIndex(declaringType);
                        }
                        else
                        {
                            type.DeclaringType = -1;
                        }
                        if (typeDefinition.BaseType != null)
                        {
                            type.BaseType = GetReferenceMetadataIndex(typeDefinition.BaseType);
                        }
                        else
                        {
                            type.BaseType = -1;
                        }
                        type.VTableIndex = (int)_vtableDataPointerMap[_vtableMap[typeDefinition]];

                        #region methods
                        ImageFormat.Methods methods = type.Methods = new ImageFormat.Methods();
                        List<MethodDefinition> methodDefinitions = new List<MethodDefinition>();
                        foreach (MethodDefinition methodDefinition in typeDefinition.Methods)
                        {
                            methodDefinitions.Add(methodDefinition);
                        }
                        foreach (MethodDefinition methodDefinition in typeDefinition.Constructors)
                        {
                            methodDefinitions.Add(methodDefinition);
                        }
                        foreach (MethodDefinition methodDefinition in methodDefinitions)
                        {
                            int codeIndex;
                            uint uCodeIndex;
                            if (!_methodCodeIndexMap.TryGetValue(methodDefinition, out uCodeIndex))
                            {
                                if ((methodDefinition.ImplAttributes & MethodImplAttributes.ManagedMask) == MethodImplAttributes.Managed)
                                {
                                    codeIndex = -1;
                                }
                                else
                                {
                                    Warn("No method code index for method: " + methodDefinition);
                                    continue;
                                }
                            }
                            else
                            {
                                codeIndex = (int)uCodeIndex;
                            }

                            ImageFormat.Method method = new ImageFormat.Method();
                            method.Name = methodDefinition.Name;
                            method.ReturnType = GetReferenceMetadataIndex(methodDefinition.ReturnType.ReturnType);

                            VTable vtable = _vtableMap[ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType, _assemblyCompileInfo.Assembly.Resolver)];
                            method.VTableSlot = vtable.Slots.IndexOf(methodDefinition);
                            method.CodeIndex = codeIndex;
                            method.HasThis = methodDefinition.HasThis;

                            #region parameters

                            ImageFormat.Parameters parameters = method.Parameters = new ImageFormat.Parameters();
                            foreach (ParameterDefinition parameterDefinition in methodDefinition.Parameters)
                            {
                                ImageFormat.Parameter parameter = new ImageFormat.Parameter();
                                parameter.Name = parameterDefinition.Name;
                                parameter.Type = GetReferenceMetadataIndex(parameterDefinition.ParameterType);
                                parameter.Sequence = parameterDefinition.Sequence;
                                parameters.Add(parameter);
                            }
                            #endregion

                            methods.Add(method);
                        }
                        #endregion

                        #region fields
                        ImageFormat.Fields fields = type.Fields = new ImageFormat.Fields();
                        ImageFormat.StaticFields staticFields = type.StaticFields = new ImageFormat.StaticFields();
                        foreach (FieldDefinition fieldDefinition in typeDefinition.Fields)
                        {
                            if (fieldDefinition.IsStatic)
                            {
                                ImageFormat.StaticField staticField = new ImageFormat.StaticField();
                                staticField.Name = fieldDefinition.Name;
                                staticField.Type = GetReferenceMetadataIndex(fieldDefinition.FieldType);
                                staticField.DataIndex = (int)_staticFieldDataPointerMap[fieldDefinition];
                                staticFields.Add(staticField);
                            }
                            else
                            {
                                ImageFormat.Field field = new ImageFormat.Field();
                                field.Name = fieldDefinition.Name;
                                field.Type = GetReferenceMetadataIndex(fieldDefinition.FieldType);
                                field.Offset = (int)GetFieldLayout(typeDefinition)[fieldDefinition];
                                fields.Add(field);
                            }
                        }
                        #endregion

                        types.Add(type);
                    }
                }

                #endregion

                #region method references
                ImageFormat.MethodReferences methodReferences = metadata.MethodReferences = new ImageFormat.MethodReferences();

                foreach (MethodReference methodReference in _methodReferenceMetadataIndexMap.References)
                {
                    ImageFormat.MethodReference methodReferenceData = new ImageFormat.MethodReference();
                    methodReferenceData.Type = GetReferenceMetadataIndex(methodReference.DeclaringType);
                    methodReferenceData.Name = methodReference.Name;
                    methodReferenceData.HasThis = methodReference.HasThis;

                    for (int i = 0; i < methodReference.Parameters.Count; i++)
                    {
                        methodReference.Parameters[i].Sequence = i + 1;
                        methodReferenceData.Parameters.Add(GetReferenceMetadataIndex(methodReference.Parameters[i]));
                    }

                    methodReferences.Add(methodReferenceData);
                }
                #endregion

                #region parameter references

                ImageFormat.ParameterReferences parameterReferences = metadata.ParameterReferences = new ImageFormat.ParameterReferences();

                foreach (ParameterReference parameterReference in _parameterReferenceMetadataIndexMap.References)
                {
                    ImageFormat.ParameterReference parameterReferenceData = new ImageFormat.ParameterReference();
                    parameterReferenceData.Type = GetReferenceMetadataIndex(parameterReference.ParameterType);
                    parameterReferenceData.Name = parameterReference.Name;
                    parameterReferenceData.Sequence = parameterReference.Sequence;

                    parameterReferences.Add(parameterReferenceData);
                }
                #endregion

                #region field references
                ImageFormat.FieldReferences fieldReferences = metadata.FieldReferences = new ImageFormat.FieldReferences();

                foreach (FieldReference fieldReference in _fieldReferenceMetadataIndexMap.References)
                {
                    ImageFormat.FieldReference fieldReferenceData = new ImageFormat.FieldReference();

                    fieldReferenceData.Type = GetReferenceMetadataIndex(fieldReference.DeclaringType);
                    fieldReferenceData.Name = fieldReference.Name;
                    fieldReferenceData.IsStatic = ReferenceResolver.ResolveFieldReference(fieldReference, _assemblyCompileInfo.Assembly.Resolver).IsStatic;

                    fieldReferences.Add(fieldReferenceData);
                }
                #endregion

                #region type references
                ImageFormat.TypeReferences typeReferences = metadata.TypeReferences = new ImageFormat.TypeReferences();

                foreach (TypeReference typeReference in _typeReferenceMetadataIndexMap.References)
                {
                    ImageFormat.TypeReference typeReferenceData = new ImageFormat.TypeReference();
                    typeReferenceData.Namespace = typeReference.Namespace;
                    typeReferenceData.Name = typeReference.Name;
                    typeReferenceData.IsGeneric = typeReference is GenericParameter;

                    TypeReference declaringType = GetDeclaringType(typeReference);

                    if (declaringType != null)
                    {
                        typeReferenceData.DeclaringType = GetReferenceMetadataIndex(declaringType);
                    }
                    else
                    {
                        typeReferenceData.DeclaringType = -1;
                    }

                    if (typeReference.Scope == null)
                    {
                        // TODO: is it always corlib if the scope is null?
                        typeReferenceData.Assembly = GetReferenceMetadataIndex(CoreTypes.Corlib.Name);
                    }
                    else if (typeReference.Scope is ModuleDefinition)
                    {
                        // this module is usually the same assembly we are compiling but i'm not sure so let's just get a reference
                        ModuleDefinition moduleDefinition = typeReference.Scope as ModuleDefinition;
                        typeReferenceData.Assembly = GetReferenceMetadataIndex(moduleDefinition.Assembly.Name);
                    }
                    else
                    {
                        // otherwise the assembly is a referenced one
                        AssemblyNameReference assemblyNameReference = (AssemblyNameReference)typeReference.Scope;
                        typeReferenceData.Assembly = GetReferenceMetadataIndex(assemblyNameReference);
                    }

                    typeReferences.Add(typeReferenceData);
                }
                #endregion

                #region assembly references
                ImageFormat.AssemblyReferences assemblyReferences = metadata.AssemblyReferences = new ImageFormat.AssemblyReferences();

                foreach (AssemblyNameReference assemblyNameReference in _assemblyReferenceMetadataIndexMap.References)
                {
                    ImageFormat.AssemblyReference assemblyReferenceData = new ImageFormat.AssemblyReference();
                    assemblyReferenceData.Name = assemblyNameReference.Name;
                    assemblyReferenceData.Version = assemblyNameReference.Version.ToString(4);

                    assemblyReferences.Add(assemblyReferenceData);
                }
                #endregion

                #region static constructors
                ImageFormat.StaticConstructors staticConstructors = metadata.StaticConstructors = new ImageFormat.StaticConstructors();
                foreach (MethodDefinition staticConstructor in _staticConstructors)
                {
                    staticConstructors.Add(GetReferenceMetadataIndex(staticConstructor));
                }
                #endregion

                #endregion

                #region now create bound fixups
                ImageFormat.Fixups allFixups = imageHeader.Fixups = new ImageFormat.Fixups();
                foreach (string sectionName in fixupsMap.Keys)
                {
                    uint lastFixupOffset = 0;
                    for (int i = 0; i < fixupsMap[sectionName].Count; i++)
                    {
                        UnboundFixup unboundFixup = fixupsMap[sectionName][i];
                        ImageFormat.Fixup fixup = new ImageFormat.Fixup();

                        fixup.Type = unboundFixup.Type;
                        fixup.Index = fixupBindingMap[unboundFixup];
                        fixup.Offset = unboundFixup.Offset - lastFixupOffset; // make fixup offset relative to last fixup
                        fixup.Description = unboundFixup.Reference.ToString() + " @ " + unboundFixup.Offset;
                        lastFixupOffset = unboundFixup.Offset;

                        allFixups.Add(fixup);
                    }
                }

                #endregion

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using (TextWriter textWriter = new StreamWriter(memoryStream))
                    {
                        JsonWriter jsonWriter = new JsonWriter(textWriter);
                        jsonWriter.Formatting = Newtonsoft.Json.Formatting.Indented;
                        jsonWriter.QuoteName = false;

                        JsonSerializer serializer = new JsonSerializer();
                        serializer.Serialize(jsonWriter, imageHeader);
                        textWriter.Flush();
                        memoryStream.Flush();
                        memoryStream.Seek(0, SeekOrigin.Begin);
                        using (TextReader textReader = new StreamReader(memoryStream))
                        {
                            _headerSectionFormatter.Write(textReader.ReadToEnd());
                            _headerSectionFormatter.WriteLine();
                        }
                    }
                }

                #endregion

                {
                    // TODO: Use an xml stream writer here instead

                    // write object file
                    string filename = GetOutputFilePath(_assemblyCompileInfo.Assembly);

                    XmlDocument objectFileXmlDocument = new XmlDocument();

                    XmlElement documentElement = objectFileXmlDocument.CreateElement("Object");

                    // header section
                    XmlElement headerSectionElement = objectFileXmlDocument.CreateElement("Header");
                    headerSectionElement.AppendChild(objectFileXmlDocument.CreateCDataSection(_headerSectionFormatter.ToString()));
                    documentElement.AppendChild(headerSectionElement);

                    // code section
                    XmlElement codeSectionElement = objectFileXmlDocument.CreateElement("Code");
                    codeSectionElement.SetAttribute("Length", (_methodCodeIndexMap.Count).ToString());
                    codeSectionElement.AppendChild(objectFileXmlDocument.CreateCDataSection(_codeSectionFormatter.ToString()));
                    documentElement.AppendChild(codeSectionElement);

                    // data section
                    XmlElement dataSectionElement = objectFileXmlDocument.CreateElement("Data");
                    dataSectionElement.SetAttribute("Length", _dataStore.Count.ToString());
                    dataSectionElement.AppendChild(objectFileXmlDocument.CreateCDataSection(_dataSectionFormatter.ToString()));
                    documentElement.AppendChild(dataSectionElement);

                    // data initialization
                    XmlElement initializationSectionElement = objectFileXmlDocument.CreateElement("Initialization");
                    initializationSectionElement.AppendChild(objectFileXmlDocument.CreateCDataSection(_initializationSectionFormatter.ToString()));
                    documentElement.AppendChild(initializationSectionElement);

                    objectFileXmlDocument.AppendChild(documentElement);

                    File.WriteAllText(filename, objectFileXmlDocument.OuterXml);

                    // save incremental compilation state
                    if (Compiler.Options.IncrementalCompilation)
                    {
                        byte[] bytes = File.ReadAllBytes(filename);
                        Compiler.IncrementalCompilationState[_assemblyCompileInfo.Assembly].BackEndOutput = Convert.ToBase64String(bytes);
                    }
                }
            }
        }

        private string GetOutputFilePath(AssemblyDefinition assembly)
        {
            // TODO: Extract out extension into constant
            return Path.Combine(GetXaeiOSCompiler().Options.OutputPath, assembly.Name.Name + ".xo");
        }

        #endregion

        public XaeiOSBackEnd()
            : base()
        {
            InitializeCalculateCostMethodMap();
            InitializeEmitCodeMethodMap();
        }

        private XaeiOSCompiler GetXaeiOSCompiler()
        {
            if (_xaeiOSCompiler == null)
            {
                _xaeiOSCompiler = (XaeiOSCompiler)Compiler;
            }
            return _xaeiOSCompiler;
        }
        private MiddleEnds.BasicMiddleEnd GetBasicMiddleEnd()
        {
            return (MiddleEnds.BasicMiddleEnd)Compiler.MiddleEnd;
        }
        private void Reset()
        {
            // TODO: Rather than resetting, create a new object to contain all state for an assembly
            _methodCodeIndexMap = new Dictionary<MethodDefinition, uint>();
            _compilerImplementedMethods = new Dictionary<string, CompilerImplementedMethodCodeEmitter>();
            _inlineCompilerImplementedMethods = new Dictionary<string, InlineCompilerImplementedMethodCodeEmitter>();
            _staticFieldDataPointerMap = new Dictionary<FieldDefinition, uint>();
            _vtableDataPointerMap = new Dictionary<VTable, uint>();
            _fieldLayoutMap = new Dictionary<TypeDefinition, Dictionary<FieldDefinition, uint>>();
            _parameterReferenceMetadataIndexMap = new MetadataIndexMap<ParameterReference>();
            _fieldReferenceMetadataIndexMap = new MetadataIndexMap<FieldReference>();
            _methodReferenceMetadataIndexMap = new MetadataIndexMap<MethodReference>();
            _typeReferenceMetadataIndexMap = new MetadataIndexMap<TypeReference>();
            _assemblyReferenceMetadataIndexMap = new MetadataIndexMap<AssemblyNameReference>();
            _unboundFixups = new Dictionary<MethodDefinition, List<UnboundFixup>>();
            _imageUnboundFixups = new List<UnboundFixup>();
            _dataStore = new List<object>();
            _vtableMap = new Dictionary<TypeDefinition, VTable>();
            _headerSectionFormatter = new CodeFormatter();
            _codeSectionFormatter = new CodeFormatter();
            _dataSectionFormatter = new CodeFormatter();
            _initializationSectionFormatter = new CodeFormatter();
            _temporaryRegisterCounter = 0;
            _staticConstructors = new List<MethodDefinition>();
        }

        #region Metadata
        private int GetReferenceMetadataIndex(ParameterReference reference)
        {
            int index;
            string referenceKey = reference.ParameterType.AssemblyQualifiedName + " " + reference.Name + " " + reference.Sequence;
            if (!_parameterReferenceMetadataIndexMap.TryGetIndex(reference, referenceKey, out index))
            {
                index = _parameterReferenceMetadataIndexMap.Count;
                _parameterReferenceMetadataIndexMap.Add(reference, referenceKey, index);
            }
            return index;
        }
        private int GetReferenceMetadataIndex(FieldReference reference)
        {
            int index;
            StringBuilder builder = new StringBuilder();
            builder.Append(reference.FieldType.AssemblyQualifiedName);
            builder.Append(" ");
            builder.Append(reference.DeclaringType.AssemblyQualifiedName);
            builder.Append("::");
            builder.Append(reference.Name);
            string referenceKey = builder.ToString();
            if (!_fieldReferenceMetadataIndexMap.TryGetIndex(reference, referenceKey, out index))
            {
                index = _fieldReferenceMetadataIndexMap.Count;
                _fieldReferenceMetadataIndexMap.Add(reference, referenceKey, index);
            }
            return index;
        }
        private int GetReferenceMetadataIndex(MethodReference reference)
        {
            int index;
            StringBuilder builder = new StringBuilder();
            builder.Append(reference.ReturnType.ReturnType.AssemblyQualifiedName);
            builder.Append(" ");
            builder.Append(reference.DeclaringType.AssemblyQualifiedName);
            builder.Append("::");
            builder.Append(reference.Name);
            builder.Append("(");
            foreach (ParameterReference parameterReference in reference.Parameters)
            {
                builder.Append(parameterReference.ParameterType.AssemblyQualifiedName);
                builder.Append(" ");
                builder.Append(parameterReference.Name);
                if (parameterReference.Sequence < reference.Parameters.Count - 1)
                {
                    builder.Append(",");
                }
            }
            string referenceKey = builder.ToString();
            if (!_methodReferenceMetadataIndexMap.TryGetIndex(reference, referenceKey, out index))
            {
                index = _methodReferenceMetadataIndexMap.Count;
                _methodReferenceMetadataIndexMap.Add(reference, referenceKey, index);
            }
            return index;
        }
        private int GetReferenceMetadataIndex(TypeReference reference)
        {
            if (reference is ArrayType || reference.Name.EndsWith("[]"))
            {
                return GetReferenceMetadataIndex(CoreTypes.Array);
            }
            TypeReference declaringType = GetDeclaringType(reference);
            if (declaringType != null)
            {
                GetReferenceMetadataIndex(declaringType);
            }
            int index;
            string referenceKey = reference.AssemblyQualifiedName;
            if (!_typeReferenceMetadataIndexMap.TryGetIndex(reference, referenceKey, out index))
            {
                index = _typeReferenceMetadataIndexMap.Count;
                _typeReferenceMetadataIndexMap.Add(reference, referenceKey, index);
            }
            return index;
        }
        private int GetReferenceMetadataIndex(AssemblyNameReference reference)
        {
            if (_assemblyCompileInfo.Assembly.Name.Name == reference.Name &&
                _assemblyCompileInfo.Assembly.Name.Version == reference.Version &&
                _assemblyCompileInfo.Assembly.Name.Culture == reference.Culture) // TODO: Export this method somewhere else and make it check more thoroughly
            {
                return -1;
            }

            // TODO: Use CLRConjugate mechanism instead of hardcoding
            if (reference.Name == "mscorlib")
            {
                return GetReferenceMetadataIndex(CoreTypes.Corlib.Name);
            }

            int index;
            string referenceKey = reference.FullName;
            if (!_assemblyReferenceMetadataIndexMap.TryGetIndex(reference, referenceKey, out index))
            {
                index = _assemblyReferenceMetadataIndexMap.Count;
                _assemblyReferenceMetadataIndexMap.Add(reference, referenceKey, index);
            }
            return index;
        }
        private uint GetFieldOffset(FieldReference fieldReference)
        {
            FieldDefinition fieldDefinition = ReferenceResolver.ResolveFieldReference(fieldReference, _assemblyCompileInfo.Assembly.Resolver);
            TypeDefinition typeDefinition = ReferenceResolver.ResolveTypeReference(fieldDefinition.DeclaringType, _assemblyCompileInfo.Assembly.Resolver);
            Dictionary<FieldDefinition, uint> fieldLayout = GetFieldLayout(typeDefinition);
            uint fieldOffset;
            if (fieldLayout.TryGetValue(fieldDefinition, out fieldOffset))
            {
                return fieldOffset;
            }
            else
            {
                throw new CompilerException("Could not find field offset for field: " + fieldDefinition);
            }
        }
        private Dictionary<FieldDefinition, uint> GetFieldLayout(TypeDefinition typeDefinition)
        {
            Dictionary<FieldDefinition, uint> layout;
            if (_fieldLayoutMap.TryGetValue(typeDefinition, out layout))
            {
                return layout;
            }
            else
            {
                SetupFieldLayoutAndAddStaticFieldsToDataStore(typeDefinition);
                return _fieldLayoutMap[typeDefinition];
            }
        }
        /// <summary>
        /// Creates a new vtable for the specified type and adds it to the vtable map.
        /// </summary>
        /// <param name="type">The type to create a vtable for</param>
        private void SetupVTable(TypeDefinition type)
        {
            // make sure vtable is not already setup
            if (_vtableMap.ContainsKey(type))
            {
                return;
            }

            VTable vtable = new VTable();
            _vtableMap[type] = vtable;
            vtable.Type = type;

            Set<MethodDefinition> implementedMethods = new Set<MethodDefinition>();

            // make sure base vtable is setup and then copy it
            if (type.BaseType != null)
            {
                TypeDefinition baseType = ReferenceResolver.ResolveTypeReference(type.BaseType, _assemblyCompileInfo.Assembly.Resolver);
                if (!_vtableMap.ContainsKey(baseType))
                {
                    SetupVTable(baseType);
                }
                VTable baseVTable = _vtableMap[baseType];
                for (int i = 0; i < baseVTable.Slots.Count; i++)
                {
                    vtable.Slots.Add(baseVTable.Slots[i]);
                }
                foreach (KeyValuePair<TypeDefinition, Dictionary<MethodDefinition, MethodDefinition>> mapping in baseVTable.InterfaceMap)
                {
                    vtable.InterfaceMap[mapping.Key] = new Dictionary<MethodDefinition, MethodDefinition>(mapping.Value);
                }
            }

            Dictionary<MethodDefinition, TypeDefinition> methodsToBeImplemented = new Dictionary<MethodDefinition, TypeDefinition>();
            DynamicDictionary<string, Set<MethodDefinition>> methodNamesToBeImplemented = new DynamicDictionary<string, Set<MethodDefinition>>();
            Set<TypeDefinition> implementedInterfaces = new Set<TypeDefinition>();
            TypeDefinition currentTypeDefinition = type;
            while (true)
            {
                foreach (TypeReference iface in currentTypeDefinition.Interfaces)
                {
                    implementedInterfaces.Add(ReferenceResolver.ResolveTypeReference(iface));
                }
                TypeReference baseTypeReference = currentTypeDefinition.BaseType;
                if (baseTypeReference == null)
                {
                    break;
                }
                currentTypeDefinition = ReferenceResolver.ResolveTypeReference(baseTypeReference);
            }
            foreach (TypeDefinition interfaceTypeDefinition in implementedInterfaces)
            {
                TypeDefinition currentInterface = interfaceTypeDefinition;
                do
                {
                    foreach (MethodDefinition methodToBeImplemented in currentInterface.Methods)
                    {
                        methodsToBeImplemented.Add(methodToBeImplemented, currentInterface);
                        methodNamesToBeImplemented[methodToBeImplemented.Name].Add(methodToBeImplemented);

                    }

                    TypeReference baseIFaceTypeReference = currentInterface.BaseType;
                    if (baseIFaceTypeReference != null)
                    {
                        currentInterface = ReferenceResolver.ResolveTypeReference(baseIFaceTypeReference, _assemblyCompileInfo.Assembly.Resolver);
                        continue;
                    }
                } while (false);
            }

            // now update the interface map, add new slots, and override slots in the vtable
            foreach (MethodDefinition methodDefinition in type.Methods)
            {
                if (HasDummyAttribute(methodDefinition))
                {
                    continue;
                }

                Set<MethodDefinition> methodsToBeImplementedMatchedByName;
                MethodDefinition methodToBeImplemented = null;
                if (methodNamesToBeImplemented.TryGetValue(methodDefinition.Name, out methodsToBeImplementedMatchedByName))
                {
                    foreach (MethodDefinition methodToBeImplemented2 in methodsToBeImplementedMatchedByName)
                    {
                        if (MethodSignatureEquals(methodDefinition, methodToBeImplemented2))
                        {
                            methodToBeImplemented = methodToBeImplemented2;
                            TypeDefinition interfaceType = methodsToBeImplemented[methodToBeImplemented];
                            if (!vtable.InterfaceMap.ContainsKey(interfaceType))
                            {
                                vtable.InterfaceMap[interfaceType] = new Dictionary<MethodDefinition, MethodDefinition>();
                            }
                            vtable.InterfaceMap[interfaceType][methodToBeImplemented] = methodDefinition;
                            methodsToBeImplemented.Remove(methodToBeImplemented);
                            break;
                        }
                    }
                    if (methodToBeImplemented != null)
                    {
                        methodNamesToBeImplemented[methodToBeImplemented.Name].Remove(methodToBeImplemented);
                    }
                }
                if (methodDefinition.IsVirtual)
                {
                    if (methodDefinition.IsNewSlot)
                    {
                        vtable.Slots.Add(methodDefinition);
                    }
                    else
                    {
                        // search the vtable for a slot that this method should override
                        bool foundSlot = false;
                        for (int i = 0; i < vtable.Slots.Count; i++)
                        {
                            MethodDefinition slotMethodDefinition = vtable.Slots[i];

                            // see if methodDefinition overrides slotMethodDefinition
                            if (MethodSignatureEquals(methodDefinition, slotMethodDefinition))
                            {
                                vtable.Slots[i] = methodDefinition;
                                foundSlot = true;
                                break;
                            }
                        }
                        if (!foundSlot)
                        {
                            throw new CompilerException(string.Format("Could not setup VTable for type {0}.  Could not find slot for method {1}", type, methodDefinition));
                        }
                    }
                }
            }

            // TODO: We should assert that there are no unimplemented abstract/interface methods
            //Debug.Assert(methodsToBeImplemented.Count == 0);

            // only do the following if this vtable belongs to the assembly we are compiling
            if (type.Module.Assembly == _assemblyCompileInfo.Assembly && !HasDummyAttribute(type))
            {

                // find static constructors
                foreach (MethodDefinition constructor in type.Constructors)
                {
                    if (constructor.IsStatic)
                    {
                        _staticConstructors.Add(constructor);
                    }
                }

                // set data pointer
                _vtableDataPointerMap[vtable] = (uint)_dataStore.Count;

                // add to data store
                _dataStore.Add(vtable);

                // hookup base type
                if (type.BaseType != null &&
                    !HasDummyAttribute(ReferenceResolver.ResolveTypeReference(type.BaseType, _assemblyCompileInfo.Assembly.Resolver)))
                {
                    _initializationSectionFormatter.Write("_[");
                    AddVTableDataPointerFixup(type, _initializationSectionFormatter.GetOffset(), ImageFormat.FixupType.InitializationSection);
                    _initializationSectionFormatter.Write("].b = _[");
                    AddVTableDataPointerFixup(type.BaseType, _initializationSectionFormatter.GetOffset(), ImageFormat.FixupType.InitializationSection);
                    _initializationSectionFormatter.Write("];");
                    if (DebugSettings.CommentCode)
                    {
                        _initializationSectionFormatter.Write("// ");
                        _initializationSectionFormatter.Write(type.ToString());
                        _initializationSectionFormatter.Write(" extends ");
                        _initializationSectionFormatter.Write(type.BaseType.ToString());
                    }
                    _initializationSectionFormatter.WriteLine();
                }

                // set intrinsic vtable
                CustomAttribute intrinsicAttribute;
                if (AttributeHelper.TryGetCustomAttribute(type, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
                {
                    // TODO: create function to get relevant information from intrinsic attribute
                    string intrinsicName;
                    bool useGlobalNamespace;
                    bool setVTable;
                    if (intrinsicAttribute.ConstructorParameters.Count > 0)
                    {
                        intrinsicName = (string)intrinsicAttribute.ConstructorParameters[0];
                    }
                    else if (intrinsicAttribute.Properties.Contains("Name"))
                    {
                        intrinsicName = (string)intrinsicAttribute.Properties["Name"];
                    }
                    else
                    {
                        intrinsicName = type.Name;
                    }

                    if (intrinsicAttribute.Properties.Contains("UseGlobalNamespace"))
                    {
                        useGlobalNamespace = (bool)intrinsicAttribute.Properties["UseGlobalNamespace"];
                    }
                    else
                    {
                        useGlobalNamespace = false;
                    }
                    if (!useGlobalNamespace)
                    {
                        intrinsicName = type.Namespace + "." + intrinsicName;
                    }
                    if (intrinsicAttribute.Properties.Contains("SetVTable") && (bool)intrinsicAttribute.Properties["SetVTable"] == true)
                    {
                        setVTable = true;
                    }
                    else
                    {
                        setVTable = false;
                    }

                    if (setVTable)
                    {
                        _initializationSectionFormatter.Write(intrinsicName);
                        _initializationSectionFormatter.Write(".prototype.$ = _[");
                        AddVTableDataPointerFixup(type, _initializationSectionFormatter.GetOffset(), ImageFormat.FixupType.InitializationSection);
                        _initializationSectionFormatter.Write("];");
                        _initializationSectionFormatter.WriteLine();
                    }
                }
            }
        }

        private bool MethodSignatureEquals(MethodDefinition a, MethodDefinition b)
        {
            if (a.Name == b.Name)
            {
                if (ReferenceComparer.TypeReferenceEquals(a.ReturnType.ReturnType, b.ReturnType.ReturnType))
                {
                    if (a.Parameters.Count == b.Parameters.Count)
                    {
                        bool passedParameterCheck = true;
                        for (int j = 0; j < a.Parameters.Count; j++)
                        {
                            if (!ReferenceComparer.ParameterReferenceEquals(a.Parameters[j], b.Parameters[j]))
                            {
                                passedParameterCheck = false;
                                break;
                            }
                        }
                        if (passedParameterCheck)
                        {
                            return true;
                        }
                    }
                }
            }

            return false;
        }

        private void SetupFieldLayoutAndAddStaticFieldsToDataStore(TypeDefinition typeDefinition)
        {

            Dictionary<FieldDefinition, uint> fieldLayout = new Dictionary<FieldDefinition, uint>();
            uint fieldOffsetCounter = 0;
            if (typeDefinition.BaseType != null)
            {
                // setup base type field layout and copy layout to this type
                TypeDefinition baseType = ReferenceResolver.ResolveTypeReference(typeDefinition.BaseType, _assemblyCompileInfo.Assembly.Resolver);
                Dictionary<FieldDefinition, uint> baseFieldLayout = GetFieldLayout(baseType);
                fieldOffsetCounter += (uint)baseFieldLayout.Count;
                foreach (KeyValuePair<FieldDefinition, uint> slot in baseFieldLayout)
                {
                    fieldLayout.Add(slot.Key, slot.Value);
                }

            }

            // setup the fields that are declared in this type, adding them to the end of the field layout
            foreach (FieldDefinition fieldDefinition in typeDefinition.Fields)
            {
                if (fieldDefinition.DeclaringType.Module.Assembly == _assemblyCompileInfo.Assembly)
                {
                    if (fieldDefinition.IsStatic)
                    {
                        _staticFieldDataPointerMap[fieldDefinition] = (uint)_dataStore.Count;
                        _dataStore.Add(fieldDefinition);
                    }
                    else
                    {
                        fieldLayout[fieldDefinition] = fieldOffsetCounter++;
                    }
                }
                else
                {
                    // TODO: if the declaring type is defined in another assembly, fetch the field layout from the other object image

                    // for now, just calculate it the same way we do fields that belong to this assembly:
                    if (fieldDefinition.IsStatic)
                    {
                        _staticFieldDataPointerMap[fieldDefinition] = (uint)_dataStore.Count;
                        _dataStore.Add(fieldDefinition);
                    }
                    else
                    {
                        fieldLayout[fieldDefinition] = fieldOffsetCounter++;
                    }
                }
            }
            _fieldLayoutMap[typeDefinition] = fieldLayout;
        }
        #endregion

        #region Generate CodeObject

        #region Preemptive
        private const string ControlLabel = "$ctrl";
        private int GetCurrentMethodFrameSize()
        {
            return (int)FrameSlot.Max + _methodCompileInfo.Method.Parameters.Count + _methodCompileInfo.LocalMap.Count;
        }
        private void GeneratePreemptiveCodeObject()
        {
            // TODO: Merge this method with GenerateNonPreemptiveCodeObjectWithExecutionBlocks.  Use a boolean to indicate preemptive/non-preemptive
            BlockStatement mainBlock = new BlockStatement();

            if (CurrentMethodIsCriticalSection())
            {
                // TODO: call enter critical section
            }

            #region initialize registers and frame

            // if the execution pointer is 0, this is a direct invocation, not a reinvocation from context switch
            // in this case, we need to setup the frame
            ConditionStatement checkExecutionPointerIsZeroConditionStatement = new ConditionStatement();
            checkExecutionPointerIsZeroConditionStatement.Condition = new BinaryExpression(new ExecutionPointerSpecialRegisterReferenceExpression(), BinaryOperator.IdentityEquality, 0.ToExpression());

            // load parameters that are mapped to registers
            // this only occurs if we have just been called, not after a context switch

            Set<int> initializedRegisters = new Set<int>();
            foreach (ParameterDefinition parameterDefinition in _methodCompileInfo.Method.Parameters)
            {
                int register;
                // and make sure we're not restoring a register we already have restored
                if (_methodCompileInfo.RegisterMap.TryGetValue(parameterDefinition.Name, out register) && !initializedRegisters.Contains(register))
                {
                    AddCode(checkExecutionPointerIsZeroConditionStatement.Then, new RestoreRegisterStatement(register, parameterDefinition.Sequence - 1 + (int)FrameSlot.Max));
                    initializedRegisters.Add(register);
                }
            }

            AddCode(checkExecutionPointerIsZeroConditionStatement.Then, new AssignStatement(new FrameSlotReferenceExpression(FrameSlot.This), new ThisReferenceExpression()));
            AddCode(checkExecutionPointerIsZeroConditionStatement.Then, new AssignStatement(new FrameSlotReferenceExpression(FrameSlot.Function), new DynamicExpression(delegate()
            {
                _codeFormatter.Write("arguments.callee");
            })));
            AddCode(checkExecutionPointerIsZeroConditionStatement.Then, new AssignStatement(new SpecialRegisterReferenceExpression(SpecialRegister.ExecutionPointer), 1.ToExpression()));

            AddCode(mainBlock, checkExecutionPointerIsZeroConditionStatement);

            if (CurrentMethodIsCriticalSection())
            {
                // TODO: Use code model here
                AddCode(mainBlock, new AssignStatement(new SpecialRegisterReferenceExpression(SpecialRegister.TimeSliceEnd), new DynamicExpression(delegate()
                {
                    _codeFormatter.Write("Number.POSITIVE_INFINITY");
                })));
            }
            #endregion

            // main control loop and execution pointer switch statement
            LabeledStatement labeledStatement = new LabeledStatement(ControlLabel);
            DoStatement controlLoop = new DoStatement(new BooleanLiteralExpression(true));

            AddCheckTimeSliceCode(controlLoop.Body);

            ITryCatchFinallyStatement tryCatchFinallyStatement = new TryCatchFinallyStatement();

            #region main switch
            SwitchStatement switchStatement = new SwitchStatement();
            switchStatement.Expression = new ExecutionPointerSpecialRegisterReferenceExpression();

            // set up execution pointers
            int executionPointerCounter;
            Dictionary<CFGNode, int> executionPointerMap = GenerateExecutionPointerMap(out executionPointerCounter);

            List<IConditionCase> dynamicallyGeneratedExecutionBlocks = new List<IConditionCase>();

            // generate code for each execution block
            foreach (KeyValuePair<CFGNode, int> executionPointerMapping in executionPointerMap)
            {
                CFGNode node = executionPointerMapping.Key;
                int currentExecutionPointer = executionPointerMapping.Value;

                ConditionCase conditionCase = new ConditionCase();
                conditionCase.Condition = new Int32LiteralExpression(currentExecutionPointer);

                BlockStatement block = new BlockStatement();
                conditionCase.Body = block;

                #region insert exception handling code at beginning of try/catch/finally blocks

                // beginning of try block?
                TryBlockInfo tryBlockInfo = GetTryBlockInfoIfIsTryBlockStartNode(node);
                if (tryBlockInfo != null)
                {
                    // set ecp to catch, or finally block at beginning of try block
                    if (tryBlockInfo.ConsolidatedCatchBlock != null)
                    {
                        AddSetExecutionCatchPointerCode(block, tryBlockInfo.ConsolidatedCatchBlock.Start, executionPointerMap);
                    }
                    else
                    {
                        AddSetExecutionCatchPointerCode(block, tryBlockInfo.FinallyBlock.Start, executionPointerMap);
                    }
                }
                else
                {
                    // beginning of catch block?
                    tryBlockInfo = GetTryBlockInfoIfIsCatchBlockStartNode(node);
                    if (tryBlockInfo != null)
                    {
                        // set ecp to to finally (or closest parent catch/finally) at beginning of catch block
                        if (tryBlockInfo.FinallyBlock != null)
                        {
                            // set ecp to finally block
                            AddSetExecutionCatchPointerCode(block, tryBlockInfo.FinallyBlock.Start, executionPointerMap);
                        }
                        else
                        {
                            CFGNodeCluster parentCatchOrFinallyBlock = GetClosestParentCatchOrFinallyBlock(tryBlockInfo);
                            if (parentCatchOrFinallyBlock != null)
                            {
                                // set ecp to parent catch/finally block
                                AddSetExecutionCatchPointerCode(block, parentCatchOrFinallyBlock.Start, executionPointerMap);
                            }
                            else
                            {
                                // clear ecp
                                AddClearExecutionCatchPointerCode(block);
                            }
                        }
                    }
                    else
                    {
                        // beginning of finally block?
                        tryBlockInfo = GetTryBlockInfoIfIsFinallyBlockStartNode(node);
                        if (tryBlockInfo != null)
                        {
                            // set ecp to closest parent catch/finally at beginning of finally block
                            CFGNodeCluster parentCatchOrFinallyBlock = GetClosestParentCatchOrFinallyBlock(tryBlockInfo);
                            if (parentCatchOrFinallyBlock != null)
                            {
                                // set ecp to parent catch/finally block
                                AddSetExecutionCatchPointerCode(block, parentCatchOrFinallyBlock.Start, executionPointerMap);
                            }
                            else
                            {
                                // clear ecp
                                AddClearExecutionCatchPointerCode(block);
                            }
                        }
                    }
                }

                #endregion

                CollectionHelper.AddRange<IStatement>(conditionCase.Body.Statements, node.BasicBlock.Statements); // TODO: generate code for this block

                // TODO: can we order execution blocks in order to maximize the amount of fall throughs we can do? we currently use topological order.  should we leave this up to DynamO?

                switch (node.FlowControl)
                {
                    case FlowControl.Next:
                        {
                            Debug.Assert(node.SuccessorCount == 1, _methodCompileInfo.ToString() + ": " + node);

                            int nextExecutionPointer = executionPointerMap[node.Successors[0]];

                            if (nextExecutionPointer == currentExecutionPointer + 1)
                            {
                                // can fall through to next execution block
                                AddSetExecutionPointerCode(block, nextExecutionPointer);
                                AddCheckTimeSliceCode(block); // obviously, only fall through if time slice is not done
                            }
                            else
                            {
                                // can't fall through
                                AddGotoExecutionBlockCode(block, nextExecutionPointer);
                            }
                            break;
                        }
                    case FlowControl.Branch:
                        {
                            AddGotoExecutionBlockCode(block, executionPointerMap[node.Successors[0]]);
                            break;
                        }
                    case FlowControl.ConditionalBranch:
                        {
                            ConditionStatementPattern conditionStatementPattern = new ConditionStatementPattern(_methodCompileInfo);
                            conditionStatementPattern.WorkingSet = _methodCompileInfo.ForwardOnlyTransitiveClosure[node].Clone();
                            conditionStatementPattern.WorkingSet.Add(node);
                            if (false && conditionStatementPattern.Match(node)) // TODO: Inlined condition statements
                            {
                                ConditionStatement conditionStatement = (ConditionStatement)conditionStatementPattern.GenerateCode();

                                ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = null;

                                foreach (CFGEdge edge in _cfg.OutEdges(node))
                                {
                                    if (conditionalBranchExpressionStatement == null)
                                    {
                                        conditionalBranchExpressionStatement = (ConditionalBranchExpressionStatement)edge.BranchCondition.Data;
                                    }
                                    else
                                    {
                                        Debug.Assert(conditionalBranchExpressionStatement.Equals((ConditionalBranchExpressionStatement)edge.BranchCondition.Data));
                                    }
                                }
                                Debug.Assert(conditionalBranchExpressionStatement != null);

                                // remove the condition branch binaryExpression statement from the block
                                CodeUtility.MatchAndReplaceCode<IStatement>(block,
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return codeObject.Equals(conditionalBranchExpressionStatement);
                                    },
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return new NopStatement();
                                    },
                                    false);

                                conditionStatement.Condition = conditionalBranchExpressionStatement.Expression;
                                AddCode(block, conditionStatement);
                            }
                            else
                            {
                                // TODO: Try to match a switch statement here
                                // TODO: Generate appropriate code if the branch conditions are switch case conditions 
                                ConditionStatement conditionStatement = new ConditionStatement();

                                int thenExecutionPointer = -1;
                                int elseExecutionPointer = -1;
                                ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = null;

                                foreach (CFGEdge edge in _cfg.OutEdges(node))
                                {
                                    if (edge.BranchCondition.Type == BranchConditionType.True)
                                    {
                                        thenExecutionPointer = executionPointerMap[edge.Target];
                                    }
                                    else if (edge.BranchCondition.Type == BranchConditionType.False)
                                    {
                                        elseExecutionPointer = executionPointerMap[edge.Target];
                                    }
                                    else
                                    {
                                        throw new NotImplementedException();
                                    }

                                    if (conditionalBranchExpressionStatement == null)
                                    {
                                        conditionalBranchExpressionStatement = (ConditionalBranchExpressionStatement)edge.BranchCondition.Data;
                                    }
                                    else
                                    {
                                        Debug.Assert(conditionalBranchExpressionStatement.Equals((ConditionalBranchExpressionStatement)edge.BranchCondition.Data));
                                    }
                                }
                                Debug.Assert(conditionalBranchExpressionStatement != null, _methodCompileInfo.ToString() + ": " + node);
                                Debug.Assert(thenExecutionPointer != -1, _methodCompileInfo.ToString() + ": " + node);
                                //Debug.Assert(elseExecutionPointer != -1, _methodCompileInfo.ToString() + ": " + node); // TODO: Shouldn't we always have an else block?

                                // remove the condition branch binaryExpression statement from the block
                                CodeUtility.MatchAndReplaceCode<IStatement>(block,
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return codeObject == conditionalBranchExpressionStatement;
                                    },
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return new NopStatement();
                                    },
                                    false);

                                conditionStatement.Condition = conditionalBranchExpressionStatement.Expression;

                                if (thenExecutionPointer == currentExecutionPointer + 1)
                                {
                                    // fall through optimization
                                    AddSetExecutionPointerCode(conditionStatement.Then, thenExecutionPointer);
                                    AddCheckTimeSliceCode(conditionStatement.Then);
                                }
                                else
                                {
                                    AddGotoExecutionBlockCode(conditionStatement.Then, thenExecutionPointer);
                                }

                                if (elseExecutionPointer == currentExecutionPointer + 1)
                                {
                                    // fall through optimization
                                    // TODO: for fall through optimization, if the execution block we are falling through to cannot cause a context switch, don't update the execution pointer
                                    AddSetExecutionPointerCode(conditionStatement.Else, elseExecutionPointer);
                                    AddCheckTimeSliceCode(conditionStatement.Else);
                                }
                                else
                                {
                                    AddGotoExecutionBlockCode(conditionStatement.Else, elseExecutionPointer);
                                }

                                AddCode(block, conditionStatement);
                            }
                            break;
                        }
                    case FlowControl.Call:
                        {
                            Debug.Assert(node.SuccessorCount == 1);
                            // TODO: Allow methods and scopes to be declared non-premptive (critical sections)
                            CFGNode nextNode = node.Successors[0];
                            BasicBlock nextBlock = nextNode.BasicBlock;
                            int nextExecutionPointer = executionPointerMap[nextNode];
                            bool canFallThrough = nextExecutionPointer == currentExecutionPointer + 1;

                            // last statement should be a method invocation, fix up the return value to be stored in the return value special register
                            IStatement lastStatement = block.Statements[block.Statements.Count - 1];
                            IAssignStatement assignStatement = lastStatement as IAssignStatement;
                            if (assignStatement != null && assignStatement.Expression is IMethodInvokeExpression)
                            {
                                bool fetchReturnValue = true;
                                IMethodInvokeExpression methodInvokeExpression = (IMethodInvokeExpression)assignStatement.Expression;
                                IMethodReferenceExpression methodReferenceExpression = methodInvokeExpression.Method as IMethodReferenceExpression;

                                if (methodReferenceExpression != null)
                                {
                                    MethodDefinition methodDefinition;
                                    if ((CoreTypes.IsVoid(methodReferenceExpression.Method.ReturnType.ReturnType) || (ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, _assemblyCompileInfo.Assembly.Resolver, out methodDefinition) && HasInlineImplementation(methodDefinition))))
                                    {
                                        fetchReturnValue = false;
                                    }
                                }

                                if (fetchReturnValue)
                                {
                                    /**
                                     * if we're storing to a $ts register, and the next block has another predecessor,
                                     * we would be overwriting the other possible $ts value.  to get around this
                                     * we insert a block in between this block and the next, and "fetch the return value" there
                                     * 
                                     * TODO: Ensure that there are no other cases where register overwriting won't happen
                                     */
                                    bool insertFetchReturnValueNode = false;
                                    if (nextNode.PredecessorCount > 1)
                                    {
                                        IVariableReferenceExpression variableReferenceExpression = assignStatement.Target as IVariableReferenceExpression;
                                        if (variableReferenceExpression != null && variableReferenceExpression.Variable.Name.StartsWith("$ts")) // TODO: Use VariableHelper for $ts identification
                                        {
                                            // ok we need to insert another block rather than putting the code in the next block
                                            insertFetchReturnValueNode = true;
                                        }
                                    }

                                    // fix code in this block to put return value in return value register, rather than in its original target
                                    block.Statements[block.Statements.Count - 1] = new AssignStatement(new SpecialRegisterReferenceExpression(SpecialRegister.ReturnValue), assignStatement.Expression);

                                    IAssignStatement fetchReturnValueAssignStatement = new AssignStatement(assignStatement.Target, new SpecialRegisterReferenceExpression(SpecialRegister.ReturnValue));

                                    if (insertFetchReturnValueNode)
                                    {
                                        // build the new execution block to fetch the return value

                                        int newExecutionPointer = executionPointerCounter++;
                                        IConditionCase fetchReturnValueSwitchCase = new ConditionCase(new Float32LiteralExpression(newExecutionPointer));
                                        fetchReturnValueSwitchCase.Body.Statements.Add(fetchReturnValueAssignStatement);

                                        // fix up execution pointers
                                        // the new "fetch return value block should set its next execution pointer to the next block
                                        InsertSetExecutionPointerCode(0, fetchReturnValueSwitchCase.Body, nextExecutionPointer);
                                        nextExecutionPointer = newExecutionPointer;

                                        // in the event that the called method doesn't cause a context switch
                                        // we'll just fall through to the next block
                                        if (canFallThrough)
                                        {
                                            // if we are falling through to next execution block, we need to make sure the time slice is not done
                                            AddCheckTimeSliceCode(fetchReturnValueSwitchCase.Body);
                                        }
                                        else
                                        {
                                            // otherwise, continue control loop
                                            AddContinueControlLoopCode(fetchReturnValueSwitchCase.Body);
                                        }

                                        canFallThrough = true;

                                        dynamicallyGeneratedExecutionBlocks.Add(fetchReturnValueSwitchCase);
                                    }
                                    else
                                    {
                                        // add code to next block to get return value
                                        nextBlock.Statements.Insert(0, fetchReturnValueAssignStatement);
                                    }
                                }
                            }

                            InsertSetExecutionPointerCode(0, block, nextExecutionPointer);

                            // in the event that the called method doesn't cause a context switch
                            // we'll just fall through to the next block
                            if (canFallThrough)
                            {
                                // if we are falling through to next execution block, we need to make sure the time slice is not done
                                AddCheckTimeSliceCode(block);
                            }
                            else
                            {
                                // otherwise, continue control loop
                                AddContinueControlLoopCode(block);
                            }
                            break;
                        }
                }

                switchStatement.Cases.Add(conditionCase);

                foreach (IConditionCase executionBlock in dynamicallyGeneratedExecutionBlocks)
                {
                    switchStatement.Cases.Add(executionBlock);
                }
                dynamicallyGeneratedExecutionBlocks.Clear();
            }

            #region default case - invalid execution pointer
            DefaultCase defaultCase = new DefaultCase();

            // TODO: throw an execution engine exception
            DynamicExpression createInvalidExecutionPointerErrorExpression = new DynamicExpression(delegate()
            {
                _codeFormatter.Write("new Error(\"Invalid execution pointer\")");
            });
            ThrowExceptionStatement throwInvalidExecutionPointerErrorStatement = new ThrowExceptionStatement(createInvalidExecutionPointerErrorExpression);
            defaultCase.Body.Statements.Add(throwInvalidExecutionPointerErrorStatement);
            switchStatement.Cases.Add(defaultCase);
            #endregion

            AddCode(tryCatchFinallyStatement.Try, switchStatement);
            #endregion

            ICatchClause catchClause = new CatchClause();
            catchClause.Variable = new PseudoVariableDefinition("$e"); // TODO: extract out into constant

            // TODO: Check whether the thrown object is null

            // continuation thrown?
            /**
             * Since managed objects are arrays and so are continuations, we differentiate them by checking whether
             * the they have a vtable.  Managed objects have a vtable, continuations don't.*/
            ConditionStatement checkIfContinuationConditionStatement = new ConditionStatement();
            BinaryExpression isNotNullExpression = new BinaryExpression(new VariableReferenceExpression(catchClause.Variable), BinaryOperator.IdentityInequality, new NullLiteralExpression());
            BinaryExpression hasVTableExpression = new BinaryExpression(new DynamicExpression(delegate()
            {
                EmitExpressionCode(new VariableReferenceExpression(catchClause.Variable));
                _codeFormatter.Write(".$");
            }), BinaryOperator.IdentityEquality, new NullLiteralExpression());
            BinaryExpression isContinuationExpression = new BinaryExpression(isNotNullExpression, BinaryOperator.BooleanAnd, hasVTableExpression);
            checkIfContinuationConditionStatement.Condition = isContinuationExpression;
            AddCode(checkIfContinuationConditionStatement.Then, new NativeThrowExceptionStatement(new VariableReferenceExpression(catchClause.Variable)));
            AddCode(catchClause.Body, checkIfContinuationConditionStatement);

            // exception must have been thrown

            #region set throw context in exception, if it is not yet set
            // if the throw context was already set, this exception was thrown further up the stack
            IVariableReferenceExpression caughtVariableReferenceExpression = new VariableReferenceExpression(catchClause.Variable);

            // convert to a managed exception if it's not already one
            MethodInvokeExpression getUnhandledExceptionMethodInvokeExpression = new MethodInvokeExpression(new MethodReferenceExpression(new TypeReferenceExpression(KernelSchedulerType), KernelConvertToManagedExceptionMethod));
            getUnhandledExceptionMethodInvokeExpression.Arguments.Add(caughtVariableReferenceExpression);
            AssignStatement getUnhandledExceptionAssignStatement = new AssignStatement(caughtVariableReferenceExpression, getUnhandledExceptionMethodInvokeExpression);
            AddCode(catchClause.Body, getUnhandledExceptionAssignStatement);

            IConditionStatement ifThrowContextIsNotSetConditionStatement = new ConditionStatement();
            ifThrowContextIsNotSetConditionStatement.Condition = new BinaryExpression(new FieldReferenceExpression(caughtVariableReferenceExpression, OSCorlibExceptionThrowContextField), BinaryOperator.IdentityEquality, new NullLiteralExpression());

            AddCode(ifThrowContextIsNotSetConditionStatement.Then, new AssignStatement(new FieldReferenceExpression(caughtVariableReferenceExpression, OSCorlibExceptionThrowContextField), new ContinuationObjectExpression()));
            AddCode(catchClause.Body, ifThrowContextIsNotSetConditionStatement);
            #endregion

            // is ecp not set?
            ConditionStatement checkEcpConditionStatement = new ConditionStatement();
            checkEcpConditionStatement.Condition = new UnaryExpression(new FramePropertyReferenceExpression(FrameProperty.ExceptionCatchPointer), UnaryOperator.BooleanNot);
            AddCode(checkEcpConditionStatement.Then, new NativeThrowExceptionStatement(new VariableReferenceExpression(catchClause.Variable)));
            AddCode(catchClause.Body, checkEcpConditionStatement);

            // set execution pointer to ecp
            AddCode(catchClause.Body, new AssignStatement(new ExecutionPointerSpecialRegisterReferenceExpression(), new FramePropertyReferenceExpression(FrameProperty.ExceptionCatchPointer)));

            // set exception to caught exception
            AddCode(catchClause.Body, new AssignStatement(new FramePropertyReferenceExpression(FrameProperty.Exception), caughtVariableReferenceExpression));

            tryCatchFinallyStatement.CatchClauses.Add(catchClause);

            AddCode(controlLoop.Body, tryCatchFinallyStatement);

            labeledStatement.Statement = controlLoop;
            AddCode(mainBlock, labeledStatement);


            if (CurrentMethodIsCriticalSection())
            {
                // TODO: call leave critical section
            }

            _methodCompileInfo.CodeObject = mainBlock;
        }

        private void AddCheckTimeSliceCode(IBlockStatement block)
        {
            if (CurrentMethodIsCriticalSection())
            {
                return;
            }
            ConditionStatement conditionStatement = new ConditionStatement(new DynamicExpression(delegate()
            {
                _codeFormatter.Write("0 > ");
                _codeFormatter.Write(SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.TimeSliceEnd));
                _codeFormatter.Write("--");
            }));

            AddCode(conditionStatement.Then, new NativeThrowExceptionStatement(new ContinuationObjectExpression()));
            AddCode(block, conditionStatement);
        }
        #endregion

        #region Non-preemptive
        private bool TryGenerateNonPreemptiveCodeObject()
        {
            CostRestrictedBlockStatementPattern blockStatementPattern = new Rules.Patterns.CodeGeneration.CostRestrictedBlockStatementPattern(_methodCompileInfo);
            blockStatementPattern.MaxCost = int.MaxValue; // TODO: UnrestrictedBlockStatement pattern should be used here, int.MaxValue adds an artificial limit on code size

            bool matchedAllNodes = false;
            Set<CFGNode> allNodes = new Set<CFGNode>();
            foreach (CFGNode node in _methodCompileInfo.CFG.Vertices)
            {
                allNodes.Add(node);
            }
            blockStatementPattern.Matched += delegate(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
            {
                matchedAllNodes = (args.Match.MatchedNodes == allNodes);
            };
            if (blockStatementPattern.Match(_methodCompileInfo.TopologicalSort[0])) // TODO: what if topological sort is empty?
            {
                if (!matchedAllNodes)
                {
                    return false;
                }
                _methodCompileInfo.CodeObject = (IBlockStatement)blockStatementPattern.GenerateCode();
                if (CurrentMethodIsCriticalSection())
                {
                    // TODO: insert call to enter critical section at beginning
                    // TODO: add call to leave critical section at end
                }
                return true;
            }
            else
            {
                return false;
            }

        }
        private void GenerateNonPreemptiveCodeObjectWithExecutionBlocks()
        {
            // TODO: try/catch/finally support for non-preemptive code object with execution blocksten
            BlockStatement mainBlock = new BlockStatement();

            if (CurrentMethodIsCriticalSection())
            {
                // TODO: call enter critical section
            }

            AddCode(mainBlock, new ExpressionStatement(new DynamicExpression(delegate()
            {
                // TODO: Use code model here
                _codeFormatter.Write("var " + SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ExecutionPointer) + " = 1");
            })));

            // main control loop and execution pointer switch statement
            LabeledStatement labeledStatement = new LabeledStatement(ControlLabel);
            DoStatement controlLoop = new DoStatement(new BooleanLiteralExpression(true));

            #region main switch
            SwitchStatement switchStatement = new SwitchStatement();
            switchStatement.Expression = new ExecutionPointerSpecialRegisterReferenceExpression();

            // set up execution pointers
            int executionPointerCounter;
            Dictionary<CFGNode, int> executionPointerMap = GenerateExecutionPointerMap(out executionPointerCounter);

            // generate code for each execution block
            foreach (KeyValuePair<CFGNode, int> executionPointerMapping in executionPointerMap)
            {
                CFGNode node = executionPointerMapping.Key;
                int currentExecutionPointer = executionPointerMapping.Value;

                ConditionCase conditionCase = new ConditionCase();
                conditionCase.Condition = new Int32LiteralExpression(currentExecutionPointer);

                BlockStatement block = new BlockStatement();
                conditionCase.Body = block;
                CollectionHelper.AddRange<IStatement>(conditionCase.Body.Statements, node.BasicBlock.Statements); // TODO: generate code for this block

                // TODO: can we order execution blocks in order to maximize the amount of fall throughs we can do? we currently use topological order

                switch (node.FlowControl)
                {
                    case FlowControl.Next:
                        {
                            Debug.Assert(node.SuccessorCount == 1);
                            int nextExecutionPointer = executionPointerMap[node.Successors[0]];

                            if (nextExecutionPointer == currentExecutionPointer + 1)
                            {
                                // can fall through to next execution block
                                AddSetExecutionPointerCode(block, nextExecutionPointer);
                            }
                            else
                            {
                                // can't fall through
                                AddGotoExecutionBlockCode(block, nextExecutionPointer);
                            }
                            break;
                        }
                    case FlowControl.Branch:
                        {
                            Debug.Assert(node.SuccessorCount == 1);
                            AddGotoExecutionBlockCode(block, executionPointerMap[node.Successors[0]]);
                            break;
                        }
                    case FlowControl.ConditionalBranch:
                        {
                            Rules.Patterns.CodeGeneration.ConditionStatementPattern conditionStatementPattern = new XaeiO.Compiler.Rules.Patterns.CodeGeneration.ConditionStatementPattern(_methodCompileInfo);
                            conditionStatementPattern.WorkingSet = _methodCompileInfo.ForwardOnlyTransitiveClosure[node].Clone();
                            conditionStatementPattern.WorkingSet.Add(node);
                            Set<CFGNode> matchedNodes = null;
                            conditionStatementPattern.Matched += delegate(object sender, PatternMatchEventArgs<CFGPatternMatch> match)
                            {
                                matchedNodes = match.Match.MatchedNodes;
                            };
                            if (false && conditionStatementPattern.Match(node)) // TODO: Removing matched nodes from working set
                            {
                                ConditionStatement conditionStatement = (ConditionStatement)conditionStatementPattern.GenerateCode();

                                ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = null;

                                foreach (CFGEdge edge in _cfg.OutEdges(node))
                                {
                                    if (conditionalBranchExpressionStatement == null)
                                    {
                                        conditionalBranchExpressionStatement = (ConditionalBranchExpressionStatement)edge.BranchCondition.Data;
                                    }
                                    else
                                    {
                                        Debug.Assert(conditionalBranchExpressionStatement.Equals((ConditionalBranchExpressionStatement)edge.BranchCondition.Data));
                                    }
                                }
                                Debug.Assert(conditionalBranchExpressionStatement != null);

                                // remove the condition branch binaryExpression statement from the block
                                CodeUtility.MatchAndReplaceCode<IStatement>(block,
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return codeObject.Equals(conditionalBranchExpressionStatement);
                                    },
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return new NopStatement();
                                    },
                                    false);

                                conditionStatement.Condition = conditionalBranchExpressionStatement.Expression;
                                AddCode(block, conditionStatement);
                            }
                            else
                            {
                                // TODO: Try to match a switch statement here
                                // TODO: Generate appropriate code if the branch conditions are switch case conditions 
                                ConditionStatement conditionStatement = new ConditionStatement();

                                int thenExecutionPointer = -1;
                                int elseExecutionPointer = -1;
                                ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = null;

                                foreach (CFGEdge edge in _cfg.OutEdges(node))
                                {
                                    if (edge.BranchCondition.Type == BranchConditionType.True)
                                    {
                                        thenExecutionPointer = executionPointerMap[edge.Target];
                                    }
                                    else if (edge.BranchCondition.Type == BranchConditionType.False)
                                    {
                                        elseExecutionPointer = executionPointerMap[edge.Target];
                                    }
                                    else
                                    {
                                        throw new NotImplementedException();
                                    }

                                    if (conditionalBranchExpressionStatement == null)
                                    {
                                        conditionalBranchExpressionStatement = (ConditionalBranchExpressionStatement)edge.BranchCondition.Data;
                                    }
                                    else
                                    {
                                        Debug.Assert(conditionalBranchExpressionStatement.Equals((ConditionalBranchExpressionStatement)edge.BranchCondition.Data));
                                    }
                                }
                                Debug.Assert(conditionalBranchExpressionStatement != null);
                                Debug.Assert(thenExecutionPointer != -1, "Expected thenExecutionPointer not to be -1", "Current method is: " + _methodCompileInfo.Method);
                                Debug.Assert(elseExecutionPointer != -1);

                                // remove the condition branch binaryExpression statement from the block
                                CodeUtility.MatchAndReplaceCode<IStatement>(block,
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return codeObject.Equals(conditionalBranchExpressionStatement);
                                    },
                                    delegate(IStatement codeObject, ICodeObject context)
                                    {
                                        return new NopStatement();
                                    },
                                    false);

                                conditionStatement.Condition = conditionalBranchExpressionStatement.Expression;

                                if (thenExecutionPointer == currentExecutionPointer + 1)
                                {
                                    // fall through optimization
                                    AddSetExecutionPointerCode(conditionStatement.Then, thenExecutionPointer);
                                }
                                else
                                {
                                    AddGotoExecutionBlockCode(conditionStatement.Then, thenExecutionPointer);
                                }

                                if (elseExecutionPointer == currentExecutionPointer + 1)
                                {
                                    // fall through optimization
                                    // TODO: for fall through optimization, if the execution block we are falling through to cannot cause a context switch, don't update the EP
                                    AddSetExecutionPointerCode(conditionStatement.Else, elseExecutionPointer);
                                }
                                else
                                {
                                    AddGotoExecutionBlockCode(conditionStatement.Else, elseExecutionPointer);
                                }

                                AddCode(block, conditionStatement);
                            }
                            break;
                        }
                    case FlowControl.Call:
                        {
                            // TODO: Share code between GenerateNonPreemptiveCodeObject and GeneratePreemptiveCodeObject
                            // TODO: Allow scopes to be declared non-premptive (critical sections)

                            // TODO: Build a successor and predecessor cache

                            Debug.Assert(node.SuccessorCount == 1);

                            CFGNode nextNode = node.Successors[0];
                            BasicBlock nextBlock = nextNode.BasicBlock;
                            int nextExecutionPointer = executionPointerMap[nextNode];

                            InsertSetExecutionPointerCode(0, block, nextExecutionPointer);

                            if (nextExecutionPointer != currentExecutionPointer + 1)
                            {
                                // otherwise, continue control loop
                                AddContinueControlLoopCode(block);
                            }
                            break;
                        }
                }

                switchStatement.Cases.Add(conditionCase);
            }

            #region default case - invalid execution pointer
            DefaultCase defaultCase = new DefaultCase();

            // TODO: throw an execution engine exception
            DynamicExpression createInvalidExecutionPointerErrorExpression = new DynamicExpression(delegate()
            {
                _codeFormatter.Write("new Error(\"Invalid execution pointer\")");
            });
            ThrowExceptionStatement throwInvalidExecutionPointerErrorStatement = new ThrowExceptionStatement(createInvalidExecutionPointerErrorExpression);
            defaultCase.Body.Statements.Add(throwInvalidExecutionPointerErrorStatement);
            switchStatement.Cases.Add(defaultCase);
            #endregion

            AddCode(controlLoop.Body, switchStatement);
            #endregion

            labeledStatement.Statement = controlLoop;
            AddCode(mainBlock, labeledStatement);

            if (CurrentMethodIsCriticalSection())
            {
                // TODO: call leave critical section
            }
            _methodCompileInfo.CodeObject = mainBlock;
        }

        #endregion

        private Dictionary<CFGNode, int> GenerateExecutionPointerMap(out int executionPointerCounter)
        {
            Dictionary<CFGNode, int> executionPointerMap = new Dictionary<CFGNode, int>();
            executionPointerCounter = 1;
            // start at root
            int startingTopologicalIndex = _methodCompileInfo.TopologicalOrder[_cfg.Root];
            for (int i = startingTopologicalIndex; i < _methodCompileInfo.TopologicalSort.Count; i++)
            {
                executionPointerMap[_methodCompileInfo.TopologicalSort[i]] = executionPointerCounter++;
            }
            for (int i = 0; i < startingTopologicalIndex; i++)
            {
                executionPointerMap[_methodCompileInfo.TopologicalSort[i]] = executionPointerCounter++;
            }
            return executionPointerMap;
        }

        private TryBlockInfo GetTryBlockInfoIfIsTryBlockStartNode(CFGNode node)
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                if (tryBlockInfo.TryBlock.Start == node)
                {
                    return tryBlockInfo;
                }
            }
            return null;
        }
        private TryBlockInfo GetTryBlockInfoIfIsCatchBlockStartNode(CFGNode node)
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                if (tryBlockInfo.ConsolidatedCatchBlock != null && tryBlockInfo.ConsolidatedCatchBlock.Start == node)
                {
                    return tryBlockInfo;
                }
            }
            return null;
        }
        private TryBlockInfo GetTryBlockInfoIfIsFinallyBlockStartNode(CFGNode node)
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                if (tryBlockInfo.FinallyBlock != null && tryBlockInfo.FinallyBlock.Start == node)
                {
                    return tryBlockInfo;
                }
            }
            return null;
        }
        private CFGNodeCluster GetClosestParentCatchOrFinallyBlock(TryBlockInfo tryBlockInfo)
        {
            if (tryBlockInfo.Parent != null)
            {
                TryBlockInfo currentTryBlockInfo = tryBlockInfo.Parent.TryBlockInfo;
                while (currentTryBlockInfo != null)
                {
                    if (currentTryBlockInfo.ConsolidatedCatchBlock != null)
                    {
                        return currentTryBlockInfo.ConsolidatedCatchBlock;
                    }
                    if (currentTryBlockInfo.FinallyBlock != null)
                    {
                        return currentTryBlockInfo.FinallyBlock;
                    }
                }
            }
            return null;
        }
        private void AddSetExecutionPointerCode(IBlockStatement block, int executionPointer)
        {
            AddCode(block, new SetExecutionPointerStatement(executionPointer));
        }
        private void InsertSetExecutionPointerCode(int index, IBlockStatement block, int executionPointer)
        {
            InsertCode(index, block, new SetExecutionPointerStatement(executionPointer));
        }
        private void AddGotoExecutionBlockCode(IBlockStatement block, int executionPointer)
        {
            AddCode(block, new SetExecutionPointerStatement(executionPointer));
            AddContinueControlLoopCode(block);
        }
        private void AddContinueControlLoopCode(IBlockStatement block)
        {
            AddCode(block, new LabeledContinueStatement(ControlLabel));
        }
        private void AddSetExecutionCatchPointerCode(IBlockStatement block, CFGNode targetNode, Dictionary<CFGNode, int> executionPointerMap)
        {
            AddCode(block, new AssignStatement(new FramePropertyReferenceExpression(FrameProperty.ExceptionCatchPointer), new Int32LiteralExpression(executionPointerMap[targetNode])));
        }
        private void AddClearExecutionCatchPointerCode(IBlockStatement block)
        {
            AddCode(block, new AssignStatement(new FramePropertyReferenceExpression(FrameProperty.ExceptionCatchPointer), new NullLiteralExpression()));
        }
        private void AddCode(IBlockStatement block, IStatement statement)
        {
            block.Statements.Add(statement);
        }
        private void InsertCode(int index, IBlockStatement block, IStatement statement)
        {
            block.Statements.Insert(index, statement);
        }
        private bool EmitRegisterSet()
        {
            return EmitRegisterSet(false);
        }
        private bool EmitRegisterSet(bool noFirstComma)
        {
            if (_methodCompileInfo.RegisterMap.Count > 0)
            {
                // make sure we don't add a register more than once
                Set<int> registerSet = new Set<int>();
                foreach (int register in _methodCompileInfo.RegisterMap.Values)
                {
                    if (!registerSet.Contains(register))
                    {
                        if (noFirstComma)
                        {
                            noFirstComma = false; // commas from now on
                        }
                        else
                        {
                            _codeFormatter.Write(",");
                        }
                        registerSet.Add(register);
                        _codeFormatter.Write("r");
                        _codeFormatter.Write(register);
                    }
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion

        #region Transformations

        #region GenerateExecutionBlocks

        /// <summary>
        /// Merges atomic blocks into basic blocks.
        /// </summary>
        /// <remarks>
        /// Invalidates most data in compile info: TopologicalSort, Liveness, etc.
        /// </remarks>
        private void GenerateExecutionBlocks()
        {
            // TODO: highly inefficient.  do this all in one pass
            bool didMerge;
            bool currentMethodIsNonPreemptive = CurrentMethodIsNonPreemptive();
            List<CFGNode> nodes = new List<CFGNode>(_methodCompileInfo.TopologicalSort);
            do
            {
                didMerge = false;
                for (int i = 0; i < nodes.Count; i++)
                {
                    CFGNode node = nodes[i];
                    if (node.SuccessorCount < 1)
                    {
                        continue;
                    }
                    if ((node.FlowControl == FlowControl.Next) ||
                        (node.FlowControl == FlowControl.Call && (currentMethodIsNonPreemptive || CallCannotCauseContextSwitch(node))))
                    {
                        CFGNode next = node.Successors[0];
                        if (next.Predecessors.Length == 1)
                        {
                            // TODO: cache calculated basic block of next block
                            // TODO: methodisnonpreemptive and currentmethodisnonpreemptive() should use some caching
                            if (currentMethodIsNonPreemptive || (CalculateBasicBlockCost(node.BasicBlock) + CalculateBasicBlockCost(next.BasicBlock) <= BasicBlockMaxCost))
                            {

                                // make sure these nodes dont start try/catch/finally block
                                if (!IsTryCatchFinallyStartOrEnd(node) && !IsTryCatchFinallyStartOrEnd(next))
                                {
                                    node.FlowControl = next.FlowControl;

                                    // merge node and next

                                    // copy next block into node block
                                    CollectionHelper.AddRange<IStatement>(node.BasicBlock.Statements, next.BasicBlock.Statements);

                                    // fix up edges
                                    List<CFGEdge> edges = new List<CFGEdge>();
                                    foreach (CFGEdge edge in _cfg.OutEdges(next))
                                    {
                                        edges.Add(edge);
                                    }
                                    foreach (CFGEdge edge in edges)
                                    {
                                        _cfg.AddEdge(node, edge.Target, edge.BranchCondition);
                                        _cfg.RemoveEdge(edge);
                                    }

                                    _cfg.RemoveEdge(_cfg.InEdges(next)[0]);

                                    // remove next from graph and node set
                                    _cfg.RemoveVertex(next);
                                    nodes.Remove(next);
                                    didMerge = true;
                                    break;
                                }
                            }
                        }
                    }
                }
            } while (didMerge);
        }
        #endregion

        private void ApplyRegisterAllocation()
        {
            // TODO: Make use of ApplyRegisterAllocation
            Set<string> variables = new Set<string>();
            Dictionary<string, TypeReference> types = new Dictionary<string, TypeReference>();
            // replace all occurrences of each register-mapped local to an actual local
            // also, keep track of all variables and add a set of declarations to the top of the method body
            CodeUtility.MatchAndReplaceCode<IVariableReferenceExpression>(_methodCompileInfo.CodeObject, delegate(IVariableReferenceExpression expression, ICodeObject context)
            {
                if (expression.Variable.Name.StartsWith("$r") || expression.Variable.Name.StartsWith("$l"))
                {
                    // there are already done
                    // TODO: can we assume that $r or $l will never show up as legitimate variable names?  We should either 1) replace all variable names that actually start with $r or $l before hand; or, 2) use a cache of variables we have encountered already
                    return false;
                }

                int registerNumber;
                if (_methodCompileInfo.RegisterMap.TryGetValue(expression.Variable.Name, out registerNumber))
                {
                    expression.Variable.Name = "$r" + registerNumber;
                    variables.Add(expression.Variable.Name);
                    types[expression.Variable.Name] = expression.Type;
                    return false;
                }

                int localNumber;
                // this may not happen if a transformation such as DuffsDevice adds a new temporary
                if ((_methodCompileInfo.LocalMap.TryGetValue(expression.Variable.Name, out localNumber)))
                {
                    expression.Variable.Name = "$l" + localNumber;
                }

                variables.Add(expression.Variable.Name);

                return false;

            }, delegate(IVariableReferenceExpression expression, ICodeObject context)
            {
                Debug.Assert(false);
                return null;
            }, true);

            foreach (string variable in variables)
            {
                IVariableDefinitionExpression vde = new VariableDefinitionExpression();
                VariableDefinition variableDefinition = new VariableDefinition(variable, _methodCompileInfo.Method.Body.Variables.Count, _methodCompileInfo.Method.Body.Method, (TypeReference)types[variable]);
                vde.Variable = variableDefinition;
                _methodCompileInfo.Method.Body.Variables.Add(variableDefinition);
                _methodCompileInfo.CodeObject.Statements.Insert(0, new ExpressionStatement(vde));
            }
        }

        #region Duffs Device
        private const int DuffsConstant = 8;
        private void DuffsDevice()
        {
            // TODO: allow duffs device to work on loops that 1) count down; and 2) have conditions other than <

            IExpression iterator = null;
            IExpression bound = null;
            IBlockStatement body = null;

            CodeUtility.MatchAndReplaceCode<IStatement>(_methodCompileInfo.CodeObject, delegate(IStatement statement, ICodeObject context)
            {
                IWhileStatement whileStatement = statement as IWhileStatement;
                if (whileStatement == null)
                {
                    return false;
                }

                IBinaryExpression condition = whileStatement.Condition as IBinaryExpression;
                if (condition == null)
                {
                    return false;
                }

                if (condition.Operator != BinaryOperator.LessThan)
                {
                    return false;
                }

                // find iterator
                if (whileStatement.Body.Statements.Count == 0)
                {
                    return false;
                }
                IAssignStatement assignStatement = whileStatement.Body.Statements[whileStatement.Body.Statements.Count - 1] as IAssignStatement;
                if (assignStatement == null)
                {
                    return false;
                }

                if (!assignStatement.Target.Equals(condition.Left))
                {
                    return false;
                }

                iterator = condition.Left;
                bound = condition.Right;
                body = whileStatement.Body;
                return true;
            }, delegate(IStatement statement, ICodeObject context)
            {
                Debug.Assert(iterator != null);
                Debug.Assert(bound != null);
                Debug.Assert(body != null);

                BlockStatement blockStatement = new BlockStatement();

                IVariableReferenceExpression itersVariableReferenceExpression = new VariableReferenceExpression(NewTemporary(bound.Type));
                IAssignStatement assignIters = new AssignStatement(itersVariableReferenceExpression, new BinaryExpression(bound, BinaryOperator.Subtract, iterator));
                blockStatement.Statements.Add(assignIters);

                IVariableReferenceExpression n = new VariableReferenceExpression(NewTemporary(iterator.Type));
                IAssignStatement nEqualsIterationsModuloDuffsConstant = new AssignStatement(n, new BinaryExpression(itersVariableReferenceExpression, BinaryOperator.Modulus, new Int32LiteralExpression(DuffsConstant)));
                blockStatement.Statements.Add(nEqualsIterationsModuloDuffsConstant);

                WhileStatement whileStatement1 = new WhileStatement();
                whileStatement1.Condition = new UnaryExpression(n, UnaryOperator.PostDecrement);
                whileStatement1.Body = new BlockStatement();
                foreach (IStatement innerStatement in body.Statements)
                {
                    whileStatement1.Body.Statements.Add(innerStatement);
                }
                whileStatement1.Body.Statements.RemoveAt(whileStatement1.Body.Statements.Count - 1);
                blockStatement.Statements.Add(whileStatement1);

                n = new VariableReferenceExpression(NewTemporary(iterator.Type));
                IAssignStatement nEqualsIterationsDividedByDuffsConstant = new AssignStatement(n, new BinaryExpression(itersVariableReferenceExpression, BinaryOperator.Divide, new Int32LiteralExpression(DuffsConstant)));
                blockStatement.Statements.Add(nEqualsIterationsDividedByDuffsConstant);

                WhileStatement whileStatement2 = new WhileStatement();
                whileStatement2.Body = new BlockStatement();
                whileStatement2.Condition = new UnaryExpression(n, UnaryOperator.PostDecrement);
                for (int i = 0; i < DuffsConstant; i++)
                {
                    foreach (IStatement innerStatement in body.Statements)
                    {
                        whileStatement2.Body.Statements.Add(innerStatement);
                    }
                    whileStatement2.Body.Statements.RemoveAt(whileStatement2.Body.Statements.Count - 1);
                }
                blockStatement.Statements.Add(whileStatement2);

                iterator = null;
                bound = null;
                body = null;

                return blockStatement;
            }, true);
        }
        #endregion

        #region NestedConditionalStatementsToSwitch
        private void NestedConditionalStatementsToSwitch()
        {
            IExpression switchVariable = null;
            List<IExpression> caseConditions = new List<IExpression>();
            List<IBlockStatement> caseBlocks = new List<IBlockStatement>();
            IBlockStatement defaultBlock = null;

            CodeUtility.MatchAndReplaceCode<IStatement>(_methodCompileInfo.CodeObject, delegate(IStatement statement, ICodeObject context)
            {
                switchVariable = null;
                defaultBlock = null;

                IConditionStatement conditionStatement = statement as IConditionStatement;
                if (conditionStatement == null)
                {
                    return false;
                }

                if (conditionStatement.Else.Statements.Count > 1)
                {
                    return false;
                }

                IConditionStatement conditionStatement2 = conditionStatement.Else.Statements[0] as IConditionStatement;

                if (conditionStatement2 == null)
                {
                    return false;
                }

                IBinaryExpression condition = conditionStatement.Condition as IBinaryExpression;
                if (condition == null)
                {
                    return false;
                }

                if (condition.Operator != BinaryOperator.IdentityEquality && condition.Operator != BinaryOperator.ValueEquality)
                {
                    return false;
                }

                switchVariable = condition.Left as IVariableReferenceExpression;
                if (switchVariable == null)
                {
                    switchVariable = condition.Left as IArgumentReferenceExpression;
                    if (switchVariable == null)
                    {
                        return false;
                    }
                }

                ILiteralExpression caseCondition1 = condition.Right as ILiteralExpression;
                if (caseCondition1 == null)
                {
                    return false;
                }

                TypeReference type = condition.Left.Type;

                // TODO: more types can be switched on
                if (!(type.Equals(CoreTypes.Int32) || type.Equals(CoreTypes.String) || type.Equals(CoreTypes.Boolean)))
                {
                    return false;
                }

                caseConditions.Clear();
                caseBlocks.Clear();

                caseConditions.Add(caseCondition1);
                caseBlocks.Add(conditionStatement.Then);

                conditionStatement = conditionStatement2;

                while (true)
                {

                    IBinaryExpression condition2 = conditionStatement2.Condition as IBinaryExpression;
                    if (condition2 == null)
                    {
                        break;
                    }

                    if (condition2.Operator != condition.Operator)
                    {
                        break;
                    }

                    if (!condition2.Left.Type.Equals(type))
                    {
                        break;
                    }

                    if (!(condition2.Right is ILiteralExpression))
                    {
                        break;
                    }

                    if (conditionStatement2.Else == null)
                    {
                        break;
                    }
                    if (conditionStatement2.Else.Statements.Count != 1)
                    {
                        defaultBlock = conditionStatement2.Else;
                        break;
                    }

                    IConditionStatement savedConditionStatement = conditionStatement2;
                    conditionStatement2 = conditionStatement2.Else.Statements[0] as IConditionStatement;
                    if (conditionStatement2 == null)
                    {
                        defaultBlock = savedConditionStatement.Else;
                        break;
                    }

                    caseConditions.Add(condition2.Right);
                    caseBlocks.Add(savedConditionStatement.Then);
                }

                return true;

            }, delegate(IStatement statement, ICodeObject context)
            {
                ISwitchStatement switchStatement = new SwitchStatement();
                switchStatement.Expression = switchVariable;
                for (int i = 0; i < caseConditions.Count; i++)
                {
                    IConditionCase conditionCase = new ConditionCase();
                    conditionCase.Condition = caseConditions[i];
                    conditionCase.Body = new BlockStatement();
                    CollectionHelper.AddRange(conditionCase.Body.Statements, caseBlocks[i].Statements);
                    conditionCase.Body.Statements.Add(new BreakStatement());
                    switchStatement.Cases.Add(conditionCase);
                }
                if (defaultBlock != null)
                {
                    IDefaultCase defaultCase = new DefaultCase();
                    defaultCase.Body = new BlockStatement();
                    CollectionHelper.AddRange(defaultCase.Body.Statements, defaultBlock.Statements);
                    defaultCase.Body.Statements.Add(new BreakStatement());
                    switchStatement.Cases.Add(defaultCase);
                }
                return switchStatement;
            }, true);
        }
        #endregion

        #endregion

        #region Cost Calculations

        private Dictionary<Type, Reflection.MethodInfo> _calculateCostMethodMap;
        private void InitializeCalculateCostMethodMap()
        {
            _calculateCostMethodMap = new Dictionary<Type, Reflection.MethodInfo>();
            PopulateMethodMap<int, IStatement>(_calculateCostMethodMap, this.GetType(), "CalculateCost");
            PopulateMethodMap<int, IExpression>(_calculateCostMethodMap, this.GetType(), "CalculateCost");
        }

        #region Helper
        private int BasicBlockMaxCost
        {
            get
            {
                return DefaultBasicBlockMaxCost; // TODO: calculate bbmaxcost based upon the target platform
            }
        }

        private int CalculateBasicBlockCost(BasicBlock bb)
        {
            return CalculateStatementCost(bb);
        }
        #endregion

        #region Expressions
        // TODO: Costs here don't make any sense, figure out some good cost map for each binaryExpression/statement type
        public int CalculateExpressionCost(IExpression expression)
        {
            return FoldByType<int, IExpression>(expression, _calculateCostMethodMap);
        }
        private int CalculateCost(IAddressDereferenceExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IAddressOfExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IAddressOutExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IAddressReferenceExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IArgumentListExpression expression)
        {
            return 0;
        }
        private int CalculateCost(IArgumentReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IArrayCreateExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IArrayIndexerExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IArrayInitializerExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IArrayLengthExpression expression)
        {
            return 2;
        }
        private int CalculateCost(IBaseReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IBinaryExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Left) + CalculateExpressionCost(expression.Right);
        }
        private int CalculateCost(IBoxExpression expression)
        {
            return 3 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(ICanCastExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(ICastExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IConditionExpression expression)
        {
            return 2 + CalculateExpressionCost(expression.Condition) + CalculateExpressionCost(expression.Else) + CalculateExpressionCost(expression.Then);
        }
        private int CalculateCost(IDelegateCreateExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IDelegateInvokeExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IEventReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IFieldReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IGenericDefaultExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ILiteralExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IMethodInvokeExpression expression)
        {
            return 10;
        }
        private int CalculateCost(IMethodReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(INamedArgumentExpression expression)
        {
            return 1;
        }
        private int CalculateCost(INullCoalescingExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IObjectCreateExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IObjectInitializeExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IPropertyIndexerExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IPropertyReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ISizeOfExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ISnippetExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IStackAllocateExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IThisReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ITryCastExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ITypedReferenceCreateExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ITypeOfExpression expression)
        {
            return 1;
        }
        private int CalculateCost(ITypeReferenceExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IUnaryExpression expression)
        {
            return 1 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IUnboxExpression expression)
        {
            return 2 + CalculateExpressionCost(expression.Expression);
        }
        private int CalculateCost(IVariableDefinitionExpression expression)
        {
            return 1;
        }
        private int CalculateCost(IVariableReferenceExpression expression)
        {
            return 1;
        }

        private int CalculateCost(PhiFunction expression)
        {
            return expression.Variables.Count; // TODO: What is the cost of a phi function?  puts strain or regalloc
        }
        private int CalculateCost(InstanceOfExpression expression)
        {
            return 2;
        }
        private int CalculateCost(ExceptionExpression expression)
        {
            return 1;
        }

        #endregion

        #region Statements

        public int CalculateStatementCost(IStatement statement)
        {
            return FoldByType<int, IStatement>(statement, _calculateCostMethodMap);
        }
        private int CalculateCost(IBlockStatement statement)
        {
            int cost = 0;

            foreach (IStatement innerStatement in statement.Statements)
            {
                cost += CalculateStatementCost(innerStatement);
            }
            return cost;
        }

        private int CalculateCost(NopStatement statement)
        {
            return 0;
        }
        private int CalculateCost(IExpressionStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IAssignStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IAttachEventStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IBreakStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IConditionStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IConditionCase statement)
        {
            return 1;
        }
        private int CalculateCost(IDefaultCase statement)
        {
            return 1;
        }
        private int CalculateCost(IContinueStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IDoStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IFixedStatement statement)
        {
            throw new CompilerException("The \"fixed\" langauge construct is not supported by XaeiO.");
        }
        private int CalculateCost(IForEachStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IForStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IGotoStatement statement)
        {
            return 1;
        }
        private int CalculateCost(ILabeledStatement statement)
        {
            return 1;
        }
        private int CalculateCost(ILockStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IMemoryCopyStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IMemoryInitializeStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IMethodReturnStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IRemoveEventStatement statement)
        {
            return 1;
        }
        private int CalculateCost(ISwitchStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IThrowExceptionStatement statement)
        {
            return 1;
        }
        private int CalculateCost(ITryCatchFinallyStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IUsingStatement statement)
        {
            return 1;
        }
        private int CalculateCost(IWhileStatement statement)
        {
            return 1;
        }
        #endregion

        #endregion

        #region Fixups
        private void AddMethodCodePointerFixup(MethodReference methodReference)
        {
            AddMethodCodePointerFixup(methodReference, (uint)_codeFormatter.GetOffset(), _defaultFixupType);
        }
        private void AddMethodCodePointerFixup(MethodReference methodReference, uint offset, ImageFormat.FixupType section)
        {
            // references to delegate invoke methods become reference to System.Delegate::Invoke or System.Delegate::InvokeNative
            MethodDefinition methodDefinition = ReferenceResolver.ResolveMethodReference(methodReference);
            if (IsDelegateInvokeMethod(methodDefinition))
            {
                if (AttributeHelper.HasCustomAttribute(methodDefinition.DeclaringType, "System.Runtime.InteropServices", "NativeDelegateAttribute"))
                {
                    methodReference = OSCorlibDelegateInvokeNativeMethod;
                }
                else
                {
                    methodReference = OSCorlibDelegateInvokeMethod;
                }
            }
            UnboundFixup fixup = new UnboundFixup();
            fixup.Context = _methodCompileInfo.Method;
            fixup.Offset = offset;
            fixup.Reference = methodReference;
            fixup.Type = ImageFormat.FixupType.MethodCodePointer | section;

            // TODO: extract this logic out into a utility method
            if (section == XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat.FixupType.CodeSection)
            {
                _unboundFixups[_methodCompileInfo.Method].Add(fixup);
            }
            else
            {
                _imageUnboundFixups.Add(fixup);
            }
            GetReferenceMetadataIndex(methodReference);
        }
        private void AddVTableDataPointerFixup(TypeReference typeReference)
        {
            AddVTableDataPointerFixup(typeReference, (uint)_codeFormatter.GetOffset(), _defaultFixupType);
        }
        private void AddVTableDataPointerFixup(TypeReference typeReference, uint offset, ImageFormat.FixupType section)
        {
            UnboundFixup fixup = new UnboundFixup();
            if (section == XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat.FixupType.CodeSection)
            {
                fixup.Context = _methodCompileInfo.Method;
            }
            fixup.Offset = offset;
            fixup.Reference = typeReference;
            fixup.Type = ImageFormat.FixupType.VTableDataPointer | section;
            if (section == XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat.FixupType.CodeSection)
            {
                _unboundFixups[_methodCompileInfo.Method].Add(fixup);
            }
            else
            {
                _imageUnboundFixups.Add(fixup);
            }
            GetReferenceMetadataIndex(typeReference);
        }
        private void AddVTableSlotFixup(MethodReference methodReference)
        {
            AddVTableSlotFixup(methodReference, (uint)_codeFormatter.GetOffset(), _defaultFixupType);
        }
        private void AddVTableSlotFixup(MethodReference methodReference, uint offset, ImageFormat.FixupType section)
        {
            // references to delegate invoke methods become reference to System.Delegate::Invoke or System.Delegate::InvokeNative
            MethodDefinition methodDefinition = ReferenceResolver.ResolveMethodReference(methodReference);
            if (IsDelegateInvokeMethod(methodDefinition))
            {
                if (AttributeHelper.HasCustomAttribute(methodDefinition.DeclaringType, "System.Runtime.InteropServices", "NativeDelegateAttribute"))
                {
                    methodReference = OSCorlibDelegateInvokeNativeMethod;
                }
                else
                {
                    methodReference = OSCorlibDelegateInvokeMethod;
                }
            }
            UnboundFixup fixup = new UnboundFixup();
            fixup.Context = _methodCompileInfo.Method;
            fixup.Offset = offset;
            fixup.Reference = methodReference;
            fixup.Type = ImageFormat.FixupType.VTableSlot | section;
            _unboundFixups[_methodCompileInfo.Method].Add(fixup);
            GetReferenceMetadataIndex(methodReference);
        }
        private void AddStaticFieldDataPointerFixup(FieldReference fieldReference)
        {
            AddStaticFieldDataPointerFixup(fieldReference, (uint)_codeFormatter.GetOffset(), _defaultFixupType);
        }
        private void AddStaticFieldDataPointerFixup(FieldReference fieldReference, uint offset, ImageFormat.FixupType section)
        {
            UnboundFixup fixup = new UnboundFixup();
            fixup.Context = _methodCompileInfo.Method;
            fixup.Offset = offset;
            fixup.Reference = fieldReference;
            fixup.Type = ImageFormat.FixupType.StaticFieldDataPointer | section;
            _unboundFixups[_methodCompileInfo.Method].Add(fixup);
            GetReferenceMetadataIndex(fieldReference);
        }
        private void BindFixup(UnboundFixup fixup, Dictionary<string, List<UnboundFixup>> allUnboundFixups, Dictionary<UnboundFixup, int> fixupBindingMap)
        {
            string sectionName;
            switch ((ImageFormat.FixupType)(fixup.Type & ImageFormat.FixupType.SectionMask))
            {
                case ImageFormat.FixupType.CodeSection:
                    {
                        sectionName = "Code";
                        break;
                    }
                case ImageFormat.FixupType.DataSection:
                    {
                        sectionName = "Data";
                        break;
                    }
                case ImageFormat.FixupType.InitializationSection:
                    {
                        sectionName = "Initialization";
                        break;
                    }
                default:
                    {
                        throw new CompilerException("Invalid fixup type");
                    }
            }
            allUnboundFixups[sectionName].Add(fixup);

            MethodReference methodReference = fixup.Reference as MethodReference;
            if (methodReference != null)
            {
                fixupBindingMap.Add(fixup, GetReferenceMetadataIndex(methodReference));
                return;
            }

            TypeReference typeReference = fixup.Reference as TypeReference;
            if (typeReference != null)
            {
                fixupBindingMap.Add(fixup, GetReferenceMetadataIndex(typeReference));
                return;
            }

            FieldReference fieldReference = fixup.Reference as FieldReference;
            if (fieldReference != null)
            {
                fixupBindingMap.Add(fixup, GetReferenceMetadataIndex(fieldReference));
                return;
            }

            throw new NotImplementedException();
        }
        #endregion

        #region Helper

        #region FoldByType
        private R FoldByType<R, A>(A o, Dictionary<Type, Reflection.MethodInfo> methodMap, bool ret)
        {
            Type protoT = o.GetType();
            foreach (Type t in methodMap.Keys)
            {
                if (t.IsAssignableFrom(protoT))
                {
                    try
                    {
                        if (ret)
                        {
                            return (R)methodMap[t].Invoke(this, new object[] { o });
                        }
                        else
                        {
                            methodMap[t].Invoke(this, new object[] { o });
                            return default(R);
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.InnerException + ": " + e.InnerException.StackTrace);
                        throw e.InnerException;
                    }
                }
            }
            throw new CompilerException("Could not fold by type.  No type in type to delegate map matched type of the argument: " + protoT.ToString());
        }
        private R FoldByType<R, A>(A o, Dictionary<Type, Reflection.MethodInfo> methodMap)
        {
            return FoldByType<R, A>(o, methodMap, true);
        }
        private void FoldByType<A>(A o, Dictionary<Type, Reflection.MethodInfo> methodMap)
        {
            FoldByType<object, A>(o, methodMap, false);
        }
        private static void PopulateMethodMap<R, A>(Dictionary<Type, Reflection.MethodInfo> map, Type targetType, string overloadedMethodName)
        {
            Reflection.MethodInfo[] methods = targetType.GetMethods(Reflection.BindingFlags.Public | Reflection.BindingFlags.NonPublic | Reflection.BindingFlags.Static | Reflection.BindingFlags.Instance);
            List<Reflection.MethodInfo> overloads = new List<Reflection.MethodInfo>();
            try
            {
                foreach (Reflection.MethodInfo m in methods)
                {
                    if (m.Name == overloadedMethodName)
                    {
                        Reflection.ParameterInfo[] parameters = m.GetParameters();
                        if (parameters.Length == 1)
                        {
                            Reflection.ParameterInfo p = parameters[0];
                            map[p.ParameterType] = m;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw new CompilerException(e.Message, e);
            }
        }
        private static void PopulateMethodMap<A>(Dictionary<Type, Reflection.MethodInfo> map, Type targetType, string overloadedMethodName)
        {
            PopulateMethodMap<object, A>(map, targetType, overloadedMethodName);
        }
        #endregion

        private bool CallCannotCauseContextSwitch(CFGNode node)
        {
            if (node.BasicBlock.Statements.Count == 0)
            {
                return true;
            }
            if (node.BasicBlock.Statements.Count != 1)
            {
                return false;
            }
            IStatement statement = node.BasicBlock.Statements[0];
            IMethodInvokeExpression methodInvokeExpression = null;
            IExpressionStatement expressionStatement = statement as IExpressionStatement;
            if (expressionStatement != null)
            {
                methodInvokeExpression = expressionStatement.Expression as IMethodInvokeExpression;
            }
            IAssignStatement assignStatement = statement as IAssignStatement;
            if (assignStatement != null)
            {
                methodInvokeExpression = assignStatement.Expression as IMethodInvokeExpression;
            }

            if (methodInvokeExpression == null)
            {
                return false;
            }

            IMethodReferenceExpression methodReferenceExpression = methodInvokeExpression.Method as IMethodReferenceExpression;
            if (methodReferenceExpression == null)
            {
                return false;
            }

            MethodDefinition methodDefinition;
            if (!ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, _assemblyCompileInfo.Assembly.Resolver, out methodDefinition))
            {
                return false;
            }
            if (HasInlineImplementation(methodDefinition))
            {
                return methodDefinition != KernelYieldMethod;
            }
            if (MethodIsNonPreemptive(methodDefinition))
            {
                return true;
            }
            if (CurrentMethodIsCriticalSection())
            {
                return true;
            }
            return false;
        }
        private bool IsOmittedType(TypeDefinition typeDefinition)
        {
            return HasDummyAttribute(typeDefinition) || typeDefinition.Name == "<Module>";
        }
        private bool IsOmittedMethod(MethodDefinition methodDefinition)
        {
            return HasDummyAttribute(methodDefinition);
        }
        private VariableReference NewTemporary(TypeReference type)
        {
            return _methodCompileInfo.NewTemporary((TypeReference)type);
        }
        private bool IsTemporary(IExpression expression)
        {
            IVariableReferenceExpression variableReferenceExpression = expression as IVariableReferenceExpression;
            if (variableReferenceExpression != null)
            {
                return _methodCompileInfo.IsTemporary(variableReferenceExpression.Variable);
            }
            else
            {
                return false;
            }
        }
        private bool CurrentMethodIsNonPreemptive()
        {
            return MethodIsNonPreemptive(_methodCompileInfo.Method);
        }
        private bool CurrentMethodIsCriticalSection()
        {
            return MethodIsCriticalSection(_methodCompileInfo.Method);
        }
        private bool MethodUsesNativeCallingConvention(MethodReference methodReference)
        {
            return MethodUsesNativeCallingConvention(ReferenceResolver.ResolveMethodReference(methodReference, _assemblyCompileInfo.Assembly.Resolver));
        }
        private bool MethodUsesNativeCallingConvention(MethodDefinition methodDefinition)
        {
            CustomAttribute methodCallingConventionAttribute;
            if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.InteropServices", "MethodCallingConventionAttribute", out methodCallingConventionAttribute))
            {
                return ((CallingConvention)methodCallingConventionAttribute.ConstructorParameters[0]) == CallingConvention.Native;
            }

            if (AttributeHelper.HasCustomAttribute(methodDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute"))
            {
                return true;
            }

            return false;
        }
        private bool MethodIsNonPreemptive(MethodReference methodReference)
        {
            return MethodIsNonPreemptive(ReferenceResolver.ResolveMethodReference(methodReference, _assemblyCompileInfo.Assembly.Resolver));
        }
        private bool MethodIsCriticalSection(MethodReference methodReference)
        {
            return MethodIsCriticalSection(ReferenceResolver.ResolveMethodReference(methodReference, _assemblyCompileInfo.Assembly.Resolver));
        }
        private bool MethodIsCriticalSection(MethodDefinition methodDefinition)
        {
            CustomAttribute methodImplCustomAttribute;
            if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out methodImplCustomAttribute))
            {
                return (((MethodImplOptions)methodImplCustomAttribute.ConstructorParameters[0]) & MethodImplOptions.CriticalSection) > 0;
            }
            return false;
        }
        private bool IsDelegateCreateMethod(MethodDefinition methodDefinition)
        {
            TypeDefinition typeDefinition = ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType);
            if (typeDefinition == null || typeDefinition.BaseType == null)
            {
                return false;
            }
            return methodDefinition.IsSpecialName && methodDefinition.Name == ".ctor" &&
                ((ReferenceComparer.TypeReferenceEquals(typeDefinition.BaseType, CoreTypes.MulticastDelegate)) || // base type can be multicastdelegate
                (ReferenceComparer.TypeReferenceEquals(typeDefinition.BaseType, CoreTypes.Delegate) && !ReferenceComparer.TypeReferenceEquals(typeDefinition, CoreTypes.MulticastDelegate))); // or base type can be delegate but type must not be multicast delegate
        }
        private bool IsDelegateInvokeMethod(MethodDefinition methodDefinition)
        {
            TypeDefinition typeDefinition = ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType);
            if (typeDefinition == null || typeDefinition.BaseType == null)
            {
                return false;
            }

            // delegates created 
            return methodDefinition.Name == "Invoke" && // must be called invoke
                ((ReferenceComparer.TypeReferenceEquals(typeDefinition.BaseType, CoreTypes.MulticastDelegate)) || // base type can be multicastdelegate
                (ReferenceComparer.TypeReferenceEquals(typeDefinition.BaseType, CoreTypes.Delegate) && !ReferenceComparer.TypeReferenceEquals(typeDefinition, CoreTypes.MulticastDelegate))); // or base type can be delegate but type must not be multicast delegate
        }
        private string GetIntrinsicSymbolName(TypeDefinition type)
        {

            CustomAttribute intrinsicAttribute;
            if (AttributeHelper.TryGetCustomAttribute(type, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
            {
                string intrinsicName;
                bool useGlobalNamespace;
                if (intrinsicAttribute.ConstructorParameters.Count > 0)
                {
                    intrinsicName = (string)intrinsicAttribute.ConstructorParameters[0];
                }
                else if (intrinsicAttribute.Properties.Contains("Name"))
                {
                    intrinsicName = (string)intrinsicAttribute.Properties["Name"];
                }
                else
                {
                    intrinsicName = type.Name;
                }

                if (intrinsicAttribute.Properties.Contains("UseGlobalNamespace"))
                {
                    useGlobalNamespace = (bool)intrinsicAttribute.Properties["UseGlobalNamespace"];
                }
                else
                {
                    useGlobalNamespace = false;
                }

                if (!useGlobalNamespace)
                {
                    intrinsicName = type.Namespace + "." + intrinsicName;
                }

                return intrinsicName;
            }
            else
            {
                return type.FullName;
            }
        }
        private TypeDefinition ResolveTypeReference(TypeReference typeReference)
        {
            return ReferenceResolver.ResolveTypeReference(typeReference, _assemblyCompileInfo.Assembly.Resolver);
        }
        private MethodDefinition GetMethodByName(TypeDefinition declaringType, string methodName)
        {
            return GetMethodByName(declaringType, methodName, true);
        }
        private MethodDefinition GetMethodByName(TypeDefinition declaringType, string methodName, bool throwIfNotFound)
        {
            foreach (MethodDefinition methodDefinition in declaringType.Methods)
            {
                if (methodDefinition.Name == methodName)
                {
                    return methodDefinition;
                }
            }
            if (throwIfNotFound)
            {
                throw new CompilerException("Could not find method " + methodName + " in type " + declaringType);
            }
            else
            {
                return null;
            }
        }
        private FieldDefinition GetFieldByName(TypeDefinition declaringType, string fieldName)
        {
            return GetFieldByName(declaringType, fieldName, true);
        }
        private FieldDefinition GetFieldByName(TypeDefinition declaringType, string fieldName, bool throwIfNotFound)
        {
            foreach (FieldDefinition fieldDefinition in declaringType.Fields)
            {
                if (fieldDefinition.Name == fieldName)
                {
                    return fieldDefinition;
                }
            }
            if (throwIfNotFound)
            {
                throw new CompilerException("Could not find field " + fieldName + " in type " + declaringType);
            }
            else
            {
                return null;
            }
        }
        private TypeReference GetDeclaringType(TypeReference type)
        {
            if (type.DeclaringType != null)
            {
                return type.DeclaringType;
            }
            GenericInstanceType genericInstanceType = type as GenericInstanceType;
            if (genericInstanceType != null && genericInstanceType.ElementType.DeclaringType != null)
            {
                return genericInstanceType.ElementType.DeclaringType;
            }

            return null;
        }
        private VariableDefinition CreateTemporaryRegister()
        {
            return new PseudoVariableDefinition("t" + (_temporaryRegisterCounter++));
        }
        private bool IsHandlerStartNode(CFGNode node)
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                foreach (CFGNodeCluster handlerCluster in tryBlockInfo.Handlers.Keys)
                {
                    if (handlerCluster.Start == node)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        private bool IsTryCatchFinallyStartOrEnd(CFGNode node)
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                if (tryBlockInfo.TryBlock.Start == node)
                {
                    return true;
                }
                if (tryBlockInfo.TryBlock.End == node)
                {
                    return true;
                }
                if (tryBlockInfo.ConsolidatedCatchBlock != null)
                {
                    if (tryBlockInfo.ConsolidatedCatchBlock.Start == node)
                    {
                        return true;
                    }
                    if (tryBlockInfo.ConsolidatedCatchBlock.End == node)
                    {
                        return true;
                    }
                }
                if (tryBlockInfo.FinallyBlock != null)
                {
                    if (tryBlockInfo.FinallyBlock.Start == node)
                    {
                        return true;
                    }
                    if (tryBlockInfo.FinallyBlock.End == node)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        #endregion

        // TODO: dead code elimination needs to turn conditional branches into unconditional branches if only one branch is left

        #region Emit compiler implemented methods

        private void EmitInlineCompilerImplementedMethodInvokeExpression(MethodDefinition methodDefinition, IMethodInvokeExpression methodInvokeExpression)
        {
            InlineCompilerImplementedMethodCodeEmitter emitter;
            if (_inlineCompilerImplementedMethods.TryGetValue(methodDefinition.ToString(), out emitter))
            {
                emitter(methodInvokeExpression);
                return;
            }

            throw new CompilerException("Compiler does not know how to emit code for inine compiler implemented method: " + methodDefinition);
        }
        private void EmitDelegateInvokeNativeMethodCode()
        {
            _codeFormatter.Write("if(typeof(this) == 'function'){return this.apply(null, arguments);}else{return this[1].apply(this[0], arguments);}");
        }
        private void EmitDelegateInvokeMethodCode()
        {
            // method signature is: virtual void Invoke(params object[] args);

            // TODO: Use register helper and code model
            _codeFormatter.Write("return this[1].apply(this[0], [0," +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.TimeSliceEnd) +
                ",null," + SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ParentContinuation) +
                ",[null,null].concat(" + SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame) + "[" + ((int)FrameSlot.Max) + "])]);"); // TODO: use frame helper here
        }
        private void EmitKernelYieldMethodCode()
        {
            EmitStatementCode(new NativeThrowExceptionStatement(new ParentContinuationObjectRegisterReferenceExpression()));
        }
        private void EmitOSCorlibInstanceOfCall(IMethodInvokeExpression expression)
        {
            StringLiteralExpression stringLiteralExpression = (StringLiteralExpression)expression.Arguments[0];
            IMethodReferenceExpression methodReferenceExpression = (IMethodReferenceExpression)expression.Method;
            EmitExpressionCode(methodReferenceExpression.Target);
            _codeFormatter.Write(" instanceof ");
            _codeFormatter.Write(stringLiteralExpression.String);
        }
        private delegate void InlineCompilerImplementedMethodCodeEmitter(IMethodInvokeExpression expression);
        private delegate void CompilerImplementedMethodCodeEmitter();
        private void RegisterInlineCompilerImplementedMethodCodeEmitter(MethodDefinition methodDefinition, InlineCompilerImplementedMethodCodeEmitter emitter)
        {
            _inlineCompilerImplementedMethods[methodDefinition.ToString()] = emitter;
        }
        private void RegisterCompilerImplementedMethodCodeEmitter(MethodDefinition methodDefinition, CompilerImplementedMethodCodeEmitter emitter)
        {
            _compilerImplementedMethods[methodDefinition.ToString()] = emitter;
        }

        #endregion

        #region Check Attributes
        public static bool HasInlineImplementation(MethodDefinition methodDefinition)
        {
            CustomAttribute xaeiosMethodImplAttribute;
            if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out xaeiosMethodImplAttribute))
            {
                MethodImplOptions methodImplOptions = (MethodImplOptions)xaeiosMethodImplAttribute.ConstructorParameters[0];
                return (methodImplOptions & MethodImplOptions.Inline) > 0;
            }
            else
            {
                return false;
            }
        }
        public static bool HasDummyAttribute(ICustomAttributeProvider customAttributeProvider)
        {
            return AttributeHelper.HasCustomAttribute(customAttributeProvider, "System.Runtime.CompilerServices", "DummyAttribute");
        }
        public static bool MethodIsNonPreemptive(MethodDefinition methodDefinition)
        {
            CustomAttribute methodImplCustomAttribute;
            if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out methodImplCustomAttribute))
            {
                return ((((MethodImplOptions)methodImplCustomAttribute.ConstructorParameters[0]) & MethodImplOptions.NonPreemptive) > 0) || ((((MethodImplOptions)methodImplCustomAttribute.ConstructorParameters[0]) & MethodImplOptions.Inline) > 0);
            }
            return false;
        }
        #endregion

        #region Logging
        private void Warn(string s)
        {
            Console.WriteLine("[WARN] " + s);
        }
        #endregion

        private class MetadataIndexMap<T>
        {
            private Dictionary<string, T> _referenceKeyMap = new Dictionary<string, T>();
            private Dictionary<T, int> _indexMap = new Dictionary<T, int>();
            public int Count
            {
                get
                {
                    return _indexMap.Count;
                }
            }
            public Dictionary<T, int> Indices
            {
                get
                {
                    return new Dictionary<T, int>(_indexMap);
                }
            }

            public List<T> References
            {
                get
                {
                    return new List<T>(_indexMap.Keys);
                }
            }

            public bool TryGetIndex(T reference, string referenceKey, out int index)
            {
                T t;
                if (_referenceKeyMap.TryGetValue(referenceKey, out t))
                {
                    /*if (t.Equals(reference))
                    {
                        index = _indexMap[t];
                        return true;
                    }
                    else
                    {
                        index = default(int);
                        return false;
                    }*/
                    index = _indexMap[t];
                    return true;
                }
                else
                {
                    index = default(int);
                    return false;
                }
            }
            public void Add(T reference, string referenceKey, int index)
            {
                _indexMap.Add(reference, index);
                _referenceKeyMap.Add(referenceKey, reference);
            }
        }
    }
}
