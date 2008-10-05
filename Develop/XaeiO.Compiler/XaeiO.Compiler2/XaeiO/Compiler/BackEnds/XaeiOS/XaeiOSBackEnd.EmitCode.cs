// TODO: Instrinsic property getters and setters should not have "call" flow control

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

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public partial class XaeiOSBackEnd : CompilerTierBase, IBackEnd
    {
        public void EmitCode(MethodCompileInfo methodCompileInfo)
        {
            if (Compiler.Options.Verbocity > 0)
            {
                Console.WriteLine("XaeiOSBackend - EmitCode: " + methodCompileInfo.Method);
            }
            _methodCompileInfo = methodCompileInfo;
            _parameterSequenceMap = new Dictionary<string, int>();
            _cfg = _methodCompileInfo.CFG;
            _unboundFixups[_methodCompileInfo.Method] = new List<UnboundFixup>();
            _codeFormatter = new CodeFormatter();
            _temporaryRegisterCounter = 0;
            bool compilerImpl = false;

            CustomAttribute xaeiosMethodImplAttribute;
            if (AttributeHelper.TryGetCustomAttribute(_methodCompileInfo.Method, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out xaeiosMethodImplAttribute))
            {
                MethodImplOptions methodImplOptions = (MethodImplOptions)xaeiosMethodImplAttribute.ConstructorParameters[0];
                if ((methodImplOptions & MethodImplOptions.CompilerImpl) > 0)
                {
                    compilerImpl = true;
                }
            }

            if (MethodIsNonPreemptive(_methodCompileInfo.Method))
            {
                #region NonPreemptive method
                /*bool useExecutionBlocks = false;
                foreach (CFGNode n in _compileInfo.CFG.Vertices)
                {
                    if (n.FlowControl == FlowControl.Branch || n.FlowControl == FlowControl.ConditionalBranch)
                    {
                        useExecutionBlocks = true;
                        break;
                    }
                }*/
                if (!compilerImpl) // compiler implemented methods will be codegen'd by the special code emitter
                {
                    // TODO: Make the code generation pattern algorithms better so we can emit real non-preemptive code MOST of the time
                    if (!TryGenerateNonPreemptiveCodeObject())
                    {
                        GenerateExecutionBlocks();
                        TransformationUtility.PerformTransformation(new TransitiveClosureAndTopologicalOrder(), _methodCompileInfo);
                        GenerateNonPreemptiveCodeObjectWithExecutionBlocks();
                    }
                }

                _codeFormatter.Write("function(");
                /* calling convention: normal javascript calling convention (a0, a1, a2 ...)
                 */
                if (_methodCompileInfo.Method.Parameters.Count > 0)
                {
                    // write first n - 1 arguments
                    for (int i = 0; i < _methodCompileInfo.Method.Parameters.Count - 1; i++)
                    {
                        _parameterSequenceMap[_methodCompileInfo.Method.Parameters[i].Name] = i;
                        _codeFormatter.Write("a");
                        _codeFormatter.Write(i);
                        if (DebugSettings.CommentCode)
                        {
                            _codeFormatter.Write("/*");
                            _codeFormatter.Write(_methodCompileInfo.Method.Parameters[i].Name);
                            _codeFormatter.Write("*/");
                        }
                        _codeFormatter.Write(",");
                    }

                    // write the last argument
                    _codeFormatter.Write("a");
                    _codeFormatter.Write(_methodCompileInfo.Method.Parameters.Count - 1);
                    if (DebugSettings.CommentCode)
                    {
                        _codeFormatter.Write("/*");
                        _codeFormatter.Write(_methodCompileInfo.Method.Parameters[_methodCompileInfo.Method.Parameters.Count - 1].Name);
                        _codeFormatter.Write("*/");
                    }
                    _parameterSequenceMap[_methodCompileInfo.Method.Parameters[_methodCompileInfo.Method.Parameters.Count - 1].Name] = _methodCompileInfo.Method.Parameters.Count - 1;
                }
                _codeFormatter.Write(")");
                if (DebugSettings.CommentCode)
                {
                    _codeFormatter.WriteLine();
                    _codeFormatter.Write(" // ");
                    AddMethodCodePointerFixup(_methodCompileInfo.Method, _codeFormatter.GetOffset(), ImageFormat.FixupType.CodeSection);
                    _codeFormatter.Write(": ");
                    _codeFormatter.Write(_methodCompileInfo.Method.ToString());
                }
                _codeFormatter.WriteLine();
                _codeFormatter.Write("{");
                _codeFormatter.WriteLine();
                _codeFormatter.WriteIndent();

                if (DebugSettings.TraceKernelMethods)
                {
                    _codeFormatter.Write("LogWrite(\"TRACE\", \"" + _methodCompileInfo.Method.ToString() + "\")");
                    _codeFormatter.WriteLine();
                }

                // emit registers
                if (_methodCompileInfo.RegisterMap.Count > 0)
                {
                    _codeFormatter.Write("var ");
                    EmitRegisterSet(true);
                    _codeFormatter.Write(";");
                    _codeFormatter.WriteLine();
                }

                // emit locals
                if (_methodCompileInfo.LocalMap.Count > 0)
                {
                    _codeFormatter.Write("var ");

                    // write first n - 1 locals
                    for (int i = 0; i < _methodCompileInfo.Method.Body.Variables.Count - 1; i++)
                    {
                        _codeFormatter.Write("l");
                        _codeFormatter.Write(_methodCompileInfo.LocalMap[_methodCompileInfo.Method.Body.Variables[i].Name]);
                        _codeFormatter.Write(",");
                    }

                    // write the last local
                    _codeFormatter.Write("l");
                    _codeFormatter.Write(_methodCompileInfo.LocalMap[_methodCompileInfo.Method.Body.Variables[_methodCompileInfo.LocalMap.Count - 1].Name]);

                    _codeFormatter.Write(";");
                    _codeFormatter.WriteLine();
                }

                if (compilerImpl)
                {
                    _compilerImplementedMethods[_methodCompileInfo.Method.ToString()](); // call the code emitter for this compiler implemented method
                }
                else
                {
                    // emit special temp register
                    _codeFormatter.Write("var t;");
                    _codeFormatter.WriteLine();

                    EmitStatementCode(_methodCompileInfo.CodeObject);
                }

                _codeFormatter.WriteLine();
                _codeFormatter.WriteOutdent();
                _codeFormatter.Write("}");
                #endregion
            }
            else
            {
                #region Preemptive method

                if (!compilerImpl) // compiler implemented methods will be codegen'd by the special code emitter
                {
                    GenerateExecutionBlocks();
                    TransformationUtility.PerformTransformation(new TransitiveClosureAndTopologicalOrder(), _methodCompileInfo);
                    GeneratePreemptiveCodeObject();
                }

                /*
                DuffsDevice();
                NestedConditionalStatementsToSwitch();
                ApplyRegisterAllocation();*/

                _codeFormatter.Write("function(" +
                    SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ExecutionPointer) + "," +
                    SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.TimeSliceEnd) + "," +
                    SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ReturnValue) + "," +
                    SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ParentContinuation) + "," +
                    SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame));
                /* calling convention: (special registers)
                 * $ep = execution pointer
                 * $end = time slice end time
                 * $rv = return value
                 * $pc = parent continuation
                 * $f = frame (this, function, exception catch pointer, exception, parameters, locals, stackalloc(not supported yet))
                 */

                #region add registers to function declaration
                EmitRegisterSet();
                #endregion

                _codeFormatter.Write(")");

                if (DebugSettings.CommentCode)
                {
                    _codeFormatter.WriteLine();
                    _codeFormatter.Write("// ");
                    AddMethodCodePointerFixup(_methodCompileInfo.Method, _codeFormatter.GetOffset(), ImageFormat.FixupType.CodeSection);
                    _codeFormatter.Write(": ");
                    _codeFormatter.Write(_methodCompileInfo.Method.ToString());
                }

                _codeFormatter.WriteLine();
                _codeFormatter.Write("{");
                _codeFormatter.WriteLine();
                _codeFormatter.WriteIndent();

                if (DebugSettings.TraceMethods)
                {
                    _codeFormatter.Write("LogWrite(\"TRACE\", \"" + _methodCompileInfo.Method.ToString() + ":\" + " + SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ExecutionPointer) + ")");
                    _codeFormatter.WriteLine();
                }

                if (compilerImpl)
                {
                    _compilerImplementedMethods[_methodCompileInfo.Method.ToString()](); // call the code emitter for this compiler implemented method
                }
                else
                {
                    // emit special temp register
                    _codeFormatter.Write("var t;");
                    _codeFormatter.WriteLine();
                    EmitStatementCode(_methodCompileInfo.CodeObject);
                }
                _codeFormatter.WriteLine();
                _codeFormatter.WriteOutdent();
                _codeFormatter.Write("}");
                #endregion
            }

            // static constructor?
            if (methodCompileInfo.Method.Name == ".cctor" && methodCompileInfo.Method.IsSpecialName) // TODO: extract this check into helper method
            {
                // TODO: build a graph of class dependencies for static constructor call order
                // TODO: call static constructors in order in initialization section
            }
        }

        private void EmitReflectionMetadataInitializationCode(AssemblyDefinition assemblyDefinition)
        {
            _codeFormatter = _initializationSectionFormatter;
            _defaultFixupType = ImageFormat.FixupType.InitializationSection;

            // setup metadata init store
            _metadataInitializationDataStore = new Dictionary<object, int>();
            VariableDefinition metadataInitializationDataStoreVariable = CreateTemporaryRegister();
            EmitStatementCode(new AssignStatement(new VariableDefinitionExpression(metadataInitializationDataStoreVariable), new DynamicExpression(delegate()
            {
                _codeFormatter.Write("{}");
            })));
            _codeFormatter.WriteLine();
            _metadataInitializationDataStoreVariableReferenceExpression = new VariableReferenceExpression(metadataInitializationDataStoreVariable);

            // call RuntimeHelpers::InitializeMetadata
            EmitStatementCode(new ExpressionStatement(GetMethodInvokeExpression(OSCorlibInitializeMetadataMethod)));

            EmitAssemblyMetadata(assemblyDefinition);

        }

        private Dictionary<object, int> _metadataInitializationDataStore;
        private VariableReferenceExpression _metadataInitializationDataStoreVariableReferenceExpression;
        private CodeFormatter _codeFormatter;
        private Dictionary<Type, Reflection.MethodInfo> _emitCodeMethodMap;
        private void InitializeEmitCodeMethodMap()
        {
            _emitCodeMethodMap = new Dictionary<Type, Reflection.MethodInfo>();
            PopulateMethodMap<IStatement>(_emitCodeMethodMap, this.GetType(), "EmitCode");
            PopulateMethodMap<IExpression>(_emitCodeMethodMap, this.GetType(), "EmitCode");
        }

        #region Expressions

        public void EmitExpressionCode(IExpression expression)
        {
            FoldByType<IExpression>(expression, _emitCodeMethodMap);
        }

        #region Special Expressions
        private void EmitCode(ExecutionPointerSpecialRegisterReferenceExpression expression)
        {
            EmitCode((SpecialRegisterReferenceExpression)expression);
        }

        private void EmitCode(FrameSlotReferenceExpression expression)
        {
            _codeFormatter.Write(SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame) + "[");
            _codeFormatter.Write((int)expression.FrameSlot);
            _codeFormatter.Write("]");
        }

        private void EmitCode(FramePropertyReferenceExpression expression)
        {
            _codeFormatter.Write(SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame) + ".");
            _codeFormatter.Write(FramePropertyHelper.GetFramePropertyName(expression.FrameProperty));
        }

        private void EmitCode(ParentContinuationObjectRegisterReferenceExpression expression)
        {
            EmitCode((SpecialRegisterReferenceExpression)expression);
        }

        private void EmitCode(ParentContinuationObjectSpecialRegisterReferenceExpression expression)
        {
            EmitCode((IArrayIndexerExpression)expression);
        }

        private void EmitCode(SpecialRegisterReferenceExpression expression)
        {
            _codeFormatter.Write(SpecialRegisterHelper.GetSpecialRegisterName(expression.Register));
        }

        private void EmitCode(DynamicExpression expression)
        {
            expression.Delegate();
        }

        private void EmitCode(InstanceOfExpression expression)
        {
            EmitExpressionCode(expression.Expression);
            _codeFormatter.Write(" instanceof ");
            _codeFormatter.Write(expression.TypeName);
        }

        private void EmitCode(ExceptionExpression expression)
        {
            EmitCode(new FramePropertyReferenceExpression(FrameProperty.Exception));
        }

        private void EmitCode(ContinuationObjectExpression expression)
        {
            _codeFormatter.Write("(t=[" +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ExecutionPointer) + "," +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.TimeSliceEnd) + "," +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ReturnValue) + "," +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.ParentContinuation) + "," +
                SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame) + ""); // TODO: use specialregisterhelper here
            EmitRegisterSet();
            _codeFormatter.Write("],t.$=null,t)");
        }
        #endregion

        private void EmitCode(IAddressDereferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IAddressOfExpression expression)
        {
            if (expression.Expression.Type.IsValueType)
            {
                // TODO: Most likely this is a box operation right?  so we can just emit the unboxed value since we have no concept of boxing in xaeios
                EmitExpressionCode(expression.Expression);
            }
            else
            {
                throw new NotImplementedException();
            }
        }
        private void EmitCode(IAddressOutExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IAddressReferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IArgumentListExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IArgumentReferenceExpression expression)
        {
            if (CurrentMethodIsNonPreemptive())
            {
                _codeFormatter.WriteFormat("a{0}", _parameterSequenceMap[expression.Parameter.Name]);
            }
            else
            {
                int register;
                if (_methodCompileInfo.RegisterMap.TryGetValue(expression.Parameter.Name, out register))
                {
                    _codeFormatter.WriteFormat("r{0}", register);
                }
                else
                {
                    _codeFormatter.WriteFormat("{0}[{1}]", SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame), (int)FrameSlot.Max + expression.Parameter.Sequence - 1);
                }
            }
        }
        private void EmitCode(IArrayCreateExpression expression)
        {
            if (expression.Initializer != null)
            {
                EmitExpressionCode(expression.Initializer);
            }
            else
            {
                ITypeReferenceExpression typeReferenceExpression = new TypeReferenceExpression(OSCorlibRuntimeHelpersType);
                IMethodReferenceExpression methodReferenceExpression = new MethodReferenceExpression(typeReferenceExpression, OSCorlibCreateArrayMethod);
                IMethodInvokeExpression methodInvokeExpression = new MethodInvokeExpression(methodReferenceExpression);
                ArrayType arrayType = (ArrayType)expression.Type;
                TypeReference elementType = arrayType.ElementType;
                methodInvokeExpression.Arguments.Add(new TypeReferenceExpression(elementType));
                Debug.Assert(expression.Dimensions.Count == 1);
                methodInvokeExpression.Arguments.Add(expression.Dimensions[0]);
                EmitExpressionCode(methodInvokeExpression);
            }
        }
        private void EmitCode(IArrayIndexerExpression expression)
        {
            EmitExpressionCode(expression.Target);
            // plus 1 because the first slot is the vtable slot
            _codeFormatter.Write("[");
            IList<IExpression> indices = expression.Indices;
            if (indices.Count != 1)
            {
                throw new CompilerException("XaeiOS only supports uni-dimensional arrays");
            }
            EmitExpressionCode(indices[0]);
            _codeFormatter.Write("]");
        }
        private void EmitCode(IArrayInitializerExpression expression)
        {
            _codeFormatter.Write("[");
            for (int i = 0; i < expression.Expressions.Count; i++)
            {
                EmitExpressionCode(expression.Expressions[i]);
                if (i < expression.Expressions.Count - 1)
                {
                    _codeFormatter.Write(",");
                }
            }
            _codeFormatter.Write("]");
        }
        private void EmitCode(IArrayLengthExpression expression)
        {
            EmitExpressionCode(expression.Expression);
            // minus 1 because the first slot is the vtable slot
            _codeFormatter.Write(".length");
        }
        private void EmitCode(IAssignExpression expression)
        {
            EmitExpressionCode(expression.Target);
            _codeFormatter.Write(" = ");
            EmitExpressionCode(expression.Expression);
            if (DebugSettings.CommentCode)
            {
                if (!((expression.Target is SpecialRegisterReferenceExpression && !(((SpecialRegisterReferenceExpression)expression.Target).Register == SpecialRegister.ReturnValue)) || expression.Target is ParentContinuationObjectSpecialRegisterReferenceExpression))
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(expression.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(IBoxExpression expression)
        {
            string nativeConstructor;
            if (ReferenceComparer.TypeReferenceEquals(expression.Type, CoreTypes.Boolean, false))
            {
                nativeConstructor = "new Boolean";
            }
            else if (
                ReferenceComparer.TypeReferenceEquals(expression.Type, CoreTypes.Int32, false) ||
                ReferenceComparer.TypeReferenceEquals(expression.Type, CoreTypes.Int64, false) ||
                ReferenceComparer.TypeReferenceEquals(expression.Type, CoreTypes.Single, false)
                )
            {
                // TODO: Box remaining number types using attribute in corlib
                nativeConstructor = "new Number";
            }
            else if (expression.Type.IsValueType)
            {
                // set the appropriate vtable
                _codeFormatter.Write("(t=");
                EmitExpressionCode(expression.Expression);
                _codeFormatter.Write(",t.$=");
                _codeFormatter.Write(DataStore);
                _codeFormatter.Write("[");
                AddVTableDataPointerFixup(expression.Type);
                _codeFormatter.Write("],t)");
                return;
            }
            else
            {
                nativeConstructor = null;
                Console.WriteLine("Did not know how to box type: " + expression.Type + " - " + expression.Type.GetType());
            }

            if (nativeConstructor != null)
            {
                _codeFormatter.Write(nativeConstructor);
                _codeFormatter.Write("(");
            }

            EmitExpressionCode(expression.Expression);

            if (nativeConstructor != null)
            {
                _codeFormatter.Write(")");
            }
        }
        private void EmitCode(IBaseReferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IBinaryExpression expression)
        {
            _codeFormatter.Write("(");
            EmitExpressionCode(expression.Left);
            _codeFormatter.Write(" ");
            switch (expression.Operator)
            {
                case BinaryOperator.Add:
                    {
                        _codeFormatter.Write("+");
                        break;
                    }
                case BinaryOperator.BitwiseAnd:
                    {
                        _codeFormatter.Write("&");
                        break;
                    }
                case BinaryOperator.BitwiseOr:
                    {
                        _codeFormatter.Write("|");
                        break;
                    }
                case BinaryOperator.LessThan:
                    {
                        _codeFormatter.Write("<");
                        break;
                    }
                case BinaryOperator.LessThanOrEqual:
                    {
                        _codeFormatter.Write("<=");
                        break;
                    }
                case BinaryOperator.GreaterThan:
                    {
                        _codeFormatter.Write(">");
                        break;
                    }
                case BinaryOperator.GreaterThanOrEqual:
                    {
                        _codeFormatter.Write(">=");
                        break;
                    }
                case BinaryOperator.Multiply:
                    {
                        _codeFormatter.Write("*");
                        break;
                    }
                case BinaryOperator.Divide:
                    {
                        _codeFormatter.Write("/");
                        break;
                    }
                case BinaryOperator.ShiftLeft:
                    {
                        _codeFormatter.Write("<<");
                        break;
                    }
                case BinaryOperator.ShiftRight:
                    {
                        _codeFormatter.Write(">>");
                        break;
                    }
                case BinaryOperator.Subtract:
                    {
                        _codeFormatter.Write("-");
                        break;
                    }
                case BinaryOperator.IdentityEquality:
                case BinaryOperator.ValueEquality:
                    {
                        _codeFormatter.Write("==");
                        break;
                    }
                case BinaryOperator.IdentityInequality:
                case BinaryOperator.ValueInequality:
                    {
                        _codeFormatter.Write("!=");
                        break;
                    }
                case BinaryOperator.Modulus:
                    {
                        _codeFormatter.Write("%");
                        break;
                    }
                case BinaryOperator.BooleanAnd:
                    {
                        _codeFormatter.Write("&&");
                        break;
                    }
                default:
                    {
                        throw new NotImplementedException("Binary operator: " + expression.Operator);
                    }
            }
            _codeFormatter.Write(" ");
            EmitExpressionCode(expression.Right);
            _codeFormatter.Write(")");
        }
        private void EmitCode(ICanCastExpression expression)
        {
            MethodInvokeExpression newMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCastMethod);
            newMethodInvokeExpression.Arguments.Add(expression.Expression);
            newMethodInvokeExpression.Arguments.Add(new TypeReferenceExpression(expression.TargetType));

            // don't throw if it we can't cast
            newMethodInvokeExpression.Arguments.Add(new BooleanLiteralExpression(false));

            BinaryExpression castReturnedNullExpression = new BinaryExpression(newMethodInvokeExpression, BinaryOperator.IdentityInequality, new NullLiteralExpression());
            EmitCode(castReturnedNullExpression);

            if (DebugSettings.CommentCode)
            {
                _codeFormatter.Write("/*");
                _codeFormatter.Write(expression.ToString());
                _codeFormatter.Write("*/");
            }
        }
        private void EmitCode(ICastExpression expression)
        {
            // TODO: do appropriate Number conversion, this method is retarded
            TypeDefinition targetType = ReferenceResolver.ResolveTypeReference(expression.TargetType, _assemblyCompileInfo.Assembly.Resolver);
            TypeDefinition sourceType = ReferenceResolver.ResolveTypeReference(expression.Expression.Type, _assemblyCompileInfo.Assembly.Resolver);
            if (ReferenceComparer.TypeReferenceEquals(sourceType, targetType))
            {
                EmitExpressionCode(expression.Expression);
            }
            else if (ReferenceComparer.TypeReferenceEquals(targetType, CoreTypes.Int32))
            {
                if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Int64))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Double))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Single))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else
                {
                    throw new NotImplementedException();
                }
            }
            else if (ReferenceComparer.TypeReferenceEquals(targetType, CoreTypes.Int64))
            {
                if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Int32))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Double))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Single))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else
                {
                    throw new NotImplementedException();
                }
            }
            else if (ReferenceComparer.TypeReferenceEquals(targetType, CoreTypes.Double))
            {
                if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Int32))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Int64))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Double))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Single))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else
                {
                    throw new NotImplementedException();
                }
            }
            else if (ReferenceComparer.TypeReferenceEquals(targetType, CoreTypes.Single))
            {
                if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Int32))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else if (ReferenceComparer.TypeReferenceEquals(sourceType, CoreTypes.Double))
                {
                    EmitExpressionCode(expression.Expression);
                }
                else
                {
                    throw new NotImplementedException();
                }
            }
            else
            {
                // regular cast expression
                MethodInvokeExpression newMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCastMethod);
                newMethodInvokeExpression.Arguments.Add(expression.Expression);
                newMethodInvokeExpression.Arguments.Add(new TypeReferenceExpression(expression.TargetType));

                // throw if we can't cast
                newMethodInvokeExpression.Arguments.Add(new BooleanLiteralExpression(true));
                EmitCode(newMethodInvokeExpression);

                if (DebugSettings.CommentCode)
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(expression.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(IConditionExpression expression)
        {
            EmitExpressionCode(expression.Condition);
            _codeFormatter.Write(" ? ");
            EmitExpressionCode(expression.Then);
            _codeFormatter.Write(" : ");
            EmitExpressionCode(expression.Else);
        }
        private void EmitCode(IDelegateCreateExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IDelegateInvokeExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IEventReferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IFieldReferenceExpression expression)
        {
            // static field?
            if (expression.Target is ITypeReferenceExpression)
            {
                _codeFormatter.Write("_[");
                AddStaticFieldDataPointerFixup(expression.Field);
                _codeFormatter.Write("]");
            }
            else
            {
                #region intrinsic field
                FieldDefinition fieldDefinition = ReferenceResolver.ResolveFieldReference(expression.Field, _assemblyCompileInfo.Assembly.Resolver);
                TypeDefinition declaringType = ResolveTypeReference(expression.Field.DeclaringType);
                CustomAttribute intrinsicAttribute;
                if (AttributeHelper.TryGetCustomAttribute(declaringType, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
                {
                    CustomAttribute fieldCustomAttribute;
                    string intrinsicFieldName = null;
                    if (AttributeHelper.TryGetCustomAttribute(fieldDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute", out fieldCustomAttribute))
                    {
                        if (fieldCustomAttribute.Properties.Contains("Name"))
                        {
                            intrinsicFieldName = fieldCustomAttribute.Properties["Name"].ToString();
                        }
                        else if (fieldCustomAttribute.ConstructorParameters.Count > 0)
                        {
                            intrinsicFieldName = fieldCustomAttribute.ConstructorParameters[0].ToString();
                        }
                    }
                    if (intrinsicFieldName != null)
                    {
                        EmitExpressionCode(expression.Target);
                        _codeFormatter.Write(".");
                        _codeFormatter.Write(intrinsicFieldName);
                        return;
                    }
                }
                #endregion

                EmitExpressionCode(expression.Target);
                _codeFormatter.WriteFormat("[{0}]", GetFieldOffset(expression.Field));
            }
        }
        private void EmitCode(IGenericDefaultExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ILiteralExpression expression)
        {
            StringLiteralExpression stringLiteralExpression = expression as StringLiteralExpression;
            if (stringLiteralExpression != null)
            {
                // TODO: Find all chars to escape
                _codeFormatter.WriteFormat("\"{0}\"", stringLiteralExpression.String.Replace("\n", "\\n").Replace("\r", "\\r").Replace("\t", "\\t").Replace("\"", "\\\""));
                return;
            }

            Int32LiteralExpression int32LiteralExpression = expression as Int32LiteralExpression;
            if (int32LiteralExpression != null)
            {
                _codeFormatter.Write(int32LiteralExpression.Int32.ToString());
                return;
            }

            Int64LiteralExpression int64LiteralExpression = expression as Int64LiteralExpression;
            if (int64LiteralExpression != null)
            {
                _codeFormatter.Write(int64LiteralExpression.Int64.ToString());
                return;
            }

            Float32LiteralExpression float32LiteralExpression = expression as Float32LiteralExpression;
            if (float32LiteralExpression != null)
            {
                _codeFormatter.Write(float32LiteralExpression.Float32.ToString());
                return;
            }

            Float64LiteralExpression float64LiteralExpression = expression as Float64LiteralExpression;
            if (float64LiteralExpression != null)
            {
                _codeFormatter.Write(float64LiteralExpression.Float64.ToString());
                return;
            }

            BooleanLiteralExpression booleanLiteralExpression = expression as BooleanLiteralExpression;
            if (booleanLiteralExpression != null)
            {
                _codeFormatter.Write(booleanLiteralExpression.Boolean ? "true" : "false");
                return;
            }

            NullLiteralExpression nullLiteralExpression = expression as NullLiteralExpression;
            if (nullLiteralExpression != null)
            {
                _codeFormatter.Write("null");
                return;
            }

            throw new NotImplementedException("Unknown literal expression: " + expression.Type + " - " + expression);
        }
        private void EmitCode(IMethodInvokeExpression expression)
        {
            IMethodReferenceExpression methodReferenceExpression = expression.Method as IMethodReferenceExpression;
            if (methodReferenceExpression != null)
            {
                // TODO: ReferenceResolver should use caching to save time - we can cache a hash of object state to make sure it's not dirty
                MethodDefinition methodDefinition;
                if (!ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, _assemblyCompileInfo.Assembly.Resolver, out methodDefinition))
                {
                    throw new CompilerException("Could not resolve method reference: " + methodReferenceExpression.Method);
                }

                bool emitMethodReferenceExpression = true;
                string inlineImplementationFormatString = null;
                bool nonPreemptive = false;
                bool useNativeCallingConvention = false;
                bool systemCall = false;

                #region delegates, check method implementation attributes, and emit inline implementation

                bool isDelegateInvokeMethod = IsDelegateInvokeMethod(methodDefinition);
                bool isDelegateCreateMethod = IsDelegateCreateMethod(methodDefinition);
                if (isDelegateInvokeMethod || isDelegateCreateMethod)
                {
                    if (AttributeHelper.HasCustomAttribute(methodDefinition.DeclaringType, "System.Runtime.InteropServices", "NativeDelegateAttribute"))
                    {
                        if (isDelegateInvokeMethod) // native delegate invoke
                        {
                            // invoking a native delegate
                            EmitExpressionCode(methodReferenceExpression.Target); // methodReferenceExpression.Target is actual function
                            emitMethodReferenceExpression = false;
                            useNativeCallingConvention = true;
                            _codeFormatter.Write("(");
                        }
                        else // native delegate create
                        {
                            // creating a native delegate was handled by the object create expression emit code method
                            OmitNewLine();
                            OmitSemicolon();
                            return;
                        }
                    }
                    else
                    {
                        if (isDelegateInvokeMethod) // non-native delegate invoke
                        {
                            MethodInvokeExpression newMethodInvokeExpression = new MethodInvokeExpression(new MethodReferenceExpression(methodReferenceExpression.Target, OSCorlibDelegateInvokeMethod, OSCorlibDelegateInvokeMethod.IsVirtual));
                            IArrayCreateExpression argumentsArrayCreateExpression = new ArrayCreateExpression(CoreTypes.Object, new Int32LiteralExpression(expression.Arguments.Count));

                            // TODO: Use the array create method that defines the array type along with the elements
                            // for now, just create a native array like we do in EmitCode(IArrayCreateExpression)
                            DynamicExpression createArrayExpression = new DynamicExpression(delegate()
                            {
                                // create a new object[] to put args in
                                _codeFormatter.Write("[");
                                for (int i = 0; i < expression.Arguments.Count; i++)
                                {
                                    EmitExpressionCode(expression.Arguments[i]);
                                    if (i < expression.Arguments.Count - 1)
                                    {
                                        _codeFormatter.Write(", ");
                                    }
                                }
                                _codeFormatter.Write("]");
                            });
                            newMethodInvokeExpression.Arguments.Add(createArrayExpression);

                            EmitCode(newMethodInvokeExpression);
                            return;
                        }
                        else // non-native delegate create method
                        {
                            MethodInvokeExpression newMethodInvokeExpression = new MethodInvokeExpression(new MethodReferenceExpression(new TypeReferenceExpression(CoreTypes.Delegate), OSCorlibDelegateCreateMethod));
                            newMethodInvokeExpression.Arguments.Add(methodReferenceExpression.Target);
                            foreach (IExpression argument in expression.Arguments)
                            {
                                newMethodInvokeExpression.Arguments.Add(argument);
                            }
                            EmitCode(newMethodInvokeExpression);
                            return;
                        }
                    }
                }
                else
                {
                    CustomAttribute xaeiosMethodImplAttribute;
                    if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute", out xaeiosMethodImplAttribute))
                    {
                        MethodImplOptions methodImplOptions = (MethodImplOptions)xaeiosMethodImplAttribute.ConstructorParameters[0];
                        if ((methodImplOptions & MethodImplOptions.CompilerImpl) > 0 && (methodImplOptions & MethodImplOptions.Inline) > 0)
                        {
                            EmitInlineCompilerImplementedMethodInvokeExpression(methodDefinition, expression);
                            return;
                        }
                        if ((methodImplOptions & MethodImplOptions.NonPreemptive) > 0)
                        {
                            nonPreemptive = true;
                        }
                        if ((methodImplOptions & MethodImplOptions.SystemCall) > 0)
                        {
                            systemCall = true;
                        }
                        if ((methodImplOptions & MethodImplOptions.Inline) > 0)
                        {
                            inlineImplementationFormatString = (string)xaeiosMethodImplAttribute.Properties["Implementation"];
                        }
                    }

                    #region inline implementation
                    if (inlineImplementationFormatString != null)
                    {
                        CodeFormatter savedCodeFormatter = _codeFormatter;
                        savedCodeFormatter.FlushIndents();
                        List<UnboundFixup> savedUnboundFixups = _unboundFixups[_methodCompileInfo.Method];
                        List<UnboundFixup> unboundFixups = _unboundFixups[_methodCompileInfo.Method] = new List<UnboundFixup>();

                        // TODO: Check validity of implementation string, MAKE SURE ONLY ONE INSTANCE OF {this} OF EACH ARGUMENT

                        StringBuilder sb = new StringBuilder();
                        int currentIndex = 0;
                        Regex regex = new Regex("\\{(this|\\d+)\\}");
                        MatchCollection matches = regex.Matches(inlineImplementationFormatString);

                        for (int i = 0; i < matches.Count; i++)
                        {
                            Match match = matches[i];
                            string indexString = match.Groups[1].Value;
                            IExpression expressionToEmit;
                            if (indexString == "this")
                            {
                                if (!methodDefinition.HasThis)
                                {
                                    throw new CompilerException("Invalid inline implementation string");
                                }
                                expressionToEmit = methodReferenceExpression.Target;
                            }
                            else
                            {
                                int index;
                                if (!int.TryParse(indexString, out index))
                                {
                                    throw new CompilerException("Invalid inline implementation string.  Cannot parse argument {" + indexString + "}: " + inlineImplementationFormatString);
                                }
                                if (index < 0 || index >= expression.Arguments.Count)
                                {
                                    throw new CompilerException("Invalid inline implementation string.  Cannot reference non-existent argument {" + index + "}: " + inlineImplementationFormatString);
                                }
                                expressionToEmit = expression.Arguments[index];
                            }

                            _codeFormatter = new CodeFormatter();
                            EmitExpressionCode(expressionToEmit);
                            sb.Append(inlineImplementationFormatString.Substring(currentIndex, match.Index - currentIndex));
                            if (unboundFixups.Count > 0)
                            {
                                foreach (UnboundFixup unboundFixup in unboundFixups)
                                {
                                    unboundFixup.Offset = unboundFixup.Offset + (uint)sb.Length + (uint)savedCodeFormatter.GetOffset();
                                    savedUnboundFixups.Add(unboundFixup);
                                }
                                unboundFixups.Clear();
                            }
                            sb.Append(_codeFormatter.ToString());
                            currentIndex = match.Index + match.Length;
                        }

                        // add the rest of the inline implementation string
                        sb.Append(inlineImplementationFormatString.Substring(currentIndex, inlineImplementationFormatString.Length - currentIndex));

                        _codeFormatter = savedCodeFormatter;
                        _unboundFixups[_methodCompileInfo.Method] = savedUnboundFixups;
                        _codeFormatter.Write(sb.ToString());
                        return;
                    }
                    #endregion
                }
                #endregion

                #region intrinsic properties
                // TODO: Intrinsic indexers are not handled properly
                // TODO: XaeiOSInitializingTransformation should change these nodes to FlowControl.Next rather than Call
                if (methodDefinition.IsSpecialName)
                {
                    bool isGet = methodDefinition.Name.StartsWith("get_");
                    bool isSet = methodDefinition.Name.StartsWith("set_");
                    if (isGet || isSet)
                    {
                        TypeDefinition declaringType = ResolveTypeReference(methodDefinition.DeclaringType);
                        CustomAttribute intrinsicAttribute;
                        if (AttributeHelper.TryGetCustomAttribute(declaringType, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
                        {
                            string propertyName = methodDefinition.Name.Substring("get_".Length);
                            foreach (PropertyDefinition propertyDefinition in declaringType.Properties)
                            {
                                if (propertyDefinition.Name == propertyName)
                                {
                                    CustomAttribute propertyCustomAttribute;
                                    if (AttributeHelper.TryGetCustomAttribute(propertyDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute", out propertyCustomAttribute))
                                    {
                                        if (propertyCustomAttribute.Properties.Contains("Name"))
                                        {
                                            propertyName = propertyCustomAttribute.Properties["Name"].ToString();
                                        }
                                        else if (propertyCustomAttribute.ConstructorParameters.Count > 0)
                                        {
                                            propertyName = propertyCustomAttribute.ConstructorParameters[0].ToString();
                                        }
                                    }
                                    break;
                                }
                            }
                            if (isGet)
                            {
                                EmitExpressionCode(methodReferenceExpression.Target);
                                _codeFormatter.Write(".");
                                _codeFormatter.Write(propertyName);
                            }
                            else
                            {
                                EmitExpressionCode(methodReferenceExpression.Target);
                                _codeFormatter.Write(".");
                                _codeFormatter.Write(propertyName);
                                _codeFormatter.Write(" = ");
                                EmitExpressionCode(expression.Arguments[0]);
                            }
                            return;
                        }
                    }
                }
                #endregion

                bool needComma = false;
                if (emitMethodReferenceExpression)
                {
                    if (systemCall)
                    {
                        IMethodReferenceExpression systemCallMethodReferenceExpression = GetSystemCallMethodReferenceExpression(methodReferenceExpression);
                        EmitCode(systemCallMethodReferenceExpression, true);
                    }
                    else
                    {
                        EmitCode(methodReferenceExpression, true, out needComma);
                    }
                }

                bool currentMethodIsNonPreemptive = CurrentMethodIsNonPreemptive();
                bool currentMethodIsCriticalSection = CurrentMethodIsCriticalSection();
                // call the method differently according to the calling convention
                if (!useNativeCallingConvention)
                {
                    if (nonPreemptive)
                    {
                        useNativeCallingConvention = true;
                    }
                    else if (MethodUsesNativeCallingConvention(methodDefinition))
                    {
                        useNativeCallingConvention = true;
                    }
                }
                // TODO: Make sure that preemptive methods do not override virtual non-preemptive methods or interface non-preemptive methods
                if (useNativeCallingConvention)
                {
                    // arguments
                    if (expression.Arguments.Count > 0)
                    {
                        if (needComma)
                        {
                            _codeFormatter.Write(",");
                        }
                        EmitExpressionCode(expression.Arguments[0]);
                    }
                    for (int i = 1; i < expression.Arguments.Count; i++)
                    {
                        _codeFormatter.Write(",");
                        EmitExpressionCode(expression.Arguments[i]);
                    }
                }
                else
                {
                    if (needComma)
                    {
                        _codeFormatter.Write(",");
                    }

                    // execution pointer
                    // initial execution pointer is 0 so that the method knows it was the first time called and sets up the frame
                    _codeFormatter.Write("0,");

                    // time slice end
                    if (currentMethodIsCriticalSection || currentMethodIsNonPreemptive)
                    {
                        _codeFormatter.Write("Number.POSITIVE_INFINITY");
                    }
                    else
                    {
                        _codeFormatter.Write(SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.TimeSliceEnd));
                    }
                    _codeFormatter.Write(",");

                    // return value
                    _codeFormatter.Write("null,"); // TODO: can we set return value to null? maybe we need an undefined value

                    // parent continuation object
                    if (currentMethodIsNonPreemptive)
                    {
                        _codeFormatter.Write("[],"); // non preemptive methods have no continuation object
                    }
                    else
                    {
                        EmitExpressionCode(new ContinuationObjectExpression());
                        _codeFormatter.Write(",");
                    }

                    // new frame
                    _codeFormatter.Write("[");
                    {
                        // this
                        _codeFormatter.Write("null,");

                        // function
                        _codeFormatter.Write("null");

                        // arguments
                        for (int i = 0; i < expression.Arguments.Count; i++)
                        {
                            _codeFormatter.Write(",");
                            EmitExpressionCode(expression.Arguments[i]);
                        }
                    }
                    _codeFormatter.Write("]");
                }

                _codeFormatter.Write(")");
                /*
                if (DebugSettings.CommentCode)
                {
                    _codeFormatter.Write("// " + methodReferenceExpression.Method.ToString());
                }*/
            }
            else
            {
                throw new NotImplementedException();
            }
        }

        private void EmitCode(IMethodReferenceExpression expression)
        {
            bool needComma;
            EmitCode(expression, false, out needComma);
        }

        private void EmitCode(IMethodReferenceExpression expression, out bool needComma)
        {
            EmitCode(expression, false, out needComma);
        }

        private void EmitCode(IMethodReferenceExpression expression, bool makeCall)
        {
            bool needComma;
            EmitCode(expression, makeCall, out needComma);
        }

        /// <summary>
        /// Emits a method reference expression
        /// </summary>
        /// <remarks>
        /// This emit code method understands method calling conventions and is responsible for emitting the first "(" of a method call
        /// The called must close that parenthesis (inserting arguments if necessary);
        /// </remarks>
        /// <param name="expression"></param>
        /// <param name="needComma">Returns whether or not a comma needs to be emitted before emitting arguments</param>
        private void EmitCode(IMethodReferenceExpression expression, bool makeCall, out bool needComma)
        {
            MethodDefinition methodDefinition;
            if (!ReferenceResolver.TryResolveMethodReference(expression.Method, _assemblyCompileInfo.Assembly.Resolver, out methodDefinition))
            {
                throw new CompilerException();
            }

            TypeDefinition typeDefinition = ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType, _assemblyCompileInfo.Assembly.Resolver);

            #region Delegate methods
            if (IsDelegateInvokeMethod(methodDefinition) || IsDelegateCreateMethod(methodDefinition))
            {
                _codeFormatter.Write(CodeStore + "[");
                AddMethodCodePointerFixup(methodDefinition);
                _codeFormatter.Write("]");
                if (makeCall)
                {
                    _codeFormatter.Write("(");
                }
                needComma = false;
                return;
            }
            #endregion

            #region Instrinsic methods

            CustomAttribute intrinsicAttribute;
            if (AttributeHelper.TryGetCustomAttribute(methodDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
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
                    intrinsicName = methodDefinition.Name;
                }

                if (intrinsicAttribute.Properties.Contains("UseGlobalNamespace"))
                {
                    useGlobalNamespace = (bool)intrinsicAttribute.Properties["UseGlobalNamespace"];
                }
                else
                {
                    useGlobalNamespace = false;
                }

                if (methodDefinition.HasThis)
                {
                    EmitExpressionCode(expression.Target);
                    _codeFormatter.Write(".");
                    _codeFormatter.Write(intrinsicName);
                    _codeFormatter.Write("(");
                    needComma = false;
                }
                else
                {
                    if (!useGlobalNamespace)
                    {
                        _codeFormatter.Write(GetIntrinsicSymbolName(ResolveTypeReference(((ITypeReferenceExpression)expression.Target).Type)));
                        _codeFormatter.Write(".");
                    }
                    _codeFormatter.Write(intrinsicName);
                    _codeFormatter.Write("(");
                    needComma = false;
                }

                return;
            }
            #endregion

            if (!expression.Method.HasThis)
            {
                // static method
                ITypeReferenceExpression typeReferenceExpression = expression.Target as ITypeReferenceExpression;
                if (typeReferenceExpression != null)
                {
                    _codeFormatter.Write(CodeStore + "[");
                    AddMethodCodePointerFixup(expression.Method);
                    _codeFormatter.Write("]");
                    if (makeCall)
                    {
                        _codeFormatter.Write("(");
                    }
                    needComma = false;
                }
                else
                {
                    throw new CompilerException();
                }
            }
            else
            {
                // instance method
                if (typeDefinition == null)
                {
                    throw new CompilerException();
                }

                if (typeDefinition.IsInterface)
                {
                    EmitExpressionCode(expression.Target);

                    // TODO: Extract this vtable access out into a code model object
                    _codeFormatter.Write(".$.i[");
                    AddVTableDataPointerFixup(typeDefinition);
                    _codeFormatter.Write("][");
                    AddVTableSlotFixup(methodDefinition);
                    _codeFormatter.Write("]");
                }
                else if (methodDefinition.IsVirtual && expression.IsVirtual) // TODO: Figure out the isVirtual semantics here, the front end should tell us if a call is virtual definitively no?
                {
                    EmitExpressionCode(expression.Target);
                    // TODO: Extract this vtable access out into a code model object
                    _codeFormatter.Write(".$[");
                    AddVTableSlotFixup(methodDefinition);
                    _codeFormatter.Write("]");
                }
                else
                {
                    _codeFormatter.Write(CodeStore + "[");
                    AddMethodCodePointerFixup(methodDefinition);
                    _codeFormatter.Write("]");
                }

                if (makeCall)
                {
                    _codeFormatter.Write(".call(");
                    EmitExpressionCode(expression.Target);
                    needComma = true;
                }
                else
                {
                    needComma = false;
                }
            }
        }
        private void EmitCode(INamedArgumentExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(INullCoalescingExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IObjectCreateExpression expression)
        {
            TypeDefinition typeDefinition = ReferenceResolver.ResolveTypeReference(expression.Constructor.DeclaringType);
            CustomAttribute intrinsicAttribute;
            if (AttributeHelper.HasCustomAttribute(typeDefinition, "System.Runtime.InteropServices", "NativeDelegateAttribute"))
            {
                Debug.Assert(expression.Arguments[1] is IMethodReferenceExpression, "Expected NativeDelegate object create expression to have IMethodReferenceExpression as the second argument.  Instead received: " + expression.Arguments[1] + ".  Method is: " + _methodCompileInfo);
                IMethodReferenceExpression delegateMethodReferenceExpression = (IMethodReferenceExpression)expression.Arguments[1];
                if (delegateMethodReferenceExpression.Method.HasThis)
                {
                    MethodInvokeExpression newMethodInvokeExpression = new MethodInvokeExpression(new MethodReferenceExpression(delegateMethodReferenceExpression, OSCorlibBindNativeFunctionMethod));
                    newMethodInvokeExpression.Arguments.Add(expression.Arguments[0]);
                    EmitCode(newMethodInvokeExpression);
                }
                else
                {
                    EmitCode(delegateMethodReferenceExpression, false);
                }
                //if (DebugSettings.CommentCode)
                //{
                //    _codeFormatter.Write("/*");
                //    _codeFormatter.Write(delegateMethodReferenceExpression.ToString());
                //    _codeFormatter.Write("*/");
                //}
            }
            else if (AttributeHelper.TryGetCustomAttribute(typeDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute", out intrinsicAttribute))
            {
                // creating a new instance of an intrinsic type
                string name;
                if (intrinsicAttribute.ConstructorParameters.Count > 0)
                {
                    name = (string)intrinsicAttribute.ConstructorParameters[0];
                }
                else if (intrinsicAttribute.Properties.Contains("Name"))
                {
                    name = (string)intrinsicAttribute.Properties["Name"];
                }
                else
                {
                    name = typeDefinition.Name;
                }
                bool useGlobalNamespace = false;
                if (intrinsicAttribute.Properties.Contains("UseGlobalNamespace"))
                {
                    useGlobalNamespace = (bool)intrinsicAttribute.Properties["UseGlobalNamespace"];
                }
                _codeFormatter.Write("new ");
                if (!useGlobalNamespace)
                {
                    _codeFormatter.Write(typeDefinition.Namespace);
                    _codeFormatter.Write(".");
                }
                _codeFormatter.Write(name);
                _codeFormatter.Write("(");
                if (expression.Arguments.Count > 0)
                {
                    // emit for n-1 arguments
                    for (int i = 0; i < expression.Arguments.Count - 1; i++)
                    {
                        EmitExpressionCode(expression.Arguments[i]);
                        _codeFormatter.Write(", ");
                    }

                    // emit last argument
                    EmitExpressionCode(expression.Arguments[expression.Arguments.Count - 1]);
                }
                _codeFormatter.Write(")");

            }
            else
            {
                _codeFormatter.Write("(t=[");
                Dictionary<FieldDefinition, uint> fieldLayout = GetFieldLayout(ReferenceResolver.ResolveTypeReference(expression.Type, _assemblyCompileInfo.Assembly.Resolver));
                int i = 0;
                foreach (KeyValuePair<FieldDefinition, uint> slot in fieldLayout)
                {
                    EmitFieldInitialValue(slot.Key, _codeFormatter, ImageFormat.FixupType.CodeSection);
                    if (i++ < fieldLayout.Count - 1)
                    {
                        _codeFormatter.Write(",");
                    }
                }
                _codeFormatter.Write("],t.$=");
                EmitExpressionCode(new TypeReferenceExpression(expression.Type));
                _codeFormatter.Write(",t)"); // TODO: Extract special temp register out into constant
            }
        }
        private void EmitCode(IObjectInitializeExpression expression)
        {
            Dictionary<FieldDefinition, uint> fieldLayout;
            GenericParameter genericParameter = expression.Type as GenericParameter;
            if (genericParameter != null)
            {
                // TODO: What to do here?
                throw new NotImplementedException("Object initializers for generic types is not yet implemented");
                return;
            }
            else
            {
                fieldLayout = GetFieldLayout(ReferenceResolver.ResolveTypeReference(expression.Type, _assemblyCompileInfo.Assembly.Resolver));
            }
            // TODO: Implement object initializers
            EmitCode(new NullLiteralExpression());
            return;
            throw new NotImplementedException("Object initializers for not yet implemented");
            _codeFormatter.Write("__initobj__(");
            EmitExpressionCode(expression.Expression);
            _codeFormatter.Write(",{");
            bool first = true;
            foreach (KeyValuePair<FieldDefinition, uint> slot in fieldLayout)
            {
                if (first)
                {
                    first = false;
                }
                else
                {
                    _codeFormatter.Write(",");
                }
                _codeFormatter.Write(slot.Value.ToString());
                _codeFormatter.Write(":");
                if (slot.Key.FieldType.IsValueType)
                {
                    _codeFormatter.Write("0");
                }
                else if (ReferenceComparer.TypeReferenceEquals(slot.Key.FieldType, CoreTypes.Boolean))
                {
                    _codeFormatter.Write("false");
                }
                else
                {
                    _codeFormatter.Write("null");
                }
            }
            _codeFormatter.Write("}");
        }
        private void EmitCode(IPropertyIndexerExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IPropertyReferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ISizeOfExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ISnippetExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IStackAllocateExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IThisReferenceExpression expression)
        {
            _codeFormatter.Write("this");
        }
        private void EmitCode(ITryCastExpression expression)
        {
            MethodInvokeExpression newMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibTryCastMethod);
            newMethodInvokeExpression.Arguments.Add(expression.Expression);
            newMethodInvokeExpression.Arguments.Add(new TypeReferenceExpression(expression.TargetType));
            EmitCode(newMethodInvokeExpression);
        }
        private void EmitCode(ITypedReferenceCreateExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ITypeOfExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ITypeOfTypedReferenceExpression expression)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ITypeReferenceExpression expression)
        {
            _codeFormatter.Write("_[");
            AddVTableDataPointerFixup(expression.Type);
            _codeFormatter.Write("]");
        }
        private void EmitCode(IUnaryExpression expression)
        {
            _codeFormatter.Write("(");
            switch (expression.Operator)
            {
                case UnaryOperator.Negate:
                    {
                        _codeFormatter.Write("-");
                        EmitExpressionCode(expression.Expression);
                        break;
                    }
                case UnaryOperator.PostDecrement:
                    {

                        EmitExpressionCode(expression.Expression);
                        _codeFormatter.Write("--");
                        break;
                    }
                case UnaryOperator.PostIncrement:
                    {

                        EmitExpressionCode(expression.Expression);
                        _codeFormatter.Write("++");
                        break;
                    }
                case UnaryOperator.PreDecrement:
                    {

                        _codeFormatter.Write("--");
                        EmitExpressionCode(expression.Expression);
                        break;
                    }
                case UnaryOperator.PreIncrement:
                    {

                        _codeFormatter.Write("++");
                        EmitExpressionCode(expression.Expression);
                        break;
                    }
                case UnaryOperator.BooleanNot:
                    {

                        _codeFormatter.Write("!");
                        EmitExpressionCode(expression.Expression);
                        break;
                    }
                case UnaryOperator.BitwiseNot:
                    {

                        _codeFormatter.Write("~");
                        EmitExpressionCode(expression.Expression);
                        break;
                    }
                default:
                    {
                        throw new NotImplementedException();
                    }
            }
            _codeFormatter.Write(")");
        }
        private void EmitCode(IUnboxExpression expression)
        {
            EmitExpressionCode(expression.Expression);
            _codeFormatter.Write(".valueOf()");
        }
        private void EmitCode(IVariableDefinitionExpression expression)
        {
            _codeFormatter.Write("var " + expression.Variable.Name + "");
        }
        private void EmitCode(IVariableReferenceExpression expression)
        {
            PseudoVariableDefinition pseudoVariableDefinition = expression.Variable as PseudoVariableDefinition;
            if (pseudoVariableDefinition != null)
            {
                _codeFormatter.Write(pseudoVariableDefinition.Name);
                return;
            }

            int register;
            if (_methodCompileInfo.RegisterMap.TryGetValue(expression.Variable.Name, out register))
            {
                _codeFormatter.WriteFormat("r{0}", register);
            }
            else
            {
                int local;
                if (!_methodCompileInfo.LocalMap.TryGetValue(expression.Variable.Name, out local))
                {
                    throw new CompilerException(String.Format("Local variable {0} does not exist in method " + _methodCompileInfo, expression.Variable.Name));
                }
                _codeFormatter.WriteFormat("{0}[{1}]", SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame), (int)FrameSlot.Max + _methodCompileInfo.Method.Parameters.Count + local);
            }
        }
        #endregion

        #region Statements

        public void EmitStatementCode(IStatement statement)
        {
            FoldByType<IStatement>(statement, _emitCodeMethodMap);
            if (!_semicolonOmitted)
            {
                _codeFormatter.Write(";");
            }
            else
            {
                _semicolonOmitted = false;
            }
        }

        private bool _semicolonOmitted = false;
        private void OmitSemicolon()
        {
            _semicolonOmitted = true;
        }

        private bool _newLineOmitted = false;
        private void OmitNewLine()
        {
            _newLineOmitted = true;
        }

        private void EmitCode(IBlockStatement statement)
        {
            _semicolonOmitted = false;
            foreach (IStatement innerStatement in statement.Statements)
            {
                EmitStatementCode(innerStatement);
                if (!_newLineOmitted)
                {
                    _codeFormatter.WriteLine();
                }
                else
                {
                    _newLineOmitted = false;
                }
            }
            OmitSemicolon();
        }
        private void EmitCode(IExpressionStatement statement)
        {
            EmitExpressionCode(statement.Expression);
            if (DebugSettings.CommentCode)
            {
                if (!(statement.Expression is DynamicExpression))
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(statement.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(IAssignStatement statement)
        {
            EmitExpressionCode(statement.Target);
            _codeFormatter.Write(" = ");
            EmitExpressionCode(statement.Expression);
            if (DebugSettings.CommentCode)
            {
                if (!((statement.Target is SpecialRegisterReferenceExpression && !(((SpecialRegisterReferenceExpression)statement.Target).Register == SpecialRegister.ReturnValue)) || statement.Target is ParentContinuationObjectSpecialRegisterReferenceExpression))
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(statement.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(IAttachEventStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IBreakStatement statement)
        {
            _codeFormatter.Write("break");
        }
        private void EmitCode(IConditionStatement statement)
        {
            _codeFormatter.Write("if(");
            EmitExpressionCode(statement.Condition);
            _codeFormatter.Write(")");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();
            EmitCode(statement.Then);
            _codeFormatter.WriteLine();
            _codeFormatter.WriteOutdent();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();
            if (statement.Else.Statements.Count > 0)
            {
                _codeFormatter.Write("else");
                _codeFormatter.WriteLine();
                _codeFormatter.Write("{");
                _codeFormatter.WriteLine();
                _codeFormatter.WriteIndent();
                EmitCode(statement.Else);
                _codeFormatter.WriteLine();
                _codeFormatter.WriteOutdent();
                _codeFormatter.Write("}");
                _codeFormatter.WriteLine();
            }
            OmitNewLine();
            OmitSemicolon();
        }
        private void EmitCode(IConditionCase statement)
        {
            _codeFormatter.Write("case ");
            EmitExpressionCode(statement.Condition);
            _codeFormatter.Write(":");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();

            EmitStatementCode(statement.Body);

            _codeFormatter.WriteOutdent();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();
            OmitSemicolon();
        }
        private void EmitCode(IDefaultCase statement)
        {
            _codeFormatter.Write("default:");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();

            EmitStatementCode(statement.Body);

            _codeFormatter.WriteOutdent();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();
            OmitSemicolon();
        }
        private void EmitCode(IContinueStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IDoStatement statement)
        {
            _codeFormatter.Write("do");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();
            EmitStatementCode(statement.Body);
            _codeFormatter.WriteOutdent();
            _codeFormatter.WriteLine();
            _codeFormatter.Write("} while (");
            EmitExpressionCode(statement.Condition);
            _codeFormatter.Write(");");
            _codeFormatter.WriteLine();
            OmitSemicolon();
        }
        private void EmitCode(IFixedStatement statement)
        {
            Debug.Assert(false);
        }
        private void EmitCode(IForEachStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IForStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IGotoStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(LabeledContinueStatement statement)
        {
            _codeFormatter.WriteFormat("continue {0}", statement.Label);
        }
        private void EmitCode(ILabeledStatement statement)
        {
            _codeFormatter.WriteFormat("{0}:", statement.Name);
            _codeFormatter.WriteLine();
            EmitStatementCode(statement.Statement);
            OmitSemicolon();
        }
        private void EmitCode(ILockStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IMemoryCopyStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IMemoryInitializeStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IMethodReturnStatement statement)
        {
            //if (CurrentMethodIsNonPreemptive())
            //{
            _codeFormatter.Write("return");
            if (statement.Expression != null)
            {
                _codeFormatter.Write(" ");
                EmitExpressionCode(statement.Expression);
                if (DebugSettings.CommentCode)
                {
                    if (!(statement.Expression is SpecialRegisterReferenceExpression || statement.Expression is ParentContinuationObjectSpecialRegisterReferenceExpression))
                    {
                        _codeFormatter.Write("/*");
                        _codeFormatter.Write(statement.Expression.ToString());
                        _codeFormatter.Write("*/");
                    }
                }
            }
            //}
            //else
            //{
            //    if (statement.Expression != null)
            //    {
            //        EmitExpressionCode(new ParentContinuationObjectSpecialRegisterReferenceExpression(SpecialRegister.ReturnValue));
            //        _codeFormatter.Write(" = ");
            //        _codeFormatter.Write(" ");
            //        EmitExpressionCode(statement.Expression);
            //        _codeFormatter.Write(";");
            //        _codeFormatter.WriteLine();
            //    }
            //    OmitSemicolon();
            //    EmitStatementCode(new ThrowExceptionStatement(new ParentContinuationObjectRegisterReferenceExpression()));
            //}
        }
        private void EmitCode(IRemoveEventStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(ISwitchStatement statement)
        {
            _codeFormatter.Write("switch(");
            EmitExpressionCode(statement.Expression);
            _codeFormatter.Write(")");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();

            foreach (ISwitchCase switchCase in statement.Cases)
            {
                IConditionCase conditionCase = switchCase as IConditionCase;
                if (conditionCase != null)
                {
                    EmitCode(conditionCase);
                    continue;
                }

                IDefaultCase defaultCase = switchCase as IDefaultCase;
                if (defaultCase != null)
                {
                    EmitCode(defaultCase);
                    continue;
                }

                Debug.Assert(false);
            }

            _codeFormatter.WriteLine();
            _codeFormatter.WriteOutdent();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();
            OmitSemicolon();
        }
        private void EmitCode(IThrowExceptionStatement statement)
        {
            // now throw the exception
            _codeFormatter.Write("throw ");
            EmitExpressionCode(statement.Expression);
            if (DebugSettings.CommentCode)
            {
                if (!(statement.Expression is SpecialRegisterReferenceExpression || statement.Expression is ParentContinuationObjectSpecialRegisterReferenceExpression))
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(statement.Expression.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(ITryCatchFinallyStatement statement)
        {
            _codeFormatter.Write("try");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();
            EmitStatementCode(statement.Try);
            _codeFormatter.WriteOutdent();
            _codeFormatter.WriteLine();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();

            foreach (ICatchClause catchClause in statement.CatchClauses)
            {
                _codeFormatter.Write("catch(");
                PseudoVariableDefinition pseudoVariableDefinition = catchClause.Variable as PseudoVariableDefinition;
                if (pseudoVariableDefinition == null)
                {
                    throw new CompilerException("Expected pseudo variable definition");
                }
                _codeFormatter.Write(pseudoVariableDefinition.Name);
                _codeFormatter.Write(")");

                _codeFormatter.WriteLine();
                _codeFormatter.Write("{");
                _codeFormatter.WriteLine();
                _codeFormatter.WriteIndent();
                EmitStatementCode(catchClause.Body);
                _codeFormatter.WriteOutdent();
                _codeFormatter.WriteLine();
                _codeFormatter.Write("}");
                _codeFormatter.WriteLine();
            }

            if (statement.Finally != null && statement.Finally.Statements.Count > 0)
            {
                _codeFormatter.Write("finally");
                _codeFormatter.WriteLine();
                _codeFormatter.Write("{");
                _codeFormatter.WriteLine();
                _codeFormatter.WriteIndent();
                EmitStatementCode(statement.Finally);
                _codeFormatter.WriteOutdent();
                _codeFormatter.WriteLine();
                _codeFormatter.Write("}");
                _codeFormatter.WriteLine();
            }

            OmitSemicolon();
        }
        private void EmitCode(IUsingStatement statement)
        {
            throw new NotImplementedException();
        }
        private void EmitCode(IWhileStatement statement)
        {
            _codeFormatter.Write("while(");
            EmitExpressionCode(statement.Condition);
            _codeFormatter.Write(")");
            _codeFormatter.WriteLine();
            _codeFormatter.Write("{");
            _codeFormatter.WriteLine();
            _codeFormatter.WriteIndent();
            EmitStatementCode(statement.Body);
            _codeFormatter.WriteOutdent();
            _codeFormatter.WriteLine();
            _codeFormatter.Write("}");
            _codeFormatter.WriteLine();
            OmitSemicolon();
        }
        private void EmitCode(NopStatement statement)
        {
            OmitSemicolon();
            OmitNewLine();
        }

        #region Special statements
        private void EmitCode(NativeThrowExceptionStatement statement)
        {
            // now throw the exception
            _codeFormatter.Write("throw ");
            EmitExpressionCode(statement.Expression);
            if (DebugSettings.CommentCode)
            {
                if (!(statement.Expression is SpecialRegisterReferenceExpression || statement.Expression is ParentContinuationObjectSpecialRegisterReferenceExpression))
                {
                    _codeFormatter.Write("/*");
                    _codeFormatter.Write(statement.Expression.ToString());
                    _codeFormatter.Write("*/");
                }
            }
        }
        private void EmitCode(SetExecutionPointerStatement statement)
        {
            EmitCode((IAssignStatement)statement);
        }
        private void EmitCode(RestoreRegisterStatement statement)
        {
            _codeFormatter.WriteFormat("r{0} = {1}[{2}]", statement.Register, SpecialRegisterHelper.GetSpecialRegisterName(SpecialRegister.Frame), statement.FrameOffset);
        }
        #endregion
        #endregion

        #region Metadata
        private int EmitAssemblyMetadata(AssemblyDefinition assemblyDefinition)
        {
            // TODO: Load metadata from other assemblies using fixups!

            // if we already emitted the metadata, just return the index
            int index;
            if (_metadataInitializationDataStore.TryGetValue(assemblyDefinition, out index))
            {
                return index;
            }

            MethodInvokeExpression createAssemblyMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreateAssemblyMethod);
            createAssemblyMethodInvokeExpression.Arguments.Add(assemblyDefinition.Name.Name.ToExpression());
            index = EmitAddToDataStore<AssemblyDefinition>(assemblyDefinition, createAssemblyMethodInvokeExpression);

            foreach (ModuleDefinition moduleDefinition in assemblyDefinition.Modules)
            {
                foreach (TypeDefinition typeDefinition in moduleDefinition.Types)
                {
                    EmitTypeMetadata(typeDefinition);
                }
            }

            return index;
        }
        private int EmitTypeMetadata(TypeDefinition typeDefinition)
        {
            if (IsOmittedType(typeDefinition))
            {
                return -1;
            }

            // if we already emitted the metadata, just return the index
            int index;
            if (_metadataInitializationDataStore.TryGetValue(typeDefinition, out index))
            {
                return index;
            }

            MethodInvokeExpression createClassMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreateClassMethod);

            // namespace
            createClassMethodInvokeExpression.Arguments.Add(typeDefinition.Namespace.ToExpression());

            // name
            createClassMethodInvokeExpression.Arguments.Add(typeDefinition.Name.ToExpression());

            // assembly
            createClassMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(_metadataInitializationDataStore[_assemblyCompileInfo.Assembly]));

            // vtable pointer
            createClassMethodInvokeExpression.Arguments.Add(new DynamicExpression(delegate()
            {
                AddVTableDataPointerFixup(typeDefinition);
            }));

            // element type
            createClassMethodInvokeExpression.Arguments.Add(new NullLiteralExpression());

            // is interface
            createClassMethodInvokeExpression.Arguments.Add(typeDefinition.IsInterface.ToExpression());

            // is array
            createClassMethodInvokeExpression.Arguments.Add(false.ToExpression());

            index = EmitAddToDataStore<TypeDefinition>(typeDefinition, createClassMethodInvokeExpression);

            foreach (MethodDefinition methodDefinition in typeDefinition.Methods)
            {
                EmitMethodMetadata(index, typeDefinition, methodDefinition);
            }
            foreach (MethodDefinition constructorDefinition in typeDefinition.Constructors)
            {
                EmitConstructorMetadata(index, typeDefinition, constructorDefinition);
            }
            foreach (PropertyDefinition propertyDefinition in typeDefinition.Properties)
            {
                EmitPropertyMetadata(index, typeDefinition, propertyDefinition);
            }

            // this commented out because RuntimeHelpers::CreateClass now sets the VTable::Class using the VTableDataPointer
            /*_codeFormatter.Write("_[");
            AddVTableDataPointerFixup(typeDefinition, _codeFormatter.GetOffset(), ImageFormat.FixupType.InitializationSection);
            _codeFormatter.Write("].c = ");
            EmitExpressionCode(BuildGetFromDataStoreExpression(classDataStoreIndex));
            _codeFormatter.Write(";");
            _codeFormatter.WriteLine();*/

            // TODO: constructors passed into RuntimeHelpers::CreateCustomAttribute, and possibly other runtime helper methods, may not have been initialized!

            // add attributes
            foreach (CustomAttribute customAttribute in typeDefinition.CustomAttributes)
            {
                EmitCustomAttributeMetadata(BuildGetFromDataStoreExpression(index), customAttribute);
            }

            return index;
        }
        private int EmitMethodMetadata(int classDataStoreIndex, TypeDefinition typeDefinition, MethodDefinition methodDefinition)
        {
            if (IsOmittedMethod(methodDefinition))
            {
                return -1;
            }

            // if we already emitted the metadata, just return the index
            int index;
            if (_metadataInitializationDataStore.TryGetValue(methodDefinition, out index))
            {
                return index;
            }

            MethodInvokeExpression createMethodMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreateMethodMethod);
            createMethodMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(classDataStoreIndex));
            createMethodMethodInvokeExpression.Arguments.Add(methodDefinition.Name.ToExpression());

            // function pointer and vtable slot
            if (methodDefinition.HasBody)
            {
                createMethodMethodInvokeExpression.Arguments.Add(new DynamicExpression(delegate()
                {
                    _codeFormatter.Write(CodeStore + "[");
                    AddMethodCodePointerFixup(methodDefinition);
                    _codeFormatter.Write("]");
                }));
            }
            else
            {
                // function pointer
                createMethodMethodInvokeExpression.Arguments.Add(new NullLiteralExpression());
            }

            // vtable slot
            if (methodDefinition.IsVirtual)
            {
                createMethodMethodInvokeExpression.Arguments.Add(new DynamicExpression(delegate()
                {
                    AddVTableSlotFixup(methodDefinition);
                }));
            }
            else
            {
                createMethodMethodInvokeExpression.Arguments.Add((-1).ToExpression());
            }

            index = EmitAddToDataStore<MethodDefinition>(methodDefinition, createMethodMethodInvokeExpression);


            foreach (CustomAttribute customAttribute in methodDefinition.CustomAttributes)
            {
                EmitCustomAttributeMetadata(BuildGetFromDataStoreExpression(index), customAttribute);
            }

            return index;
        }
        private int EmitConstructorMetadata(int classDataStoreIndex, TypeDefinition typeDefinition, MethodDefinition constructorDefinition)
        {
            if (IsOmittedMethod(constructorDefinition))
            {
                return -1;
            }

            // if we already emitted the metadata, just return the index
            int index;
            if (_metadataInitializationDataStore.TryGetValue(constructorDefinition, out index))
            {
                return index;
            }

            MethodInvokeExpression createConstructorMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreateConstructorMethod);
            createConstructorMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(classDataStoreIndex));
            createConstructorMethodInvokeExpression.Arguments.Add(constructorDefinition.Name.ToExpression());

            // function pointer and vtable slot
            if (constructorDefinition.HasBody)
            {
                createConstructorMethodInvokeExpression.Arguments.Add(new DynamicExpression(delegate()
                {
                    _codeFormatter.Write(CodeStore + "[");
                    AddMethodCodePointerFixup(constructorDefinition);
                    _codeFormatter.Write("]");
                }));
            }
            else
            {
                // function pointer
                createConstructorMethodInvokeExpression.Arguments.Add(new NullLiteralExpression());
            }

            index = EmitAddToDataStore<MethodDefinition>(constructorDefinition, createConstructorMethodInvokeExpression);

            foreach (CustomAttribute customAttribute in constructorDefinition.CustomAttributes)
            {
                EmitCustomAttributeMetadata(BuildGetFromDataStoreExpression(index), customAttribute);
            }

            return index;
        }
        private int EmitPropertyMetadata(int classDataStoreIndex, TypeDefinition typeDefinition, PropertyDefinition propertyDefinition)
        {
            // if we already emitted the metadata, just return the index
            int index;
            if (_metadataInitializationDataStore.TryGetValue(propertyDefinition, out index))
            {
                return index;
            }

            MethodInvokeExpression createPropertyMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreatePropertyMethod);
            createPropertyMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(classDataStoreIndex));
            createPropertyMethodInvokeExpression.Arguments.Add(propertyDefinition.Name.ToExpression());

            if (propertyDefinition.GetMethod != null)
            {
                int getMethodDataIndex;
                if (!_metadataInitializationDataStore.TryGetValue(propertyDefinition.GetMethod, out getMethodDataIndex))
                {
                    Warn("No metadata initialization data store index for method: " + propertyDefinition.GetMethod);
                }
                else
                {
                    createPropertyMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(getMethodDataIndex));
                }
            }
            else
            {
                createPropertyMethodInvokeExpression.Arguments.Add(new NullLiteralExpression());
            }

            if (propertyDefinition.SetMethod != null)
            {
                int setMethodDataIndex;
                if (!_metadataInitializationDataStore.TryGetValue(propertyDefinition.SetMethod, out setMethodDataIndex))
                {
                    Warn("No metadata initialization data store index for method: " + propertyDefinition.SetMethod);
                }
                else
                {
                    createPropertyMethodInvokeExpression.Arguments.Add(BuildGetFromDataStoreExpression(setMethodDataIndex));
                }
            }
            else
            {
                createPropertyMethodInvokeExpression.Arguments.Add(new NullLiteralExpression());
            }

            return EmitAddToDataStore<PropertyDefinition>(propertyDefinition, createPropertyMethodInvokeExpression);
        }
        private void EmitCustomAttributeMetadata(IExpression attributeProviderExpression, CustomAttribute customAttribute)
        {
            // make sure that prerequisite type and method metadata have been emitted
            // they may not have been emitted yet if they are defined in this assembly
            if (ReferenceComparer.AssemblyNameReferenceEquals(customAttribute.Constructor.DeclaringType.Module.Assembly.Name, _assemblyCompileInfo.Assembly.Name))
            {
                // TODO: Make helper methods for resolving types, methods, etc
                int classDataStoreIndex = EmitTypeMetadata(ReferenceResolver.ResolveTypeReference(customAttribute.Constructor.DeclaringType, _assemblyCompileInfo.Assembly.Resolver));
                EmitConstructorMetadata(classDataStoreIndex, ReferenceResolver.ResolveTypeReference(customAttribute.Constructor.DeclaringType, _assemblyCompileInfo.Assembly.Resolver), ReferenceResolver.ResolveMethodReference(customAttribute.Constructor, _assemblyCompileInfo.Assembly.Resolver));
            }

            MethodInvokeExpression createAttributeMethodInvokeExpression = GetMethodInvokeExpression(OSCorlibCreateCustomAttributeMethod);
            createAttributeMethodInvokeExpression.Arguments.Add(attributeProviderExpression);

            // TODO: Add more information about the attribute.  for now, we just pass in the constructor Method
            createAttributeMethodInvokeExpression.Arguments.Add(new DynamicExpression(delegate()
            {
                // TODO: What if the constructor is extern?  The function won't be in the code store This is not the right way to fixup the Method.  Find some other way
                _codeFormatter.Write(CodeStore + "[");
                AddMethodCodePointerFixup(customAttribute.Constructor);
                _codeFormatter.Write("].m");
            }));

            EmitStatementCode(new ExpressionStatement(createAttributeMethodInvokeExpression));
            _codeFormatter.WriteLine();
        }
        private int EmitAddToDataStore<T>(T key, IExpression expression)
        {
            int index = _metadataInitializationDataStore.Count;
            _metadataInitializationDataStore.Add(key, index);
            AssignStatement assignStatement = new AssignStatement(new ArrayIndexerExpression(_metadataInitializationDataStoreVariableReferenceExpression, index.ToExpression()), expression);
            EmitStatementCode(assignStatement);
            _codeFormatter.WriteLine();
            return index;
        }

        private IExpression BuildGetFromDataStoreExpression(int index)
        {
            return new ArrayIndexerExpression(_metadataInitializationDataStoreVariableReferenceExpression, index.ToExpression());
        }
        #endregion

        #region Helpers
        private void EmitFieldInitialValue(FieldDefinition fieldDefinition, CodeFormatter formatter, ImageFormat.FixupType currentSection)
        {
            // TODO: This method should return an expression rather than emit a value
            // TODO: EmitFieldInitialValue

            if (fieldDefinition.FieldType is TypeSpecification)
            {
                // TODO: Use code model here
                formatter.Write("null");
                return;
            }

            TypeDefinition fieldTypeDefinition;

            if (!ReferenceResolver.TryResolveTypeReference(fieldDefinition.FieldType, _assemblyCompileInfo.Assembly.Resolver, out fieldTypeDefinition))
            {
                formatter.Write("null");
                return;
            }

            if (ReferenceComparer.TypeReferenceEquals(fieldTypeDefinition, CoreTypes.Boolean))
            {
                // TODO: Emit false boolean expression instead
                formatter.Write("false");
            }
            else if (fieldDefinition.Constant != null)
            {
                if (fieldTypeDefinition.IsEnum)
                {
                    formatter.Write(fieldDefinition.Constant.ToString());
                }
                else
                {
                    // TODO: emit initial field type definitions for other types: chars, bytes, etc
                    formatter.Write("null");
                }
            }
            else if (fieldDefinition.InitialValue != null)
            {
                formatter.Write("[");
                byte[] initialValue = fieldDefinition.InitialValue;
                for (int i = 0; i < initialValue.Length; i++)
                {
                    formatter.Write(initialValue[i]);
                    if (i < initialValue.Length - 1)
                    {
                        formatter.Write(",");
                    }
                }
                formatter.Write("]");
            }
            else
            {
                formatter.Write("null");
            }

        }
        private MethodInvokeExpression GetMethodInvokeExpression(MethodReference methodReference)
        {
            TypeReferenceExpression typeReferenceExpression = new TypeReferenceExpression(methodReference.DeclaringType);
            return new MethodInvokeExpression(new MethodReferenceExpression(typeReferenceExpression, methodReference));
        }

        private IMethodReferenceExpression GetSystemCallMethodReferenceExpression(IMethodReferenceExpression originalCall)
        {
            if (originalCall.Method.HasThis)
            {
                throw new CompilerException("System calls must be static");
            }
            MethodDefinition systemCallMethodDefinition = null;
            TypeDefinition systemCallMethodDefinitionDeclaringType = null;
            if (!_systemCallCache.TryGetValue(originalCall.Method.Name, out systemCallMethodDefinition))
            {
                foreach (ModuleDefinition moduleDefinition in GetXaeiOSCompiler().KernelAssembly.Modules)
                {
                    foreach (TypeDefinition typeDefinition in moduleDefinition.Types)
                    {
                        foreach (MethodDefinition methodDefinition in typeDefinition.Methods)
                        {
                            if (methodDefinition.Name == originalCall.Method.Name && AttributeHelper.HasCustomAttribute(methodDefinition, "XaeiOS", "SystemCallAttribute"))
                            {
                                _systemCallCache[originalCall.Method.Name] = methodDefinition;
                                systemCallMethodDefinition = methodDefinition;
                                systemCallMethodDefinitionDeclaringType = typeDefinition;
                                break;
                            }
                        }
                        if (systemCallMethodDefinition != null)
                        {
                            break;
                        }
                    }
                    if (systemCallMethodDefinition != null)
                    {
                        break;
                    }
                }
                if (systemCallMethodDefinition == null)
                {
                    throw new CompilerException("System call not found: " + originalCall.Method.Name);
                }
            }
            else
            {
                systemCallMethodDefinitionDeclaringType = ReferenceResolver.ResolveTypeReference(systemCallMethodDefinition.DeclaringType, _assemblyCompileInfo.Assembly.Resolver);
            }
            return new MethodReferenceExpression(new TypeReferenceExpression(systemCallMethodDefinitionDeclaringType), systemCallMethodDefinition);
        }
        private Dictionary<string, MethodDefinition> _systemCallCache = new Dictionary<string, MethodDefinition>();
        #endregion

    }
}
