using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;

using Mono.Cecil;


namespace XaeiO.Compiler.BackEnds.XaeiOS.Optimization
{
    /// <summary>
    /// Fixes intrinsic casts and operators.
    /// Remove dummy calls.
    /// Removes constructor calls following object create expressions of intrinsic types.
    /// </summary>
    public class XaeiOSInitializingTransformation : TransformationBase
    {
        // TODO: Remove calls to System.var::Cast
        private MethodCompileInfo _compileInfo;

        public XaeiOSInitializingTransformation()
            : base(TransformationPhaseOrder.AfterSSA)
        {
        }

        public override void Transform(MethodCompileInfo compileInfo)
        {
            _compileInfo = compileInfo;
            IAssemblyResolver resolver = _compileInfo.Method.DeclaringType.Module.Assembly.Resolver;
            TypeReference varType = CoreTypes.GetCoreType("System.var");
            foreach (CFGNode node in _compileInfo.TopologicalSort)
            {
                if (_compileInfo.DeadCode.Contains(node))
                {
                    continue;
                }
                Definition definition;
                if (node.TryGetDefinition(out definition))
                {
                    IMethodInvokeExpression methodInvokeExpression = definition.Expression as IMethodInvokeExpression;
                    if (methodInvokeExpression != null)
                    {
                        IMethodReferenceExpression methodReferenceExpression = methodInvokeExpression.Method as IMethodReferenceExpression;
                        if (methodReferenceExpression != null)
                        {
                            MethodDefinition methodDefinition;
                            if (ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, resolver, out methodDefinition))
                            {
                                // dummy?
                                if (XaeiOSBackend.HasDummyAttribute(methodDefinition))
                                {
                                    _compileInfo.DeadCode.Add(node);
                                }
                                // var.cast?
                                else if(methodDefinition.Name == "Cast" && ReferenceComparer.TypeReferenceEquals(methodDefinition.DeclaringType, varType))
                                {
                                    if (methodDefinition.HasThis)
                                    {
                                        definition.Expression = ((IMethodReferenceExpression)methodInvokeExpression.Method).Target;
                                    }
                                    else
                                    {
                                        definition.Expression = methodInvokeExpression.Arguments[0];
                                    }
                                    node.FlowControl = FlowControl.Next;
                                }
                                // cast operator?
                                else if (methodDefinition.HasThis == false && methodDefinition.IsSpecialName && methodDefinition.Name.StartsWith("op_"))
                                {
                                    bool hasIntrinsicAttribute = AttributeHelper.HasCustomAttribute(methodDefinition, "System.Runtime.InteropServices", "IntrinsicAttribute");
                                    if (methodDefinition.Name == "op_Explicit" || methodDefinition.Name == "op_Implicit")
                                    {
                                        // intrinsic attribute?
                                        if (hasIntrinsicAttribute)
                                        {
                                            // this is an intrinsic cast
                                            definition.Expression = methodInvokeExpression.Arguments[0];
                                            node.FlowControl = FlowControl.Next; // here we assume the flow control was previous FlowControl.Call
                                        }
                                        else
                                        {
                                            // number conversion?
                                            TypeReference fromType = methodInvokeExpression.Arguments[0].Type;
                                            TypeReference toType = methodDefinition.ReturnType.ReturnType;

                                            // int 32 conversion
                                            if (ReferenceComparer.TypeReferenceEquals(fromType, toType) && ReferenceComparer.TypeReferenceEquals(fromType, CoreTypes.Int32))
                                            {
                                                definition.Expression = methodInvokeExpression.Arguments[0];
                                                node.FlowControl = FlowControl.Next; // here we assume the flow control was previous FlowControl.Call
                                            }

                                            // TODO: more number conversions
                                        }
                                    }
                                    else if(hasIntrinsicAttribute)
                                    {
                                        switch (methodDefinition.Name)
                                        {
                                            case "op_Addition":
                                                {
                                                    definition.Expression = new BinaryExpression(methodInvokeExpression.Arguments[0], BinaryOperator.Add, methodInvokeExpression.Arguments[1]);
                                                    node.FlowControl = FlowControl.Next;
                                                    break;
                                                }
                                            case "op_Subtraction":
                                                {
                                                    definition.Expression = new BinaryExpression(methodInvokeExpression.Arguments[0], BinaryOperator.Subtract, methodInvokeExpression.Arguments[1]);
                                                    node.FlowControl = FlowControl.Next;
                                                    break;
                                                }
                                            case "op_Division":
                                                {
                                                    definition.Expression = new BinaryExpression(methodInvokeExpression.Arguments[0], BinaryOperator.Divide, methodInvokeExpression.Arguments[1]);
                                                    node.FlowControl = FlowControl.Next;
                                                    break;
                                                }
                                            case "op_Multiply":
                                                {
                                                    definition.Expression = new BinaryExpression(methodInvokeExpression.Arguments[0], BinaryOperator.Multiply, methodInvokeExpression.Arguments[1]);
                                                    node.FlowControl = FlowControl.Next;
                                                    break;
                                                }
                                            case "op_GreaterThan":
                                                {
                                                    definition.Expression = new BinaryExpression(methodInvokeExpression.Arguments[0], BinaryOperator.GreaterThan, methodInvokeExpression.Arguments[1]);
                                                    node.FlowControl = FlowControl.Next;
                                                    break;
                                                }
                                            default:
                                                {
                                                    break;
                                                }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    IExpressionStatement expressionStatement = node.BasicBlock.Statements[0] as IExpressionStatement;
                    if (expressionStatement != null)
                    {

                        IMethodInvokeExpression methodInvokeExpression = expressionStatement.Expression as IMethodInvokeExpression;
                        if (methodInvokeExpression != null)
                        {
                            IMethodReferenceExpression methodReferenceExpression = methodInvokeExpression.Method as IMethodReferenceExpression;
                            if (methodReferenceExpression != null)
                            {
                                MethodDefinition methodDefinition;
                                if (ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, resolver, out methodDefinition))
                                {
                                    // dummy?
                                    if (XaeiOSBackend.HasDummyAttribute(methodDefinition))
                                    {
                                        _compileInfo.DeadCode.Add(node);
                                    }
                                    // constructor call to intrinsic type?
                                    else if (methodDefinition.IsConstructor && AttributeHelper.HasCustomAttribute(ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType), "System.Runtime.InteropServices", "IntrinsicAttribute"))
                                    {
                                        _compileInfo.DeadCode.Add(node);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public class XaeiOSExceptionRegisterClearingTransformation : TransformationBase
    {
        private MethodCompileInfo _compileInfo;
        public XaeiOSExceptionRegisterClearingTransformation()
            : base(TransformationPhaseOrder.AfterRegisterAllocation)
        {

        }
        public override void Transform(MethodCompileInfo compileInfo)
        {
            _compileInfo = compileInfo;
            IAssemblyResolver resolver = _compileInfo.Method.DeclaringType.Module.Assembly.Resolver;
            foreach (MethodCompileInfo.TryBlockInfo tryBlockInfo in _compileInfo.TryStarts.Values)
            {
                foreach (CFGNode node in tryBlockInfo.HandlerStarts)
                {
                    node.BasicBlock.Statements.Add(new AssignStatement(new FrameSlotReferenceExpression(FrameSlot.Exception), new NullLiteralExpression()));
                }
            }
        }
    }
}
