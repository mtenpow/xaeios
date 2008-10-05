using System;
using System.Collections.Generic;
using System.Diagnostics;

using XaeiO.Compiler.CodeModel;

using Mono.Cecil;
using Mono.Cecil.Cil;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.BackEnds.XaeiOS;
using XaeiO.Compiler.Collections;

namespace XaeiO.Compiler.Optimization
{
    // TODO: This really needs a whole-program call graph to be generated so that multi-level inlining can occur
    public class MethodInliningTransformation : TransformationBase
    {
        // TODO: this is a SWAG number. figure out what it should be
        private static readonly int InliningCostThreshold = 35;
        private BackEnds.XaeiOS.XaeiOSBackEnd _backend;

        public MethodInliningTransformation(BackEnds.XaeiOS.XaeiOSBackEnd backend)
            : base(TransformationPhaseOrder.Initial)
        {
            _backend = backend;
            this.Corrupts.Add(typeof(DominatorAnalysis));
            this.Corrupts.Add(typeof(TransitiveClosureAndTopologicalOrder));
        }

        public override bool Transform(MethodCompileInfo callerMethodCompileInfo)
        {
            List<CFGNode> callerNodes = new List<CFGNode>();
            foreach (CFGNode node in callerMethodCompileInfo.CFG.Vertices)
            {
                callerNodes.Add(node);
            }
            foreach (CFGNode callerNode in callerNodes)
            {
                BasicBlock bb = callerNode.BasicBlock;
                // TODO: For now assume that the only statement is an assignstatement
                if (bb.Statements.Count != 1)
                {
                    continue;
                }
                IAssignStatement assignStatement = bb.Statements[0] as IAssignStatement;
                if (assignStatement == null)
                {
                    continue;
                }
                IMethodInvokeExpression methodInvokeExpression = assignStatement.Expression as IMethodInvokeExpression;
                if (methodInvokeExpression == null)
                {
                    continue;
                }
                IMethodReferenceExpression methodReferenceExpression = methodInvokeExpression.Method as IMethodReferenceExpression;
                if (methodReferenceExpression == null)
                {
                    continue;
                }
                MethodDefinition methodDefinition;
                if (!ReferenceResolver.TryResolveMethodReference(methodReferenceExpression.Method, callerMethodCompileInfo.AssemblyCompileInfo.Assembly.Resolver, out methodDefinition))
                {
                    continue;
                }
                MethodCompileInfo calleeMethodCompileInfo;
                if (!callerMethodCompileInfo.AssemblyCompileInfo.MethodCompileInfos.TryGetValue(methodDefinition, out calleeMethodCompileInfo))
                {
                    continue;
                }
                if (callerNode.FlowControl != FlowControl.Call)
                {
                    continue;
                }
                if (!CanBeInlined(calleeMethodCompileInfo, callerMethodCompileInfo))
                {
                    continue;
                }

                // graft the callee CFG into the caller CFG
                Debug.Assert(callerNode.SuccessorCount == 1);
                CFGNode successorNode = callerNode.Successors[0]; // TODO: Write GetOnlySuccessor() method
                CFGNode newCallerNode = callerNode.Graph.AddNode();
                newCallerNode.BasicBlock.Statements.Add(new NopStatement());

                CFGNodeSet newNodes = new CFGNodeSet(newCallerNode.Graph);
                newNodes.Add(newCallerNode);

                IExpression thisReplacement = calleeMethodCompileInfo.Method.IsStatic ? null : methodReferenceExpression.Target;
                Dictionary<string, IExpression> argumentReplacements;
                if (methodDefinition.Parameters.Count > 0)
                {
                    argumentReplacements = new Dictionary<string, IExpression>();
                    foreach (ParameterDefinition parameterDefinition in methodDefinition.Parameters)
                    {
                        argumentReplacements[parameterDefinition.Name] = methodInvokeExpression.Arguments[parameterDefinition.Sequence - 1];
                    }
                }
                else
                {
                    argumentReplacements = null;
                }

                try
                {
                    CFGNode calleeNode = ProcessCFGNode(
                        calleeMethodCompileInfo.CFG.Root, newCallerNode,
                        successorNode,
                        thisReplacement, assignStatement.Target,
                        calleeMethodCompileInfo, callerMethodCompileInfo,
                        new Dictionary<string, VariableDefinition>(),
                        new Dictionary<string, VariableReference>(),
                        argumentReplacements,
                        new Dictionary<CFGNode, CFGNode>(),
                        newNodes
                    );

                    foreach (CFGEdge inEdge in callerNode.Graph.InEdges(callerNode))
                    {
                        callerNode.Graph.AddEdge(inEdge.Source, newCallerNode, inEdge.BranchCondition);
                    }
                    newCallerNode.Graph.AddEdge(newCallerNode, calleeNode);
                    newCallerNode.FlowControl = FlowControl.Next;
                    callerNode.Graph.RemoveVertex(callerNode);

                    //Console.WriteLine("Inlined method " + calleeMethodCompileInfo + " in method " + callerMethodCompileInfo);
                }
                catch (CannotInlineMethodException e)
                {
                    //Console.WriteLine("Cannot inline method " + calleeMethodCompileInfo + " in method " + calleeMethodCompileInfo + ": " + e);

                    // inlining failed, let's clean up any nodes we created
                    foreach (CFGNode newNode in newNodes)
                    {
                        newNode.Graph.RemoveVertex(newNode);
                    }
                };
            }

            return true;
        }

        private CFGNode ProcessCFGNode(
            CFGNode calleeNode, CFGNode callerNode,
            CFGNode callerSuccessorNode,
            IExpression thisReplacement,
            IExpression returnValueTarget,
            MethodCompileInfo calleeMethodCompileInfo,
            MethodCompileInfo callerMethodCompileInfo,
            Dictionary<string, VariableDefinition> renamedLocalsMap,
            Dictionary<string, VariableReference> variableReplacements,
            Dictionary<string, IExpression> argumentReplacements,
            Dictionary<CFGNode, CFGNode> processedNodes,
            CFGNodeSet newNodes
            )
        {
            CFGNode inlinedNode;
            if (processedNodes.TryGetValue(calleeNode, out inlinedNode))
            {
                // we've already seen this node
                // don't inline it again otherwise we'll end up in an infinite recursion
                return inlinedNode;
            }

            CFG cfg = callerNode.Graph;
            inlinedNode = cfg.AddNode();
            inlinedNode.FlowControl = calleeNode.FlowControl;
            inlinedNode.BasicBlock = CodeUtility.CloneCode<BasicBlock>(calleeNode.BasicBlock);
            processedNodes[calleeNode] = inlinedNode;
            newNodes.Add(inlinedNode);
            Debug.Assert(
                inlinedNode.BasicBlock.Statements.Count == calleeNode.BasicBlock.Statements.Count,
                string.Format("Clone code produced {0} statements instead of {1}", inlinedNode.BasicBlock.Statements.Count, calleeNode.BasicBlock.Statements.Count)
            );

            // rename all variables in callee so they don't clash with variables in caller
            CodeUtility.MatchAndReplaceCode<IVariableReferenceExpression>(
                inlinedNode.BasicBlock,
                delegate(IVariableReferenceExpression expression)
                {
                    return true;
                },
                delegate(IVariableReferenceExpression expression)
                {
                    VariableReference variableReplacement;
                    if (!variableReplacements.TryGetValue(expression.Variable.Name, out variableReplacement))
                    {
                        if (callerMethodCompileInfo.IsTemporary(expression.Variable))
                        {
                            variableReplacement = callerMethodCompileInfo.NewTemporary(expression.Variable.VariableType);
                        }
                        else if (callerMethodCompileInfo.IsFrozen(expression.Variable))
                        {
                            variableReplacement = callerMethodCompileInfo.NewFrozen(expression.Variable.VariableType);
                        }
                        else
                        {
                            VariableDefinition variableDefinition;
                            if (!renamedLocalsMap.TryGetValue(expression.Variable.Name, out variableDefinition))
                            {
                                int index = callerMethodCompileInfo.Method.Body.Variables.Count;
                                string name = "V_" + index; // TODO: Extract into constant and helper method
                                TypeReference type = expression.Variable.VariableType;
                                variableDefinition = new VariableDefinition(name, index, callerMethodCompileInfo.Method, type);
                                callerMethodCompileInfo.Method.Body.Variables.Add(variableDefinition);
                                renamedLocalsMap[expression.Variable.Name] = variableDefinition;
                            }
                            variableReplacement = variableDefinition;
                        }
                        variableReplacements[expression.Variable.Name] = variableReplacement;
                    }
                    expression.Variable = variableReplacement;
                    return expression;
                },
                true
            );

            // replace all instances of "this" in callee with the target object
            if (thisReplacement != null)
            {
                CodeUtility.MatchAndReplaceCode<IExpression>(
                    inlinedNode.BasicBlock,
                    delegate(IExpression expression)
                    {
                        return expression is IThisReferenceExpression;
                    },
                    delegate(IExpression expression)
                    {
                        return thisReplacement;
                    },
                    true
                );
            }

            // replace all arguments references
            if (argumentReplacements != null)
            {
                CodeUtility.MatchAndReplaceCode<IExpression>(
                    inlinedNode.BasicBlock,
                    delegate(IExpression expression)
                    {
                        return expression is IArgumentReferenceExpression;
                    },
                    delegate(IExpression expression)
                    {
                        IArgumentReferenceExpression argumentReferenceExpression = (IArgumentReferenceExpression)expression;
                        IExpression replacementExpression;
                        if (!argumentReplacements.TryGetValue(argumentReferenceExpression.Parameter.Name, out replacementExpression))
                        {
                            throw new CompilerException(
                                string.Format(
                                    "Error while inlining call to {0}. Could not find argument replacement for parameter \"{1}\". Parameter sequence is {2}.",
                                    calleeMethodCompileInfo.Method,
                                    argumentReferenceExpression.Parameter.Name,
                                    argumentReferenceExpression.Parameter.Sequence
                                )
                            );
                        }
                        else
                        {
                            return replacementExpression;
                        }
                    },
                    true
                );
            }

            if (inlinedNode.FlowControl == FlowControl.Throw)
            {
                // TODO: fixup exception handling info
                throw new CannotInlineMethodException("Contain throw statement");
            }
            else if (inlinedNode.FlowControl == FlowControl.ConditionalBranch)
            {
                // TODO: Fix this so that conditioanl branches can be inlined
                throw new CannotInlineMethodException("Contains a conditional branch");
            }
            else if (inlinedNode.FlowControl == FlowControl.Return)
            {
                // replace return statement with assignment to variable being assigned to in caller
                Debug.Assert(inlinedNode.BasicBlock.Statements.Count == 1, string.Format("Return basic block has {0} statements", inlinedNode.BasicBlock.Statements.Count));
                Debug.Assert(inlinedNode.BasicBlock.Statements[0] is IMethodReturnStatement);
                IMethodReturnStatement methodReturnStatement = (IMethodReturnStatement)inlinedNode.BasicBlock.Statements[0];

                inlinedNode.BasicBlock.Statements.Clear();
                inlinedNode.BasicBlock.Statements.Add(new AssignStatement(returnValueTarget, methodReturnStatement.Expression));

                // add edge between this return node and the caller node's successor
                Debug.Assert(inlinedNode.SuccessorCount == 0);
                Debug.Assert(callerSuccessorNode != null);
                cfg.AddEdge(inlinedNode, callerSuccessorNode);

                // flow control is no longer return
                inlinedNode.FlowControl = FlowControl.Next;
            }

            foreach (CFGEdge outEdge in calleeNode.Graph.OutEdges(calleeNode))
            {
                CFGNode newSuccessorNode = ProcessCFGNode(
                    outEdge.Target, callerNode, callerSuccessorNode,
                    thisReplacement, returnValueTarget,
                    calleeMethodCompileInfo, callerMethodCompileInfo,
                    renamedLocalsMap,
                    variableReplacements,
                    argumentReplacements,
                    processedNodes,
                    newNodes
                );
                cfg.AddEdge(inlinedNode, newSuccessorNode, outEdge.BranchCondition);
            }

            return inlinedNode;
        }

        private bool CanBeInlined(MethodCompileInfo calleeMethodCompileInfo, MethodCompileInfo callerMethodCompileInfo)
        {
            if (calleeMethodCompileInfo.CFG == null)
            {
                return false;
            }
            CustomAttribute customAttribute = AttributeHelper.GetCustomAttribute(calleeMethodCompileInfo.Method, "System.Runtime.CompilerServices", "XaeiOSMethodImplAttribute");
            if (customAttribute != null)
            {
                if (customAttribute.ConstructorParameters.Count > 0)
                {
                    MethodImplOptions methodImplOptions = (MethodImplOptions)customAttribute.ConstructorParameters[0];
                    if ((methodImplOptions & MethodImplOptions.NoInlining) > 0)
                    {
                        return false;
                    }
                }
            }
            if (!calleeMethodCompileInfo.Method.IsPublic)
            {
                // non-public methods should only be inlined within the same assembly
                // this prevents references to internal/private members within the callee assembly from being leaked to the caller assembly
                if (!ReferenceComparer.AssemblyNameReferenceEquals(calleeMethodCompileInfo.Method.DeclaringType.Module.Assembly.Name, callerMethodCompileInfo.Method.DeclaringType.Module.Assembly.Name))
                {
                    return false;
                }
            }
            if (CalculateCost(calleeMethodCompileInfo) > InliningCostThreshold)
            {
                return false;
            }
            if (calleeMethodCompileInfo.Method.IsVirtual)
            {
                return false;
            }

            // disable inlining methods with loops because we can get an infinite loop in ProcessNode
            // TODO: Fix this infinite loop
            if (calleeMethodCompileInfo.Loop.Count != 0)
            {
                return false;
            }

            // don't inline methods that have multiple roots (try/catch/finally blocks)
            if (calleeMethodCompileInfo.Roots.Count > 1)
            {
                return false;
            }

            // this method will be inlined anyway
            if (XaeiOSBackEnd.HasInlineImplementation(calleeMethodCompileInfo.Method))
            {
                return false;
            }

            // don't do inlining with non-preemptive methods
            if (XaeiOSBackEnd.MethodIsNonPreemptive(calleeMethodCompileInfo.Method) || XaeiOSBackEnd.MethodIsNonPreemptive(callerMethodCompileInfo.Method))
            {
                return false;
            }

            // don't inline a method into itself
            if (ReferenceComparer.MethodReferenceEquals(calleeMethodCompileInfo.Method, callerMethodCompileInfo.Method))
            {
                return false;
            }

            // disable inlining methods with locals because we are not properly remapping local vars in ProcessNode
            // TODO: properly remap local vars
            /*if (calleeMethodCompileInfo.Method.Body.Variables.Count != 0)
            {
                Console.WriteLine("6");
                return false;
            }*/


            return true;
        }

        private int CalculateCost(MethodCompileInfo methodCompileInfo)
        {
            int cost = 0;
            foreach (CFGNode node in methodCompileInfo.CFG.Vertices)
            {
                cost += _backend.CalculateStatementCost(node.BasicBlock);
            }
            return cost;
        }

        private class CannotInlineMethodException : Exception
        {
            public CannotInlineMethodException(string reason)
                : base(reason)
            {
            }
        }
    }
}
