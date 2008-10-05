using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Pdb;
using Mono.Cecil.Binary;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Helpers;

using Tenpow.Collections.Generic;

using NUnit.Core;
using NUnit.Framework;

namespace XaeiO.Compiler
{
    internal class CLRHandler : ITargetArchitectureHandler
    {
        private const string NamespaceAndNameRegex = "^([a-zA-Z0-9\\.]*)\\.([a-zA-Z0-9]+)$";

        private XaeiOSCompiler _compiler;
        private AssemblyNameReference _mscorlib;
        private AssemblyCompileInfo _compileInfo;

        public CLRHandler(XaeiOSCompiler compiler)
        {
            _compiler = compiler;

            // TODO: Initialize _mscorlib by CLR version and from path
            _mscorlib = CoreTypes.Corlib.Name;

        }

        public void Compile()
        {
            foreach (AssemblyDefinition assemblyDefinition in _compiler.LoadedAssemblies)
            {
                _compileInfo = new AssemblyCompileInfo(assemblyDefinition);
                //TestPdb(_compileInfo);
                //TestPdb2(_compileInfo);
                Compile(_compileInfo);
                _compileInfo = null;
            }
        }

        private void TestPdb(AssemblyCompileInfo compileInfo)
        {
            AssemblyDefinition assemblyDefinition = _compileInfo.SourceAssemblyDefinition;
            assemblyDefinition.MainModule.LoadSymbols();
            assemblyDefinition.MainModule.FullLoad();

            assemblyDefinition.MainModule.SaveSymbols();
            AssemblyFactory.SaveAssembly(assemblyDefinition, "build/Test.CLR.exe");
        }

        private void TestPdb2(AssemblyCompileInfo compileInfo)
        {
            AssemblyDefinition sourceAssemblyDefinition = _compileInfo.SourceAssemblyDefinition;
            sourceAssemblyDefinition.MainModule.LoadSymbols();
            sourceAssemblyDefinition.MainModule.FullLoad();

            AssemblyDefinition assemblyDefinition = AssemblyFactory.DefineAssembly("Test.CLR", AssemblyKind.Console);

            assemblyDefinition.MainModule.Inject(sourceAssemblyDefinition.MainModule.Types[0]);
            assemblyDefinition.MainModule.Inject(sourceAssemblyDefinition.MainModule.Types[1]);
            assemblyDefinition.EntryPoint = assemblyDefinition.MainModule.Types[1].Methods[0];

            CustomAttribute sourceDebuggableAttribute = AttributeHelper.GetCustomAttribute(sourceAssemblyDefinition, "System.Diagnostics", "DebuggableAttribute");
            assemblyDefinition.CustomAttributes.Add(sourceDebuggableAttribute);

            // setup debug header
            assemblyDefinition.MainModule.Image.AddDebugHeader();
            DebugHeader debugHeader = assemblyDefinition.MainModule.Image.DebugHeader;
            DebugHeader sourceDebugHeader = sourceAssemblyDefinition.MainModule.Image.DebugHeader;

            debugHeader.AddressOfRawData = sourceDebugHeader.AddressOfRawData;
            debugHeader.Age = sourceDebugHeader.Age;
            debugHeader.Characteristics = sourceDebugHeader.Characteristics;
            debugHeader.FileName = sourceDebugHeader.FileName;
            //debugHeader.FileName = Path.GetFullPath(Path.ChangeExtension(GetOutputFilePath(compileInfo.SourceAssemblyDefinition), ".pdb"));
            debugHeader.Magic = sourceDebugHeader.Magic;
            debugHeader.MajorVersion = sourceDebugHeader.MajorVersion;
            debugHeader.MinorVersion = sourceDebugHeader.MinorVersion;
            debugHeader.PointerToRawData = sourceDebugHeader.PointerToRawData;
            debugHeader.Signature = sourceDebugHeader.Signature;
            debugHeader.SizeOfData = sourceDebugHeader.SizeOfData;
            debugHeader.TimeDateStamp = sourceDebugHeader.TimeDateStamp;//(uint)DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            debugHeader.Type = sourceDebugHeader.Type;

            assemblyDefinition.MainModule.SaveSymbols();
            AssemblyFactory.SaveAssembly(assemblyDefinition, "build/Test.CLR.exe");
        }

        private void Compile(AssemblyCompileInfo compileInfo)
        {
            AssemblyDefinition sourceAssemblyDefinition = compileInfo.SourceAssemblyDefinition;

            // TODO: Check that sourceAssemblyDefinition references OSCorlib

            compileInfo.OutputFilePath = GetOutputFilePath(sourceAssemblyDefinition);

            AssemblyDefinition assemblyDefinition =
                compileInfo.OutputAssemblyDefinition =
                AssemblyFactory.DefineAssembly(sourceAssemblyDefinition.Name.Name, sourceAssemblyDefinition.Kind);

            ModuleDefinition moduleDefinition = assemblyDefinition.MainModule;

            Importer importer = new Importer(compileInfo, this);
            moduleDefinition.Importer = importer;

            // add reference to mscorlib
            moduleDefinition.AssemblyReferences.Add(_mscorlib);

            Dictionary<MethodDefinition, MethodDefinition> importedMethodMap = new Dictionary<MethodDefinition, MethodDefinition>();

            foreach (ModuleDefinition sourceModuleDefinition in sourceAssemblyDefinition.Modules)
            {
                // type definitions
                foreach (TypeDefinition sourceTypeDefinition in sourceModuleDefinition.Types)
                {
                    Console.WriteLine("Importing type: " + sourceTypeDefinition.AssemblyQualifiedName);
                    TypeDefinition importedType = Import(compileInfo, sourceTypeDefinition);

                    // TODO: build imported method map efficiently
                    foreach (MethodDefinition sourceMethodDefinition in sourceTypeDefinition.Methods)
                    {
                        MethodDefinition importedMethod = importedType.Methods.GetMethod(sourceMethodDefinition.Name, sourceMethodDefinition.Parameters);
                        if (importedMethod == null)
                        {
                            continue;
                            //throw new CompilerException("Unable to find imported method " + sourceMethodDefinition);
                        }
                        importedMethodMap[sourceMethodDefinition] = importedMethod;
                    }
                }
            }

            // entrypoint
            if (sourceAssemblyDefinition.EntryPoint != null)
            {
                MethodDefinition entryPointMethod;
                if (!importedMethodMap.TryGetValue(sourceAssemblyDefinition.EntryPoint, out entryPointMethod))
                {
                    throw new CompilerException("Unable to find imported entrypoint method " + sourceAssemblyDefinition.EntryPoint);
                }
                assemblyDefinition.EntryPoint = entryPointMethod;
            }

            AssemblyFactory.SaveAssembly(compileInfo.OutputAssemblyDefinition, compileInfo.OutputFilePath);

            if (sourceAssemblyDefinition.MainModule.Image.DebugHeader != null)
            { 
                //CompileDebugInfo(compileInfo);
            }
        }

        private void CompileDebugInfo(AssemblyCompileInfo compileInfo)
        {
            AssemblyDefinition sourceAssemblyDefinition = compileInfo.SourceAssemblyDefinition;
            AssemblyDefinition assemblyDefinition = compileInfo.OutputAssemblyDefinition =
                AssemblyFactory.GetAssembly(compileInfo.OutputFilePath);
            ModuleDefinition moduleDefinition = assemblyDefinition.MainModule;

            PdbFactory pdbFactory = new PdbFactory();
                ISymbolWriter symbolWriter =
                pdbFactory.CreateWriter(moduleDefinition, compileInfo.OutputFilePath);
            ISymbolReader symbolReader =
                pdbFactory.CreateReader(sourceAssemblyDefinition.MainModule, sourceAssemblyDefinition.MainModule.Image.FileInformation.FullName);

            sourceAssemblyDefinition.MainModule.LoadSymbols(symbolReader);
            sourceAssemblyDefinition.MainModule.FullLoad();

            // setup debug header
            moduleDefinition.Image.AddDebugHeader();
            DebugHeader debugHeader = moduleDefinition.Image.DebugHeader;
            DebugHeader sourceDebugHeader = sourceAssemblyDefinition.MainModule.Image.DebugHeader;

            debugHeader.AddressOfRawData = sourceDebugHeader.AddressOfRawData;
            debugHeader.Age = sourceDebugHeader.Age;
            debugHeader.Characteristics = sourceDebugHeader.Characteristics;
            debugHeader.FileName = sourceDebugHeader.FileName;
            //debugHeader.FileName = Path.GetFullPath(Path.ChangeExtension(GetOutputFilePath(compileInfo.SourceAssemblyDefinition), ".pdb"));
            debugHeader.Magic = sourceDebugHeader.Magic;
            debugHeader.MajorVersion = sourceDebugHeader.MajorVersion;
            debugHeader.MinorVersion = sourceDebugHeader.MinorVersion;
            debugHeader.PointerToRawData = sourceDebugHeader.PointerToRawData;
            debugHeader.Signature = sourceDebugHeader.Signature;
            debugHeader.SizeOfData = sourceDebugHeader.SizeOfData;
            debugHeader.TimeDateStamp = sourceDebugHeader.TimeDateStamp;//(uint)DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            debugHeader.Type = sourceDebugHeader.Type;

            CustomAttribute sourceDebuggableAttribute = AttributeHelper.GetCustomAttribute(sourceAssemblyDefinition, "System.Diagnostics", "DebuggableAttribute");
            TypeDefinition debuggableAttributeType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("System.Diagnostics.DebuggableAttribute"), _compiler.Resolver);
            MethodDefinition debuggableAttributeCtor = debuggableAttributeType.Constructors.GetConstructor(false, new Type[] {
                typeof(bool),
                typeof(bool)
            });
            CustomAttribute debuggableAttribute = new CustomAttribute(moduleDefinition.Import(debuggableAttributeCtor));
            debuggableAttribute.ConstructorParameters.Add(true);
            debuggableAttribute.ConstructorParameters.Add(false);
            assemblyDefinition.CustomAttributes.Add(debuggableAttribute);

            // save files
            //moduleDefinition.SaveSymbols(symbolWriter);
            string tempFile = Path.GetTempFileName();
            AssemblyFactory.SaveAssembly(assemblyDefinition, tempFile);
            symbolWriter.Dispose();

            File.Delete(compileInfo.OutputFilePath);
            File.Move(tempFile, compileInfo.OutputFilePath);
        }

        #region Imports

        private TypeDefinition Import(AssemblyCompileInfo compileInfo, TypeDefinition sourceTypeDefinition)
        {
            TypeDefinition typeDefinition;
            if (!compileInfo.ImportedTypeDefinitions.TryGetValue(sourceTypeDefinition.AssemblyQualifiedName, out typeDefinition))
            {
                // declaring type
                if (sourceTypeDefinition.DeclaringType != null)
                {
                    TypeDefinition declaringTypeDefinition = Import(compileInfo, ReferenceResolver.ResolveTypeReference(sourceTypeDefinition.DeclaringType, _compiler.Resolver));
                    typeDefinition = compileInfo.OutputAssemblyDefinition.MainModule.Inject(sourceTypeDefinition, declaringTypeDefinition);
                }
                else
                {
                    typeDefinition = compileInfo.OutputAssemblyDefinition.MainModule.Inject(sourceTypeDefinition);
                }
                typeDefinition.Module = compileInfo.OutputAssemblyDefinition.MainModule;

                compileInfo.ImportedTypeDefinitions[sourceTypeDefinition.AssemblyQualifiedName] = typeDefinition;
            }
            return typeDefinition;
        }

        private MethodDefinition Import(AssemblyCompileInfo compileInfo, MethodDefinition sourceMethodDefinition, TypeDefinition typeDefinitionContext)
        {
            MethodDefinition methodDefinition;
            if (!compileInfo.ImportedMethodDefinitions.TryGetValue(sourceMethodDefinition.ToString(), out methodDefinition))
            {
                compileInfo.OutputAssemblyDefinition.MainModule.Inject(sourceMethodDefinition, typeDefinitionContext);
                compileInfo.ImportedMethodDefinitions[sourceMethodDefinition.ToString()] = methodDefinition;
            }
            return methodDefinition;
        }

        private TypeReference Import(AssemblyCompileInfo compileInfo, TypeReference sourceTypeReference)
        {
            return compileInfo.OutputAssemblyDefinition.MainModule.Import(sourceTypeReference);
        }

        private AssemblyNameReference Import(AssemblyCompileInfo compileInfo, AssemblyNameReference sourceAssemblyNameReference)
        {
            AssemblyNameReference assemblyNameReference;
            if (TryGetReplacement(sourceAssemblyNameReference, out assemblyNameReference))
            {
                sourceAssemblyNameReference = assemblyNameReference;
            }
            compileInfo.OutputAssemblyDefinition.MainModule.AssemblyReferences.Add(sourceAssemblyNameReference);
            return sourceAssemblyNameReference;
        }

        #endregion

        private string GetOutputFilePath(AssemblyDefinition assembly)
        {
            return Path.Combine(_compiler.Options.OutputPath, assembly.Name.Name) + assembly.MainModule.Image.FileInformation.Extension;
            /*string baseFilePath = Path.Combine(_compiler.Options.OutputPath, assembly.Name.Name);
            string uniqueAddition = "";
            int uniqueCounter = 1;

            while (File.Exists(baseFilePath + uniqueAddition + ".dll"))
            {
                uniqueAddition = "." + (uniqueCounter++);
            }
            return baseFilePath + uniqueAddition + ".dll";*/
        }

        private bool TryGetReplacement(AssemblyNameReference assemblyNameReference, out AssemblyNameReference replacement)
        {
            AssemblyDefinition assemblyDefinition = _compiler.LoadAssembly(assemblyNameReference);
            replacement = GetCLRConjugate(assemblyDefinition);
            return replacement != null;
        }

        private bool TryGetReplacement(TypeReference typeReference, out TypeReference replacement)
        {
            TypeDefinition typeDefinition;
            if (ReferenceResolver.TryResolveTypeReference(typeReference, _compiler.Resolver, out typeDefinition))
            {
                replacement = GetCLRConjugate(typeReference, typeDefinition, false);
            }
            else
            {
                replacement = null;
            }
            return replacement != null;
        }

        private AssemblyNameReference GetCLRConjugate(AssemblyDefinition target)
        {
            CustomAttribute clrConjugateCustomAttribute;
            if (AttributeHelper.TryGetCustomAttribute(target, "System.Runtime.CompilerServices", "CLRConjugateAttribute", out clrConjugateCustomAttribute))
            {
                // construct the conjugate assembly name reference
                // TODO: Enforce strong assembly name
                return AssemblyNameReference.Parse(GetCLRConjugateName(clrConjugateCustomAttribute));
            }
            return null;
        }

        private string GetCLRConjugateName(CustomAttribute customAttribute)
        {
            return AttributeHelper.GetLeadingConstructorArgumentAsString(customAttribute);
        }

        private TypeReference GetCLRConjugate(TypeReference target, TypeDefinition context, bool throwIfConjugateNotFound)
        {
            if (AttributeHelper.HasCustomAttribute(context, "System.Runtime.CompilerServices", "CorlibCLRConjugateAttribute"))
            {
                return CoreTypes.GetCoreType(target.Namespace + "." + target.Name);
            }

            Stack<KeyValuePair<ICustomAttributeContext, CustomAttribute[]>> stack =
                AttributeHelper.GetCustomAttributesFromContext(context, "System.Runtime.CompilerServices", "CLRConjugateAttribute", _compiler.Resolver);

            // TODO: Allow method CLR conjugates
            // TODO: Allow assembly qualified names to take the place of assembly CLR conjugates
            // TODO: Allow clr conjugate name to be null, that way it is replaced solely according to context

            string clrConjugateName = null;
            AssemblyDefinition assemblyDefinition = null;

            while (stack.Count != 0)
            {
                KeyValuePair<ICustomAttributeContext, CustomAttribute[]> pair = stack.Pop();
                if (pair.Value.Length != 1)
                {
                    throw new CompilerException("CLRConjugateAttribute cannot be applied twice on " + pair.Key);
                }
                CustomAttribute contextCustomAttribute = pair.Value[0];
                if (pair.Key is AssemblyDefinition)
                {
                    // resolve conjugate assembly
                    assemblyDefinition = _compiler.LoadAssembly(GetCLRConjugateName(contextCustomAttribute));
                }
                else if (pair.Key is TypeDefinition)
                {
                    clrConjugateName = GetCLRConjugateName(contextCustomAttribute);
                }
                else
                {
                    throw new CompilerException("Invalid CLR conjugate context");
                }
            }

            if (clrConjugateName == null)
            {
                if (throwIfConjugateNotFound)
                {
                    throw new NotImplementedException("Context only CLR conjugate resolution is not yet implemented");
                }
                else
                {
                    return null;
                }
            }

            if (assemblyDefinition == null)
            {
                if (throwIfConjugateNotFound)
                {
                    throw new CompilerException("A CLR conjugate assembly must be specified for assembly: " + context.Module.Assembly);
                }
                else
                {
                    return null;
                }
            }

            // construct the conjugate type reference
            TypeReference targetTypeReference = (TypeReference)(object)target;
            string ns, name;
            ParseNamespaceAndName(clrConjugateName, out ns, out name);
            TypeReference clrConjugateTypeReference = new TypeReference(name, ns, target.Scope, targetTypeReference.IsValueType);

            // TODO: Find the module that contains the conjugate type
            clrConjugateTypeReference.Module = targetTypeReference.Module;
            return clrConjugateTypeReference;
        }

        private bool IsOSCorlib(AssemblyNameReference assembly)
        {
            // TODO: Use reference comparer
            return assembly.Name.StartsWith("OSCorlib");
        }

        private static void ParseNamespaceAndName(string namespaceAndName, out string ns, out string name)
        {
            Match match = Regex.Match(namespaceAndName, NamespaceAndNameRegex);
            if (!match.Success || match.Groups.Count != 3)
            {
                throw new CompilerException("Unable to parse namespace and name from: " + namespaceAndName);
            }
            ns = match.Groups[1].Value;
            name = match.Groups[2].Value;
        }

        public class AssemblyCompileInfo
        {
            public AssemblyDefinition SourceAssemblyDefinition { get; private set; }
            public AssemblyDefinition OutputAssemblyDefinition { get; set; }
            public string OutputFilePath { get; set; }

            public Dictionary<string, TypeDefinition> ImportedTypeDefinitions { get; private set; }
            public Dictionary<string, MethodDefinition> ImportedMethodDefinitions { get; private set; }

            public AssemblyCompileInfo(AssemblyDefinition sourceAssemblyDefinition)
            {
                this.SourceAssemblyDefinition = sourceAssemblyDefinition;
                this.ImportedTypeDefinitions = new Dictionary<string, TypeDefinition>();
                this.ImportedMethodDefinitions = new Dictionary<string, MethodDefinition>();
            }
        }

        public class Importer : DefaultImporter
        {
            public CLRHandler Handler { get; private set; }
            public AssemblyCompileInfo CompileInfo { get; private set; }

            public Importer(AssemblyCompileInfo compileInfo, CLRHandler handler)
                : base(compileInfo.OutputAssemblyDefinition.MainModule)
            {
                Handler = handler;
                CompileInfo = compileInfo;
            }

            public override AssemblyNameReference ImportAssembly(AssemblyNameReference asm)
            {
                AssemblyNameReference assemblyNameReference;
                if (Handler.TryGetReplacement(asm, out assemblyNameReference))
                {
                    asm = assemblyNameReference;
                }
                if (ReferenceComparer.AssemblyNameReferenceEquals(Module.Assembly.Name, asm))
                {
                    return Module.Assembly.Name;
                }
                return base.ImportAssembly(asm);
            }

            public override TypeReference ImportTypeReference(TypeReference t, ImportContext context)
            {
                try
                {
                    if (t.Module == Module)
                        return t;

                    TypeReference type;
                    if (Handler.TryGetReplacement(t, out type))
                    {
                        // generic?
                        GenericInstanceType genericInstanceType = t as GenericInstanceType;

                        if (genericInstanceType != null) // yes generic!
                        {
                            // add generic parameters and import generic arguments
                            GenericInstanceType replacementGenericInstanceType = new GenericInstanceType(type);
                            foreach (GenericParameter genericParameter in genericInstanceType.GenericParameters)
                            {
                                replacementGenericInstanceType.GenericParameters.Add(genericParameter);
                            }
                            foreach (TypeReference genericArgument in genericInstanceType.GenericArguments)
                            {
                                replacementGenericInstanceType.GenericArguments.Add(ImportTypeReference(genericArgument, context));
                            }
                            t = replacementGenericInstanceType;
                        }
                        else // not generic.
                        {
                            t = type;
                        }
                    }

                    if (t is TypeSpecification)
                        return GetTypeSpec((TypeSpecification)t, context);

                    if (t is GenericParameter)
                    {
                        // TODO: HACK!!!
                        return t;
                        //return GetGenericParameter((GenericParameter)t, context);
                    }

                    type = Module.TypeReferences[t.FullName];
                    if (type != null)
                        return type;

                    AssemblyNameReference asm;
                    if (t.Scope is AssemblyNameReference)
                    {
                        asm = ImportAssembly((AssemblyNameReference)t.Scope);
                    }
                    else if (t.Scope is ModuleDefinition)
                    {
                        asm = ImportAssembly(((ModuleDefinition)t.Scope).Assembly.Name);
                    }
                    else if (t.Namespace == "System")
                    {
                        // TODO: Use lookup table rather than checking for "System" namespace
                        asm = Handler._mscorlib;
                    }
                    else
                    {
                        throw new NotImplementedException();
                    }

                    type = new TypeReference(t.Name, t.Namespace, asm, t.IsValueType);
                    if (t.DeclaringType != null)
                    {
                        type.DeclaringType = ImportTypeReference(t.DeclaringType, context);
                    }

                    context.PushGenericContext(type);

                    foreach (GenericParameter gp in t.GenericParameters)
                        type.GenericParameters.Add(GenericParameter.Clone(gp, context));

                    context.PopGenericContext();

                    Module.TypeReferences.Add(type);
                    return type;
                }
                catch (Exception e)
                {
                    throw new CompilerException("Unable to import type reference " + t + ".  Import context is " + context + ".", e);
                }
            }

            public override MethodReference ImportMethodReference(MethodReference mr, ImportContext context)
            {
                if (mr.DeclaringType.Module == Module)
                    return mr;

                if (mr is MethodSpecification)
                    return GetMethodSpec(mr, context);

                MethodReference meth = (MethodReference)GetMemberReference(mr);
                if (meth != null)
                    return meth;

                meth = new MethodReference(
                    mr.Name,
                    null,
                    null,
                    mr.HasThis,
                    mr.ExplicitThis,
                    mr.CallingConvention);
                meth.DeclaringType = ImportTypeReference(mr.DeclaringType, context);

                //TypeReference contextType = meth.DeclaringType.GetOriginalType();
                TypeReference contextType = meth.DeclaringType;

                context.PushGenericContext(contextType, meth);

                foreach (GenericParameter gp in mr.GenericParameters)
                    meth.GenericParameters.Add(GenericParameter.Clone(gp, context));

                meth.ReturnType.ReturnType = ImportTypeReference(mr.ReturnType.ReturnType, context);

                foreach (ParameterDefinition param in mr.Parameters)
                    meth.Parameters.Add(new ParameterDefinition(
                        ImportTypeReference(param.ParameterType, context)));

                context.PopGenericContext();

                Module.MemberReferences.Add(meth);
                return meth;
            }
        }

        #region Tests

        [TestFixture]
        public class Tests
        {
            [Test]
            public void TestNamespaceAndNameRegex()
            {
                Dictionary<string, string[]> inputsAndOutputs = new Dictionary<string, string[]>();

                inputsAndOutputs.Add("namespace.name", new string[] { "namespace", "name" });
                inputsAndOutputs.Add("ns1.ns2.name", new string[] { "ns1.ns2", "name" });
                inputsAndOutputs.Add("ns1.ns2.ns3.name", new string[] { "ns1.ns2.ns3", "name" });

                foreach (KeyValuePair<string, string[]> inputAndOutput in inputsAndOutputs)
                {
                    string ns, name;
                    ParseNamespaceAndName(inputAndOutput.Key, out ns, out name);
                    Assert.AreEqual(ns, inputAndOutput.Value[0], "Could not parse namespace");
                    Assert.AreEqual(name, inputAndOutput.Value[1], "Could not parse name");
                }
            }
        }

        #endregion
    }
}
