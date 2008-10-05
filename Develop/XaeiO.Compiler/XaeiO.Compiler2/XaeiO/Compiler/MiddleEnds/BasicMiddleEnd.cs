using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.Collections;

using Mono.Cecil;
using Mono.Cecil.Cil;

using Tenpow.Collections.Generic;

using System.Diagnostics;
using Reflection = System.Reflection;
using QuickGraph.Collections;

// TODO: dont treat argument references as registers, registers are loaded faster
// TODO: variables defined in try blocks are not live in to handler blocks
namespace XaeiO.Compiler.MiddleEnds
{
    public class BasicMiddleEnd : CompilerTierBase, IMiddleEnd
    {
        private TransformationPhaseOrder _transformationPhase;
        private CFG CFG
        {
            get
            {
                return _methodCompileInfo.CFG;
            }
        }
        private MethodCompileInfo _methodCompileInfo;
        private List<ITransformation> _customTransformations = new List<ITransformation>();
        public List<ITransformation> CustomTransformations
        {
            get { return _customTransformations; }
        }
        private Helpers.CFGRenderer _cfgRenderer;

        #region IMiddleEnd Members

        public void TransformCode(MethodCompileInfo compileInfo)
        {
            if (DebugSettings.CompileMethod != null && compileInfo.Method.ToString() != DebugSettings.CompileMethod)
            {
                return;
            }
            else if (DebugSettings.CompileMethodShort != null && compileInfo.Method.Name != DebugSettings.CompileMethodShort)
            {
                return;
            }

            if (Compiler.Options.Verbocity > 0)
            {
                Console.WriteLine("BasicMiddleEnd: " + compileInfo.Method);
            }

            _methodCompileInfo = compileInfo;

            CFGNodeSet set = new CFGNodeSet(CFG);
            set.Add(CFG.Root);
            Debug.Assert(set.Contains(CFG.Root));

            if (DebugSettings.AnyGraph)
            {
                _cfgRenderer = new XaeiO.Compiler.Helpers.CFGRenderer(CFG, _methodCompileInfo);
            }

            if (DebugSettings.Graph)
            {
                _cfgRenderer.Render("initial.png");
            }

            EnterTransformationPhase(TransformationPhaseOrder.Initial);

            // TODO: Make a CostCalculator class and add it as a property of the compiler

            // TODO: MethodInlining should be a TransformationPhaseOrder.Initial transformation of XaeiOSCompiler
            if (DebugSettings.MethodInlining)
            {
                // method inlining
                new MethodInliningTransformation((BackEnds.XaeiOS.XaeiOSBackEnd)((XaeiOSCompiler)Compiler).BackEnd).Transform(_methodCompileInfo);

                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("method-inlining.png");
                }

            }
            {
                SeparateIntoAtomicBlocks();
            }

            if (DebugSettings.Graph)
            {
                _cfgRenderer.Render("separate-into-atomic-blocks.png");
            }
            {
                PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                if (_methodCompileInfo.TryBlockInfos.Count > 0)
                {
                    FixTryCatchFinallyEdges();
                    if (DebugSettings.Graph)
                    {
                        _cfgRenderer.Render("fix-try-catch-finally-edges.png");
                    }
                    AddExceptionHandlerEdges();
                    if (DebugSettings.Graph)
                    {
                        _cfgRenderer.Render("add-exception-handler-edges.png");
                    }
                    PerformTransformation(new TransitiveClosureAndTopologicalOrder
                    {
                        BuildTransitiveClosure = true,
                        BuildTopologicalOrder = false
                    });
                }
                EliminateEmptyCFGNodes();
                EliminateSuperfluousEdges();
                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("pre-ssa.png");
                }
                SSAForm();
                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("ssa.png");
                }
            }
            EnterTransformationPhase(TransformationPhaseOrder.AfterSSA);
            {
                PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                AnalyzeDefAndUse();
                {
                    if (_methodCompileInfo.PhiNodes.Count > 0)
                    {
                        // TODO: eliminate dead phi nodes should be smarter.  maybe i can do it at the same time as liveness, or after def and use?

                        if (DebugSettings.Graph)
                        {
                            _cfgRenderer.Render("pre-elim-phi.png");
                        }
                        EliminateDeadPhiNodes();
                        PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                        AnalyzeDefAndUse();
                        if (DebugSettings.Graph)
                        {
                            _cfgRenderer.Render("elim-phi.png");
                        }
                    }
                }
                Liveness();
                AvailableExpressions();
                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("pre-cprop.png");
                }
                CopyPropagation();
                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("cprop.png");
                }
                DeadCodeElimination();
            }
            if (DebugSettings.Graph)
            {
                _cfgRenderer.Render("dce.png");
            }
            {
                PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                SimpleExpressionOptimization();
                RebuildConditionExpressions();
            }
            // TODO: constant folding
            // TODO: loop invariant code motion
            // TODO: strength reduction
            EnterTransformationPhase(TransformationPhaseOrder.BeforeRegisterAllocation);
            {
                RegisterAllocation();
                PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                BuildLoopTree();
            }
            EnterTransformationPhase(TransformationPhaseOrder.AfterRegisterAllocation);
            if (DebugSettings.FinalGraph)
            {
                _cfgRenderer.Render("final.png");
            }
            RemoveExceptionHandlerEdges();
        }
        public void TransformAssembly(AssemblyCompileInfo assemblyCompileInfo)
        {
            if (Compiler.Options.IncrementalCompilation)
            {
                // skip transformation if incremental compile info state is available
                if (Compiler.IncrementalCompilationState.ContainsValidPersistedState(assemblyCompileInfo.Assembly))
                {
                    Console.WriteLine("Skipping {0} in the middle end because it has already been compiled", assemblyCompileInfo.Assembly);
                    // TODO: Instead of just returning, populate the properties object with the output of the middle end
                    return;
                }
            }
            foreach (MethodCompileInfo methodCompileInfo in assemblyCompileInfo.MethodCompileInfos.Values)
            {
                try
                {
                    if (methodCompileInfo.Method.RVA.Value != 0) // can't compile extern methods
                    {
                        TransformCode(methodCompileInfo);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("MiddleEnd unable to transform method: " + methodCompileInfo.Method);
                    Console.WriteLine(e);
                    throw;
                }
            }
        }

        #endregion

        public BasicMiddleEnd()
            : base()
        {
            _customTransformations = new List<ITransformation>();
        }

        #region Transformations and data collection

        private void EnterTransformationPhase(TransformationPhaseOrder phase)
        {
            _transformationPhase = phase;
            foreach (ITransformation transformation in _customTransformations)
            {
                if ((transformation.PhaseOrder & phase) != TransformationPhaseOrder.None)
                {
                    PerformTransformation(transformation);
                }
            }
        }
        private void PerformTransformation(ITransformation transformation)
        {
            TransformationUtility.PerformTransformation(transformation, _methodCompileInfo);
        }

        #region Exception handler edges
        private void FixTryCatchFinallyEdges()
        {
            /**
             * MSIL compilers typically isolate finally blocks.
             * Control flow doesn't pass through them.
             * Let's add edges from try ends to finally starts and from catch ends to finally starts.
             * Also let's remove edges from try ends and catch ends to the first node after the try/catch/finally ends.
             * All this only applies if we have a finally block.
             */

            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                if (tryBlockInfo.FinallyBlock != null)
                {
                    tryBlockInfo.TryBlock.End.AddDebugInfo("Try end");
                    EdgeCollection tryOutEdges = CFG.OutEdges(tryBlockInfo.TryBlock.End);
                    if (tryOutEdges.Count >= 2)
                    {
                        throw new CompilerException("Try block end node had multiple out edges");
                    }
                    else if (tryOutEdges.Count == 1)
                    {
                        // remove the sole out edge from the try end
                        CFGEdge tryOutEdge = (CFGEdge)tryOutEdges[0];
                        CFG.RemoveEdge(tryOutEdge);

                        // add edge from finally end to target of the sole out edge from the try end
                        CFG.AddEdge(tryBlockInfo.FinallyBlock.End, tryOutEdge.Target);
                        tryBlockInfo.FinallyBlock.End.FlowControl = FlowControl.Branch;
                        tryBlockInfo.FinallyBlock.End.AddDebugInfo("Finally end");
                    }

                    // add edge from try end to finally start
                    CFG.AddEdge(tryBlockInfo.TryBlock.End, tryBlockInfo.FinallyBlock.Start);
                    tryBlockInfo.FinallyBlock.Start.AddDebugInfo("Finally start");

                    if (tryBlockInfo.ConsolidatedCatchBlock != null)
                    {
                        EdgeCollection catchOutEdges = CFG.OutEdges(tryBlockInfo.ConsolidatedCatchBlock.End);
                        if (catchOutEdges.Count >= 2)
                        {
                            throw new CompilerException("Catch block end node had multiple out edges");
                        }
                        else if (catchOutEdges.Count == 1)
                        {
                            // remove the sole out edge from the catch end
                            CFGEdge catchOutEdge = (CFGEdge)catchOutEdges[0];
                            if (catchOutEdge.BranchCondition.Type != BranchConditionType.Unconditional)
                            {
                                throw new CompilerException("Catch block end node had an out edge with a branch condition: " + catchOutEdge.BranchCondition);
                            }
                            CFG.RemoveEdge(catchOutEdge);

                            // add edge from finally end to target of the sole out edge from the catch end
                            // if it doesn't already exist
                            if (!CFG.ContainsEdge(tryBlockInfo.FinallyBlock.End, catchOutEdge.Target))
                            {
                                CFG.AddEdge(tryBlockInfo.FinallyBlock.End, catchOutEdge.Target);
                            }
                        }

                        // add edge from catch end to finally start
                        CFG.AddEdge(tryBlockInfo.ConsolidatedCatchBlock.End, tryBlockInfo.FinallyBlock.Start);
                    }
                }
            }
        }
        private void AddExceptionHandlerEdges()
        {
            return;


            // handlers are also dominated by whatever nodes dominate the associated try node
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                CFGNode finallyStart = null;
                if (tryBlockInfo.FinallyBlock != null)
                {
                    finallyStart = tryBlockInfo.FinallyBlock.Start;
                }

                Set<CFGNode> tryBlock = CFGUtility.FindNodeSet(tryBlockInfo.TryBlock, _methodCompileInfo);

                foreach (CFGNode tryBlockNode in tryBlock)
                {
                    if (tryBlockNode.FlowControl != FlowControl.Return)
                    {
                        // each node in the try block can branch to the catch block
                        foreach (CFGNodeCluster handlerBlock in tryBlockInfo.Handlers.Keys)
                        {
                            CFG.AddEdge(tryBlockNode, handlerBlock.Start, BranchConditionType.ExceptionThrown);
                        }
                    }

                    // each node in the try block can branch to the finally block
                    if (finallyStart != null)
                    {
                        CFG.AddEdge(tryBlockNode, finallyStart, BranchConditionType.ExceptionThrown);
                    }
                }
            }
        }
        private void RemoveExceptionHandlerEdges()
        {
            CFG.RemoveEdgeIf(new RemoveExceptionHandlerEdgesPredicate());
        }
        private class RemoveExceptionHandlerEdgesPredicate : QuickGraph.Concepts.Predicates.IEdgePredicate
        {
            #region IEdgePredicate Members

            public bool Test(QuickGraph.Concepts.IEdge edge)
            {
                CFGEdge cfgEdge = (CFGEdge)edge;
                return cfgEdge.BranchCondition.Type == BranchConditionType.ExceptionThrown;
            }

            #endregion
        }
        #endregion

        #region SSA Form
        private void SSAForm()
        {
            PerformTransformation(new DominatorAnalysis());
            PerformTransformation(new TransitiveClosureAndTopologicalOrder());

            // replace variable definitions with SSAVariableDefinitions
            Dictionary<VariableReference, int> ordinalCounters = new Dictionary<VariableReference, int>();
            Dictionary<string, SSAVariableDefinition> ssaVariableDefinitionMap = new Dictionary<string, SSAVariableDefinition>();
            foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
            {
                if (n.BasicBlock.Statements.Count > 0)
                {
                    IAssignStatement assignment = n.BasicBlock.Statements[0] as IAssignStatement;
                    if (assignment != null)
                    {
                        IVariableReferenceExpression variableReferenceExpression = assignment.Target as IVariableReferenceExpression;
                        if (variableReferenceExpression == null)
                        {
                            continue;
                        }
                        VariableReference variable = variableReferenceExpression.Variable;
                        Definition definition;
                        SSAVariableDefinition ssaVariableDefinition;
                        if (IsTemporary(variableReferenceExpression))
                        {
                            // temporaries are (at this point) ssa in nature already
                            ssaVariableDefinition = new SSAVariableDefinition((VariableDefinition)variable);
                            definition = new Definition(ssaVariableDefinition, assignment.Expression);
                        }
                        else
                        {
                            int ordinal;
                            if (ordinalCounters.ContainsKey(variable))
                            {
                                ordinal = ++ordinalCounters[variable];
                            }
                            else
                            {
                                ordinal = ordinalCounters[variable] = 1;
                            }
                            ssaVariableDefinition = new SSAVariableDefinition(variable, ordinal, _methodCompileInfo.Method);
                            definition = new Definition(ssaVariableDefinition, assignment.Expression);
                        }
                        ssaVariableDefinitionMap[ssaVariableDefinition.Name] = ssaVariableDefinition;
                        n.BasicBlock.Statements[0] = definition;
                    }
                }
            }

            // we need def/use to have complete picture of where to place phi markers
            AnalyzeDefAndUse();

            if (DebugSettings.Graph)
            {
                _cfgRenderer.Render("mid-ssa.png");
            }

            // phi markers specify where we need to put a phi function
            // assign phi markers according to dominance frontier (SSA Algorithm 3)
            DynamicDictionary<CFGNode, DynamicDictionary<VariableReference, Set<SSAVariableDefinition>>> phiMarkers = new DynamicDictionary<CFGNode, DynamicDictionary<VariableReference, Set<SSAVariableDefinition>>>();
            foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
            {
                if (n.BasicBlock.Statements.Count > 0)
                {
                    IStatement statement = n.BasicBlock.Statements[0];
                    Definition definition = statement as Definition;
                    if (definition != null)
                    {
                        SSAVariableDefinition ssaVariableDefinition = (SSAVariableDefinition)definition.Variable;
                        if (!ssaVariableDefinition.IsTemporary)
                        {
                            // TODO: not sure i need this "if" condition now that I use def/use chains
                            if (!_methodCompileInfo.DominatorFrontier.ContainsKey(n))
                            {
                                // n dominates every node after it
                                Set<CFGNode> strictlyDominatedNodes = _methodCompileInfo.ForwardOnlyTransitiveClosure[n];
                                foreach (CFGNode followingNode in strictlyDominatedNodes)
                                {
                                    if (followingNode.PredecessorCount > 1)
                                    {
                                        phiMarkers[followingNode][ssaVariableDefinition.Variable].Add(ssaVariableDefinition);
                                    }
                                }
                            }
                            else
                            {
                                foreach (CFGNode frontierNode in _methodCompileInfo.DominatorFrontier[n])
                                {
                                    if (frontierNode.PredecessorCount > 1)
                                    {
                                        phiMarkers[frontierNode][ssaVariableDefinition.Variable].Add(ssaVariableDefinition);

                                        // if any of its dominators (other than n) define a version of this variable, add a phi marker
                                        foreach (CFGNode frontierNodeDominator in _methodCompileInfo.Dominators[frontierNode])
                                        {
                                            if (frontierNodeDominator == n)
                                            {
                                                continue;
                                            }
                                            foreach (string variableName in _methodCompileInfo.Defined[frontierNodeDominator])
                                            {
                                                if (IsTemporary(variableName))
                                                {
                                                    continue;
                                                }
                                                if (SSAVariableDefinition.GetUnderlyingVariableName(variableName) == ssaVariableDefinition.Variable.Name)
                                                {
                                                    phiMarkers[frontierNode][ssaVariableDefinition.Variable].Add(ssaVariableDefinitionMap[variableName]);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // now build phi nodes where phi markers are as long as there is more than one definition of a variable
            foreach (KeyValuePair<CFGNode, DynamicDictionary<VariableReference, Set<SSAVariableDefinition>>> phiMarker in phiMarkers)
            {
                CFGNode n = phiMarker.Key;
                DynamicDictionary<VariableReference, Set<SSAVariableDefinition>> allPhiData = phiMarker.Value;
                foreach (KeyValuePair<VariableReference, Set<SSAVariableDefinition>> phiData in allPhiData)
                {
                    VariableReference variableReference = phiData.Key;
                    Set<SSAVariableDefinition> ssaVariableDefinitions = phiData.Value;
                    if (ssaVariableDefinitions.Count > 1)
                    {
                        SSAFormInsertPhiNode(n, ssaVariableDefinitions, ordinalCounters);
                        _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
                    }
                }
            }

            // if a phi node has frontier nodes other than itself, an equivalent phi node must be inserted at each of those frontier nodes
            Set<CFGNode> propagatedPhiNodes = new Set<CFGNode>();
            bool changed;
            do
            {
                changed = false;
                PerformTransformation(new TransitiveClosureAndTopologicalOrder());
                Set<CFGNode> phiNodes = _methodCompileInfo.PhiNodes.Clone();
                foreach (CFGNode phiNode in phiNodes)
                {
                    if (propagatedPhiNodes.Contains(phiNode))
                    {
                        continue;
                    }
                    CFGNodeSet frontierNodes;
                    if (!_methodCompileInfo.DominatorFrontier.TryGetValue(phiNode, out frontierNodes))
                    {
                        continue;
                    }
                    foreach (CFGNode frontierNode in frontierNodes)
                    {
                        if (frontierNode == phiNode)
                        {
                            continue;
                        }
                        changed = true;
                        Definition phiDefinition;
                        Debug.Assert(phiNode.TryGetDefinition(out phiDefinition), "Expected definition at phi node");
                        PhiFunction phiFunction = phiDefinition.Expression as PhiFunction;
                        Debug.Assert(phiFunction != null);
                        CFGNode newPhiNode = SSAFormInsertPhiNode(frontierNode, phiFunction.Variables, ordinalCounters);
                        _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
                        propagatedPhiNodes.Add(phiNode);
                        propagatedPhiNodes.Add(newPhiNode);
                    }
                }

            } while (changed);

            // dominator analysis needed for transitive closures and topological order to identify back edges
            PerformTransformation(new TransitiveClosureAndTopologicalOrder());

            foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
            {
                if (n.BasicBlock.Statements.Count > 0)
                {
                    Definition definition = n.BasicBlock.Statements[0] as Definition;
                    if (definition != null)
                    {
                        SSAFormProcessNode(n, definition);
                    }
                }
            }
        }

        private CFGNode SSAFormInsertPhiNode(CFGNode n, PhiFunction phiFunction, Dictionary<VariableReference, int> ordinalCounters)
        {
            SSAVariableDefinition ssaVariableDefinition = phiFunction.Variables[0].Variable as SSAVariableDefinition;
            Debug.Assert(ssaVariableDefinition != null, "Phi function contains variable that wasn't an SSAVariableDefinition");
            VariableReference variableReference = ssaVariableDefinition.Variable;
            SSAVariableDefinition newSSAVariableDefinition = new SSAVariableDefinition(variableReference, ++ordinalCounters[variableReference], _methodCompileInfo.Method);
            Definition newDefinition = new Definition(newSSAVariableDefinition, phiFunction);
            CFGNode phiNode = CFG.AddNode(newDefinition);
            foreach (CFGEdge inEdge in CFG.InEdges(n))
            {
                CFG.AddEdge(inEdge.Source, phiNode, inEdge.BranchCondition);
                CFG.RemoveEdge(inEdge);
            }
            CFG.AddEdge(phiNode, n);
            _methodCompileInfo.PhiNodes.Add(phiNode);
            return phiNode;
        }

        private CFGNode SSAFormInsertPhiNode(CFGNode n, IList<IVariableReferenceExpression> variables, Dictionary<VariableReference, int> ordinalCounters)
        {
            PhiFunction phiFunction = new PhiFunction()
            {
                Variables = new List<IVariableReferenceExpression>(variables)
            };
            return SSAFormInsertPhiNode(n, phiFunction, ordinalCounters);
        }

        private CFGNode SSAFormInsertPhiNode(CFGNode n, Set<SSAVariableDefinition> ssaVariableDefinitions, Dictionary<VariableReference, int> ordinalCounters)
        {
            List<IVariableReferenceExpression> variables = new List<IVariableReferenceExpression>();
            foreach (SSAVariableDefinition ssaVariableDefinition in ssaVariableDefinitions)
            {
                variables.Add(new VariableReferenceExpression(ssaVariableDefinition));
            }
            PhiFunction phiFunction = new PhiFunction()
            {
                Variables = variables
            };
            return SSAFormInsertPhiNode(n, phiFunction, ordinalCounters);
        }

        private void SSAFormProcessNode(CFGNode n, Definition definition)
        {
            SSAVariableDefinition ssaVariableDefinition = (SSAVariableDefinition)definition.Variable;
            if (!_methodCompileInfo.DominatorFrontier.ContainsKey(n))
            {
                // this node must dominate every node after it in the topological sort
                Set<CFGNode> strictlyDominatedNodes = _methodCompileInfo.ForwardOnlyTransitiveClosure[n];

                if (!ssaVariableDefinition.IsTemporary)
                {
                    ReplaceVariableReferencesWithSSADefinitions(strictlyDominatedNodes, ssaVariableDefinition);
                }
                AddReachingDefinition(strictlyDominatedNodes, definition);
            }
            else
            {
                foreach (CFGNode frontierNode in _methodCompileInfo.DominatorFrontier[n])
                {
                    Set<CFGNode> forwardOnlyTransitiveClosure = _methodCompileInfo.ForwardOnlyTransitiveClosure[n];
                    Set<CFGNode> strictlyDominatedNodes;
                    if (forwardOnlyTransitiveClosure.Contains(frontierNode))
                    {
                        strictlyDominatedNodes = forwardOnlyTransitiveClosure - _methodCompileInfo.ForwardOnlyTransitiveClosure[frontierNode] - new Set<CFGNode>(frontierNode) - new Set<CFGNode>(n);
                    }
                    else
                    {
                        strictlyDominatedNodes = forwardOnlyTransitiveClosure;
                    }
                    if (!ssaVariableDefinition.IsTemporary)
                    {
                        ReplaceVariableReferencesWithSSADefinitions(strictlyDominatedNodes, ssaVariableDefinition);
                    }
                    AddReachingDefinition(strictlyDominatedNodes, definition);
                }
            }
        }

        private void ReplaceVariableReferencesWithSSADefinitions(Set<CFGNode> strictlyDominatedNodes, SSAVariableDefinition ssaVariableDefinition)
        {
            foreach (CFGNode strictlyDominatedNode in strictlyDominatedNodes)
            {
                CodeUtility.MatchAndReplaceCode<IVariableReferenceExpression>(strictlyDominatedNode.BasicBlock, delegate(IVariableReferenceExpression variableReferenceExpression, ICodeObject context)
                {
                    Definition definitionContext = context as Definition;
                    if (definitionContext != null && definitionContext.Target == variableReferenceExpression)
                    {
                        // only replace on RHS
                        return false;
                    }
                    SSAVariableDefinition ssaVariableDefinition2 = variableReferenceExpression.Variable as SSAVariableDefinition;
                    if (ssaVariableDefinition2 != null)
                    {
                        return ssaVariableDefinition2.Variable.Name == ssaVariableDefinition.Variable.Name;
                    }
                    else
                    {
                        return variableReferenceExpression.Variable.Name == ssaVariableDefinition.Variable.Name;
                    }
                }, delegate(IVariableReferenceExpression variableReferenceExpression, ICodeObject context)
                {
                    return new VariableReferenceExpression(ssaVariableDefinition);
                }, true);
            }
        }
        private void AddReachingDefinition(Set<CFGNode> strictlyDominatedNodes, Definition definition)
        {
            foreach (CFGNode strictlyDominatedNode in strictlyDominatedNodes)
            {
                _methodCompileInfo.ReachingDefinitions[strictlyDominatedNode].Add(definition);
            }
        }
        private void EliminateDeadPhiNodes()
        {
            Set<CFGNode> phiNodes = _methodCompileInfo.PhiNodes.Clone();
            foreach (CFGNode phiNode in _methodCompileInfo.PhiNodes)
            {
                Definition definition;
                Debug.Assert(phiNode.TryGetDefinition(out definition));
                if (_methodCompileInfo.UsesOfVariable[definition.Variable.Name].Count == 0)
                {
                    // dead phi node
                    EliminateCFGNode(phiNode);
                    phiNodes.Remove(phiNode);
                }
            }
            _methodCompileInfo.PhiNodes = phiNodes;
        }
        #endregion

        #region SimpleExpressionOptimization
        private void SimpleExpressionOptimization()
        {
            bool changed;
            do
            {
                changed = false;
                foreach (CFGNode node in _methodCompileInfo.TopologicalSort)
                {
                    IExpression replacement = null;
                    CodeUtility.MatchAndReplaceCode<IExpression>(node.BasicBlock, delegate(IExpression expression, ICodeObject context)
                    {
                        IBinaryExpression binaryExpression = expression as IBinaryExpression;
                        if (binaryExpression != null)
                        {
                            ILiteralExpression leftLiteral = binaryExpression.Left as ILiteralExpression;
                            ILiteralExpression rightLiteral = binaryExpression.Right as ILiteralExpression;
                            if (leftLiteral == null)
                            {
                                if (binaryExpression.Left.Type.Equals(CoreTypes.Boolean) && rightLiteral != null && rightLiteral.Value is int && (int)rightLiteral.Value == 0 && (binaryExpression.Operator == BinaryOperator.ValueInequality || binaryExpression.Operator == BinaryOperator.IdentityInequality))
                                {
                                    replacement = binaryExpression.Left;
                                    return true;
                                }
                                return false;
                            }
                            if (rightLiteral == null)
                            {
                                return false;
                            }
                            object leftValue = leftLiteral.Value;
                            object rightValue = rightLiteral.Value;
                            switch (binaryExpression.Operator)
                            {
                                case BinaryOperator.LessThan:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue < (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.LessThanOrEqual:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue <= (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.GreaterThan:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue > (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.GreaterThanOrEqual:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue >= (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.IdentityEquality:
                                case BinaryOperator.ValueEquality:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue == (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.IdentityInequality:
                                case BinaryOperator.ValueInequality:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new BooleanLiteralExpression((int)leftValue != (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.Add:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue + (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.Subtract:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue - (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.Multiply:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue * (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.Divide:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)((double)(int)leftValue / (double)(int)rightValue)); // TODO: Integer division?
                                        }
                                        break;
                                    }
                                case BinaryOperator.Modulus:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue % (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.ShiftLeft:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue << (int)rightValue);
                                        }
                                        break;
                                    }
                                case BinaryOperator.ShiftRight:
                                    {
                                        if (leftValue is int && rightValue is int)
                                        {
                                            replacement = new Int32LiteralExpression((int)leftValue << (int)rightValue);
                                        }
                                        break;
                                    }
                            }
                        }

                        IConditionExpression conditionExpression = expression as IConditionExpression;
                        if (conditionExpression != null)
                        {
                            ILiteralExpression literalExpression = conditionExpression.Condition as ILiteralExpression;
                            if (literalExpression != null)
                            {
                                if (literalExpression.Value is bool)
                                {
                                    bool boolean = (bool)literalExpression.Value;
                                    if (boolean)
                                    {
                                        replacement = conditionExpression.Then;
                                    }
                                    else
                                    {
                                        replacement = conditionExpression.Else;
                                    }
                                }
                            }
                        }

                        return replacement != null;
                    }, delegate(IExpression expression, ICodeObject context)
                    {
                        IExpression ret = replacement;
                        replacement = null;
                        changed = true;
                        return ret;
                    }, true);
                }
            } while (changed);
        }
        #endregion

        #region EliminateUnconditionalBranches
        private void EliminateUnconditionalBranches()
        {
            foreach (CFGNode node in _methodCompileInfo.TopologicalSort)
            {
                if (node.FlowControl != FlowControl.ConditionalBranch)
                {
                    continue;
                }

                if (node.Successors.Length != 2)
                {
                    continue;
                }

                if (node.BasicBlock.Statements.Count != 1)
                {
                    continue;
                }

                IExpressionStatement expressionStatement = node.BasicBlock.Statements[0] as IExpressionStatement;
                if (expressionStatement == null)
                {
                    continue;
                }

                ILiteralExpression literalExpression = expressionStatement.Expression as ILiteralExpression;
                if (literalExpression == null || (literalExpression.Value.GetType() != typeof(bool) && literalExpression.Value.GetType() != typeof(Boolean)))
                {
                    continue;
                }

                bool isTrue = (bool)literalExpression.Value;

                QuickGraph.Collections.EdgeCollection edges = node.Graph.OutEdges(node);
                CFGEdge edge1 = (CFGEdge)edges[0];
                CFGEdge edge2 = (CFGEdge)edges[1];
                CFGNode thenNode = null, elseNode = null;
                if (edge1.BranchCondition.Type == BranchConditionType.True)
                {
                    thenNode = edge1.Target;
                    if (edge2.BranchCondition.Type != BranchConditionType.False)
                    {
                        continue;
                    }
                    elseNode = edge2.Target;
                    if (isTrue)
                    {
                        edge1.BranchCondition.Type = BranchConditionType.Unconditional;
                    }
                    else
                    {
                        edge2.BranchCondition.Type = BranchConditionType.Unconditional;
                    }
                }
                else if (edge2.BranchCondition.Type == BranchConditionType.True)
                {
                    thenNode = edge2.Target;
                    if (edge1.BranchCondition.Type != BranchConditionType.False)
                    {
                        continue;
                    }
                    elseNode = edge1.Target;

                    if (isTrue)
                    {
                        edge2.BranchCondition.Type = BranchConditionType.Unconditional;
                    }
                    else
                    {
                        edge1.BranchCondition.Type = BranchConditionType.Unconditional;
                    }
                }

                // TODO: Commented out because computing the full transitive closure is expensive
                // I'm pretty sure that the forward only transitive closure is good enough for this pattern matching
                //Set<CFGNode> tcThen = _methodCompileInfo.TransitiveClosure[thenNode];
                //Set<CFGNode> tcElse = _methodCompileInfo.TransitiveClosure[elseNode];
                Set<CFGNode> tcThen = _methodCompileInfo.ForwardOnlyTransitiveClosure[thenNode];
                Set<CFGNode> tcElse = _methodCompileInfo.ForwardOnlyTransitiveClosure[elseNode];
                Set<CFGNode> thenAndElseOnly = tcThen ^ tcElse;
                Set<CFGNode> sansThenAndElse = tcThen & tcElse;

                Set<CFGNode> thenSet = tcThen - sansThenAndElse;
                Set<CFGNode> elseSet = tcElse - sansThenAndElse;

                if (sansThenAndElse.Count != 0)
                {
                    // next node after conditionstatement must dominate everything after it
                    List<CFGNode> sansThenAndElseList = new List<CFGNode>(sansThenAndElse); // TODO: this algorithm could be better
                    sansThenAndElseList.Sort(delegate(CFGNode a, CFGNode b)
                    {
                        return _methodCompileInfo.TopologicalOrder[a].CompareTo(_methodCompileInfo.TopologicalOrder[b]);
                    });
                    if (sansThenAndElseList.Count > 1 && _methodCompileInfo.TopologicalOrder[sansThenAndElseList[0]] >= _methodCompileInfo.TopologicalOrder[sansThenAndElseList[1]])
                    {
                        continue;
                    }
                }

                // then node must dominate all nodes in thenSet
                bool failed = false;
                foreach (CFGNode node2 in thenSet)
                {
                    if (!_methodCompileInfo.Dominators[node2].Contains(thenNode))
                    {
                        failed = true;
                        break;
                    }
                }
                if (failed)
                {
                    continue;
                }
                thenSet.Add(thenNode);

                // same with else node and else set
                foreach (CFGNode node2 in elseSet)
                {
                    if (!_methodCompileInfo.Dominators[node2].Contains(elseNode))
                    {
                        failed = true;
                        break;
                    }
                }
                if (failed)
                {
                    continue;
                }
                elseSet.Add(elseNode);

                Set<CFGNode> deadSet = isTrue ? elseSet : thenSet;
                _methodCompileInfo.DeadCode.AddRange(deadSet);
                _methodCompileInfo.DeadCode.Add(node);

                node.FlowControl = FlowControl.Next;
            }
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(TransitiveClosureAndTopologicalOrder));
        }
        #endregion

        #region EliminateUnreachableCode
        private void EliminateUnreachableCode()
        {
            // TODO: this doesn't work :(
            foreach (CFGNode node in _methodCompileInfo.CFG.Vertices)
            {
                if (node.PredecessorCount == 0 && !_methodCompileInfo.Roots.Contains(node))
                {
                    node.BasicBlock.Statements.Clear();
                    _methodCompileInfo.DeadCode.Add(node);
                }
            }
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(TransitiveClosureAndTopologicalOrder));
        }
        #endregion

        #region EliminateEmptyCFGNodes
        private void EliminateEmptyCFGNodes()
        {
            EliminateEmptyCFGNodes(_methodCompileInfo.NodeSet);
        }
        private void EliminateEmptyCFGNodes(Set<CFGNode> nodeSet)
        {
            Set<CFGNode> roots = _methodCompileInfo.Roots;
            List<CFGNode> removed;
            do
            {
                removed = new List<CFGNode>();
                foreach (CFGNode node in nodeSet)
                {
                    if (EliminateEmptyCFGNodes_BlockIsEmpty(node.BasicBlock))
                    {
                        int outDegree = CFG.OutDegree(node);
                        CFGEdge theOutEdge = null;
                        if (outDegree != 1)
                        {
                            if (outDegree != 2)
                            {
                                continue;
                            }
                            bool foundNonExceptionThrownEdge = false;
                            bool canEliminate = true;
                            foreach (CFGEdge edge in CFG.OutEdges(node))
                            {
                                if (edge.BranchCondition.Type == BranchConditionType.ExceptionThrown)
                                {
                                    continue;
                                }
                                if (foundNonExceptionThrownEdge)
                                {
                                    canEliminate = false;
                                    break;
                                }
                                else
                                {
                                    theOutEdge = edge;
                                    foundNonExceptionThrownEdge = true;
                                }
                            }
                            if (!canEliminate)
                            {
                                continue;
                            }
                        }
                        else
                        {
                            theOutEdge = (CFGEdge)CFG.OutEdges(node)[0];
                        }
                        CFGNode successor = theOutEdge.Target;
                        foreach (CFGEdge edge in CFG.InEdges(node))
                        {
                            if (!CFG.ContainsEdge(edge.Source, successor))
                            {
                                CFG.AddEdge(edge.Source, successor, edge.BranchCondition);
                            }
                        }

                        FixupRootsAndExceptionHandlingNodes(node, successor);

                        CFG.RemoveVertex(node);
                    }
                }
                foreach (CFGNode n in removed)
                {
                    nodeSet.Remove(n);
                }
            } while (removed.Count > 0);
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(TransitiveClosureAndTopologicalOrder));
        }
        private bool EliminateEmptyCFGNodes_BlockIsEmpty(BasicBlock basicBlock)
        {
            foreach (IStatement statement in basicBlock.Statements)
            {
                if (!(statement is NopStatement))
                {
                    return false;
                }
            }
            return true;
        }
        #endregion

        #region EliminateCFGNode
        private void EliminateCFGNode(CFGNode node)
        {
            if (CFG.ContainsVertex(node))
            {
                node.BasicBlock.Statements.Clear();
                EliminateEmptyCFGNodes(new Set<CFGNode>(node));
            }
        }
        #endregion

        #region EliminateSuperfluousEdges
        private void EliminateSuperfluousEdges()
        {
            List<CFGEdge> edges = new List<CFGEdge>();
            foreach (QuickGraph.Concepts.IEdge edge in CFG.Edges)
            {
                edges.Add((CFGEdge)edge);
            }
            foreach (CFGEdge edge in edges)
            {
                if (edge.Source.FlowControl == FlowControl.Return && CFG.OutDegree(edge.Source) == 1)
                {
                    CFG.RemoveEdge(edge);
                }
            }
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(TransitiveClosureAndTopologicalOrder));
        }
        #endregion

        #region SeparateIntoAtomicBlocks
        private void SeparateIntoAtomicBlocks()
        {
            List<CFGNode> nodes = new List<CFGNode>();
            foreach (QuickGraph.Concepts.IVertex vertex in CFG.Vertices)
            {
                nodes.Add((CFGNode)vertex);
            }
            Set<CFGNode> roots = _methodCompileInfo.Roots;
            foreach (CFGNode node in nodes)
            {
                if (node.BasicBlock.Statements.Count > 1)
                {
                    CFGNodeCluster cluster = (CFGNodeCluster)CFG.AddNode();
                    for (int i = 0; i < node.BasicBlock.Statements.Count; i++) // TODO: break this loop up into first statement, loop through middle, and last statement
                    {
                        if (i == 0) // first statement
                        {
                            cluster.Start.BasicBlock.Statements.Add(node.BasicBlock.Statements[i]);
                            foreach (CFGEdge edge in CFG.InEdges(node))
                            {
                                CFG.AddEdge(edge.Source, cluster.Start, edge.BranchCondition);
                            }
                        }
                        else if (i == (node.BasicBlock.Statements.Count - 1)) // last statement
                        {
                            CFGNode newNode = CFG.AddNode(node.BasicBlock.Statements[i], node.FlowControl);
                            CFG.AddEdge(cluster.End, newNode);
                            foreach (CFGEdge edge in CFG.OutEdges(node))
                            {
                                CFG.AddEdge(newNode, edge.Target, edge.BranchCondition);
                            }
                        }
                        else // middle statements
                        {
                            CFGNode newNode = CFG.AddNode(node.BasicBlock.Statements[i]);
                            CFG.AddEdge(cluster.End, newNode);
                            cluster.End = newNode;
                        }
                    }

                    FixupRootsAndExceptionHandlingNodes(node, cluster);

                    CFG.RemoveVertex(node);
                }
            }
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(DominatorAnalysis));
            _methodCompileInfo.ConsistentTransformationTypes.Remove(typeof(TransitiveClosureAndTopologicalOrder));
        }
        #endregion

        #region AnalyzeDefAndUse
        private void AnalyzeDefAndUse()
        {
            _methodCompileInfo.Used.Clear();
            _methodCompileInfo.UsesOfVariable.Clear();
            _methodCompileInfo.DefinitionsOfVariable.Clear();
            _methodCompileInfo.Defined.Clear();
            QuickGraph.Algorithms.Search.BreadthFirstSearchAlgorithm algorithm = new QuickGraph.Algorithms.Search.BreadthFirstSearchAlgorithm(CFG);
            algorithm.DiscoverVertex += new QuickGraph.Concepts.VertexEventHandler(AnalyzeDefAndUse_DiscoverVertex);
            foreach (CFGNode root in _methodCompileInfo.Roots)
            {
                algorithm.Compute(root);
            }
        }

        void AnalyzeDefAndUse_DiscoverVertex(object sender, QuickGraph.Concepts.VertexEventArgs e)
        {
            CFGNode node = (CFGNode)e.Vertex;
            if (_methodCompileInfo.DeadCode.Contains(node))
            {
                return;
            }
            CodeMatcher<IVariableReferenceExpression> codeMatcher = delegate(IVariableReferenceExpression v)
            {
                _methodCompileInfo.Used[node].Add(v.Variable.Name);
                _methodCompileInfo.UsesOfVariable[v.Variable.Name].Add(node);
                return false;
            };
            foreach (IStatement statement in node.BasicBlock.Statements)
            {
                IAssignStatement assignStatement = statement as IAssignStatement;
                if (assignStatement != null)
                {
                    IVariableReferenceExpression variableReferenceExpression = assignStatement.Target as IVariableReferenceExpression;
                    if (variableReferenceExpression != null)
                    {
                        _methodCompileInfo.Defined[node].Add(variableReferenceExpression.Variable.Name);
                        _methodCompileInfo.DefinitionsOfVariable[variableReferenceExpression.Variable.Name].Add(node);
                    }
                    else
                    {
                        CodeUtility.MatchCode<IVariableReferenceExpression>(assignStatement.Target, codeMatcher);
                    }

                    variableReferenceExpression = assignStatement.Expression as IVariableReferenceExpression;
                    PhiFunction phiFunction;
                    if (variableReferenceExpression != null)
                    {
                        _methodCompileInfo.Used[node].Add(variableReferenceExpression.Variable.Name);
                        _methodCompileInfo.UsesOfVariable[variableReferenceExpression.Variable.Name].Add(node);
                    }
                    else if ((phiFunction = assignStatement.Expression as PhiFunction) != null)
                    {
                        foreach (IVariableReferenceExpression variableReferenceExpression2 in phiFunction.Variables)
                        {
                            _methodCompileInfo.Used[node].Add(variableReferenceExpression2.Variable.Name);
                            _methodCompileInfo.UsesOfVariable[variableReferenceExpression2.Variable.Name].Add(node);
                        }
                    }
                    else
                    {
                        CodeUtility.MatchCode<IVariableReferenceExpression>(assignStatement.Expression, codeMatcher);
                    }
                }
                else
                {
                    CodeUtility.MatchCode<IVariableReferenceExpression>(statement, codeMatcher);
                }

            }
        }
        #endregion

        #region Liveness Analysis

        private void Liveness()
        {
            List<CFGNode> sortedNodes = _methodCompileInfo.TopologicalSort;

            DynamicDictionary<CFGNode, Set<string>> inMap = _methodCompileInfo.LiveVariablesIn;
            DynamicDictionary<CFGNode, Set<string>> outMap = _methodCompileInfo.LiveVariablesOut;
            DynamicDictionary<CFGNode, Set<string>> usedMap = _methodCompileInfo.Used;
            DynamicDictionary<CFGNode, Set<string>> definedMap = _methodCompileInfo.Defined;
            DynamicDictionary<CFGNode, Set<string>> inMapPrime = new DynamicDictionary<CFGNode, Set<string>>();
            DynamicDictionary<CFGNode, Set<string>> outMapPrime = new DynamicDictionary<CFGNode, Set<string>>();
            inMap.Clear();
            outMap.Clear();

            Set<String> parameters = new Set<string>();
            foreach (ParameterDefinition p in _methodCompileInfo.Method.Parameters)
            {
                parameters.Add(p.Name);
            }

            Set<CFGNode> catchStarts = new Set<CFGNode>();
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                // TODO: Build consolidated catch block
                if (tryBlockInfo.ConsolidatedCatchBlock != null)
                {
                    catchStarts.Add(tryBlockInfo.ConsolidatedCatchBlock.Start);
                }
            }

            do
            {
                for (int i = sortedNodes.Count - 1; i >= 0; i--)
                {
                    CFGNode n = sortedNodes[i];
                    inMapPrime[n] = inMap[n].Clone();
                    outMapPrime[n] = outMap[n].Clone();
                    Set<string> o = new Set<string>();
                    foreach (CFGNode s in n.Successors)
                    {
                        o |= inMap[s];
                    }
                    outMap[n] = o;
                    /*if (_compileInfo.PhiNodes.Contains(n))
                    {
                        inMap[n] = outMap[n] - definedMap[n];
                    }
                    else
                    {*/

                    inMap[n] = usedMap[n] | (outMap[n] - definedMap[n]);
                    //}

                    // catch block start nodes always have $e live in
                    if (catchStarts.Contains(n))
                    {
                        inMap[n].Add("$e");
                    }

                }
                if (sortedNodes.Count > 0)
                {
                    // parameters are always live in
                    inMap[sortedNodes[0]] |= parameters;
                }
            } while (inMap != inMapPrime || outMap != outMapPrime);
        }

        #endregion

        #region Reaching Definition (not used anymore b/c of SSA)

        private void ReachingDefinitions()
        {
            List<CFGNode> sortedNodes = new List<CFGNode>();
            try
            {
                QuickGraph.Algorithms.TopologicalSortAlgorithm sortAlgorithm = new QuickGraph.Algorithms.TopologicalSortAlgorithm(CFG);
                sortAlgorithm.Compute();
                foreach (CFGNode node in sortAlgorithm.SortedVertices)
                {
                    sortedNodes.Add(node);
                }
            }
            catch (QuickGraph.Exceptions.NonAcyclicGraphException)
            {
                foreach (QuickGraph.Concepts.IVertex vertex in CFG.Vertices)
                {
                    sortedNodes.Add((CFGNode)vertex);
                }
            }

            DynamicDictionary<CFGNode, Set<Definition>> genMap = _methodCompileInfo.GeneratedDefinitions;
            DynamicDictionary<CFGNode, Set<Definition>> killMap = _methodCompileInfo.KilledDefinitions;
            DynamicDictionary<CFGNode, Set<Definition>> inMap = _methodCompileInfo.ReachingDefinitions;
            DynamicDictionary<CFGNode, Set<Definition>> outMap = new DynamicDictionary<CFGNode, Set<Definition>>();//_compileInfo.LiveDefinitionsOut;
            DynamicDictionary<CFGNode, Set<Definition>> inMapPrime = new DynamicDictionary<CFGNode, Set<Definition>>();
            DynamicDictionary<CFGNode, Set<Definition>> outMapPrime = new DynamicDictionary<CFGNode, Set<Definition>>();
            Dictionary<string, Set<Definition>> allDefinitions = new Dictionary<string, Set<Definition>>();
            genMap.Clear();
            killMap.Clear();
            inMap.Clear();
            outMap.Clear();

            foreach (CFGNode n in sortedNodes)
            {
                Set<Definition> genSet = new Set<Definition>();
                foreach (IStatement statement in n.BasicBlock.Statements)
                {
                    IAssignStatement assignStatement = statement as IAssignStatement;
                    if (assignStatement != null)
                    {
                        IVariableReferenceExpression variableReferenceExpression = assignStatement.Target as IVariableReferenceExpression;
                        if (variableReferenceExpression != null)
                        {
                            Definition def = new Definition(assignStatement);
                            genSet.Add(def);
                            if (!allDefinitions.ContainsKey(variableReferenceExpression.Variable.Name))
                            {
                                allDefinitions[variableReferenceExpression.Variable.Name] = new Set<Definition>();
                            }
                            allDefinitions[variableReferenceExpression.Variable.Name].Add(def);
                        }
                    }
                }
                genMap[n] = genSet;
            }

            foreach (CFGNode n in sortedNodes)
            {
                Set<Definition> killSet = killMap[n];
                foreach (IStatement statement in n.BasicBlock.Statements)
                {
                    IAssignStatement assignStatement = statement as IAssignStatement;
                    if (assignStatement != null)
                    {
                        IVariableReferenceExpression variableReferenceExpression = assignStatement.Target as IVariableReferenceExpression;
                        if (variableReferenceExpression != null)
                        {
                            foreach (Definition def in allDefinitions[((IVariableReferenceExpression)assignStatement.Target).Variable.Name])
                            {
                                if (def.Expression.Equals(assignStatement.Expression))
                                {
                                    continue;
                                }
                                killSet.Add(def); ;
                            }
                        }
                    }
                }
                killMap[n] = killSet;
            }

            do
            {
                foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
                {
                    inMapPrime[n] = (Set<Definition>)inMap[n].Clone();
                    outMapPrime[n] = (Set<Definition>)outMap[n].Clone();

                    Set<Definition> inSet = new Set<Definition>();
                    foreach (CFGNode predecessor in n.Predecessors)
                    {
                        inSet = (Set<Definition>)(inSet | outMap[predecessor]);
                    }
                    inMap[n] = inSet;

                    outMap[n] = (Set<Definition>)(genMap[n] | (inMap[n] - killMap[n]));
                }

            } while (inMap != inMapPrime && outMap != outMapPrime);
        }

        #endregion

        #region Available Expression Analysis
        private void AvailableExpressions()
        {
            DynamicDictionary<CFGNode, Set<Definition>> genMap = _methodCompileInfo.GeneratedExpressions;
            DynamicDictionary<CFGNode, Set<Definition>> killMap = _methodCompileInfo.KilledExpressions;
            DynamicDictionary<CFGNode, Set<Definition>> inMap = _methodCompileInfo.LiveExpressionsIn;
            DynamicDictionary<CFGNode, Set<Definition>> outMap = _methodCompileInfo.LiveExpressionsOut;
            DynamicDictionary<CFGNode, Set<Definition>> inMapPrime = new DynamicDictionary<CFGNode, Set<Definition>>();
            DynamicDictionary<CFGNode, Set<Definition>> outMapPrime = new DynamicDictionary<CFGNode, Set<Definition>>();
            DynamicDictionary<string, Set<Definition>> allExpressions = new DynamicDictionary<string, Set<Definition>>();
            Set<Definition> fullSet = new Set<Definition>();
            genMap.Clear();
            killMap.Clear();
            inMap.Clear();
            outMap.Clear();

            // calculate gen set, full set and allExpressions
            foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
            {
                Set<Definition> genSet = new Set<Definition>();
                foreach (Definition definition in _methodCompileInfo.GeneratedDefinitions[n])
                {
                    genSet.Add(definition);
                    fullSet.Add(definition);
                    IVariableReferenceExpression variableReferenceExpression = definition.Expression as IVariableReferenceExpression;
                    if (variableReferenceExpression != null)
                    {
                        allExpressions[variableReferenceExpression.Variable.Name].Add(definition);
                    }
                    else
                    {
                        CodeUtility.MatchCode<IVariableReferenceExpression>(definition.Expression, delegate(IVariableReferenceExpression expression)
                        {
                            allExpressions[expression.Variable.Name].Add(definition);
                            return false;
                        });
                    }
                    allExpressions[definition.Variable.Name].Add(definition);
                }
                genMap[n] = genSet;
            }

            Set<CFGNode> roots = _methodCompileInfo.Roots;
            // calculate kill set
            // also initialize in and out sets to full set
            foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
            {
                Set<Definition> killSet = killMap[n];
                foreach (Definition definition in _methodCompileInfo.GeneratedDefinitions[n])
                {
                    foreach (Definition expression in allExpressions[definition.Variable.Name])
                    {
                        killSet.Add(expression);
                    }
                }
                killMap[n] = killSet;

                // initialize in and out sets to full set
                if (roots.Contains(n))
                {
                    inMap[n] = fullSet;
                    outMap[n] = fullSet;
                }
            }

            do
            {
                foreach (CFGNode n in _methodCompileInfo.TopologicalSort)
                {
                    inMapPrime[n] = (Set<Definition>)inMap[n].Clone();
                    outMapPrime[n] = (Set<Definition>)outMap[n].Clone();

                    Set<Definition> inSet = inMap[n];
                    foreach (CFGNode predecessor in n.Predecessors)
                    {
                        inSet = (Set<Definition>)(inSet & outMap[predecessor]);
                    }
                    inMap[n] = inSet;

                    outMap[n] = (Set<Definition>)(genMap[n] | (inMap[n] - killMap[n]));
                }

            } while (inMap != inMapPrime && outMap != outMapPrime);
        }
        #endregion

        #region Dead Code Elimination
        private void DeadCodeElimination()
        {
            EliminateDeadAssignments();
            EliminateUnconditionalBranches();
            EliminateUnreachableCode();
            // TODO: sort all nodes by FlowControl (Next, ConditionalBranch, -> Rest) rather than do BFS
            DeadCodeElimination_RemovedNodes = new List<CFGNode>();
            QuickGraph.Algorithms.Search.BreadthFirstSearchAlgorithm algorithm = new QuickGraph.Algorithms.Search.BreadthFirstSearchAlgorithm(CFG);
            algorithm.DiscoverVertex += DeadCodeElimination_DiscoverVertex;
            foreach (CFGNode root in _methodCompileInfo.Roots)
            {
                algorithm.Compute(root);
            }
            _methodCompileInfo.DeadCode.Clear();
            foreach (CFGNode n in DeadCodeElimination_RemovedNodes)
            {
                if (_methodCompileInfo.PhiNodes.Contains(n))
                {
                    _methodCompileInfo.PhiNodes.Remove(n);
                }
                n.BasicBlock.Statements.Clear();
            }
            EliminateEmptyCFGNodes();
        }
        private List<CFGNode> DeadCodeElimination_RemovedNodes;
        void DeadCodeElimination_DiscoverVertex(object sender, QuickGraph.Concepts.VertexEventArgs e)
        {
            CFGNode node = (CFGNode)e.Vertex;

            if (_methodCompileInfo.DeadCode.Contains(node))
            {
                DeadCodeElimination_RemovedNodes.Add(node);
                return;
            }

            if (node.FlowControl != FlowControl.Next)
            {
                return;
            }

            foreach (string v in _methodCompileInfo.Defined[node])
            {
                if (_methodCompileInfo.LiveVariablesOut[node].Contains(v))
                {
                    return;
                }
                if (_methodCompileInfo.LocalMap.ContainsKey(v))
                {
                    return;
                }
            }

            foreach (IStatement statement in node.BasicBlock.Statements)
            {
                IAssignStatement assignStatement = statement as IAssignStatement;
                if (assignStatement == null)
                {
                    return;
                }
                if (!(assignStatement.Target is IVariableReferenceExpression))
                {
                    return;
                }
            }
            DeadCodeElimination_RemovedNodes.Add(node);
        }

        private void EliminateDeadAssignments()
        {
            foreach (CFGNode node in _methodCompileInfo.TopologicalSort)
            {
                if (node.BasicBlock.Statements.Count != 1)
                {
                    continue;
                }
                IAssignStatement assignStatement = node.BasicBlock.Statements[0] as IAssignStatement;
                if (assignStatement == null)
                {
                    continue;
                }
                IVariableReferenceExpression variableReferenceExpression = assignStatement.Target as IVariableReferenceExpression;
                if (variableReferenceExpression == null)
                {
                    continue;
                }

                if (_methodCompileInfo.UsesOfVariable[variableReferenceExpression.Variable.Name].Count != 0 &&
                    _methodCompileInfo.LiveVariablesOut[node].Contains(variableReferenceExpression.Variable.Name))
                {
                    continue;
                }

                if (node.FlowControl == FlowControl.Next/* &&
                    !(  assignStatement.Expression is IMethodInvokeExpression ||
                        assignStatement.Expression is IObjectCreateExpression )*/
                                                                                 )
                {
                    // this is dead code now because the expression is just a variable reference expression
                    // leaving this in would result in statements like $r1; or $l1; being all over the place
                    _methodCompileInfo.DeadCode.Add(node);
                }
                else
                {
                    node.BasicBlock.Statements[0] = new ExpressionStatement(assignStatement.Expression);
                }
            }
        }
        #endregion

        #region RebuildConditionExpressions
        private void RebuildConditionExpressions()
        {
            foreach (CFGNode node in _methodCompileInfo.TopologicalSort)
            {
                CodeUtility.MatchAndReplaceCode<IExpression>(node.BasicBlock, delegate(IExpression expression, ICodeObject context)
                {
                    PhiExpression phi = expression as PhiExpression;
                    if (phi != null && phi.Condition != null)
                    {
                        return true;
                    }
                    return false;
                }, delegate(IExpression expression, ICodeObject context)
                {
                    PhiExpression phi = (PhiExpression)expression;
                    ConditionExpression conditionExpression = new ConditionExpression();
                    conditionExpression.Condition = phi.Condition.Target;

                    // condition node is dead code now
                    foreach (CFGNode n in _methodCompileInfo.DefinitionsOfVariable[((IVariableReferenceExpression)phi.Condition.Target).Variable.Name])
                    {
                        if (n.BasicBlock.Statements.Count > 0)
                        {
                            if (n.BasicBlock.Statements[0].Equals(phi.Condition))
                            {
                                _methodCompileInfo.DeadCode.Add(n);
                                break;
                            }
                        }
                    }

                    // special copy propagation needed here
                    Definition theDefinition = null;
                    foreach (Definition d in _methodCompileInfo.ReachingDefinitions[node])
                    {
                        if (d.Variable.Name == ((IVariableReferenceExpression)phi.Then).Variable.Name)
                        {
                            if ((object)theDefinition == null)
                            {
                                theDefinition = d;
                            }
                            else
                            {
                                theDefinition = null;
                                break;
                            }
                        }
                    }
                    if ((object)theDefinition == null)
                    {
                        conditionExpression.Then = phi.Then;
                    }
                    else
                    {
                        conditionExpression.Then = theDefinition.Expression;
                    }

                    theDefinition = null;
                    foreach (Definition d in _methodCompileInfo.ReachingDefinitions[node])
                    {
                        if (d.Variable.Name == ((IVariableReferenceExpression)phi.Else).Variable.Name)
                        {
                            if ((object)theDefinition == null)
                            {
                                theDefinition = d;
                            }
                            else
                            {
                                theDefinition = null;
                                break;
                            }
                        }
                    }
                    if ((object)theDefinition == null)
                    {
                        conditionExpression.Else = phi.Else;
                    }
                    else
                    {
                        conditionExpression.Else = theDefinition.Expression;
                    }
                    return conditionExpression;
                }, true);
            }
        }
        #endregion

        #region Copy propagation
        private void CopyPropagation()
        {
            List<CFGNode> sortedNodes = _methodCompileInfo.TopologicalSort;
            Set<CFGNode> removedNodes = new Set<CFGNode>();
            bool changes;
            do
            {
                changes = false;
                foreach (CFGNode targetNode in sortedNodes)
                {
                    if (removedNodes.Contains(targetNode))
                    {
                        continue;
                    }
                    if (_methodCompileInfo.PhiNodes.Contains(targetNode))
                    {
                        continue;
                    }

                    Set<string> used = _methodCompileInfo.Used[targetNode].Clone();
                    foreach (string v in used)
                    {
                        if (v.StartsWith("$ts")) // TODO: Extract this out, along with other variable helper methods, into VariableHelper class
                        {
                            continue;
                        }

                        Definition theDefinition = null;
                        foreach (Definition d in _methodCompileInfo.ReachingDefinitions[targetNode])
                        {
                            if (d.Variable.Name == v)
                            {
                                theDefinition = d;
                                break;
                            }
                        }
                        if (theDefinition == null)
                        {
                            continue;
                        }

                        IExpression expressionToPropagate = theDefinition.Expression;

                        if (expressionToPropagate is ExceptionExpression)
                        {
                            continue;
                        }

                        if (expressionToPropagate is PhiFunction)
                        {
                            continue;
                        }

                        // cost threshold for copy propagation
                        if (Compiler.BackEnd.CalculateExpressionCost(theDefinition.Expression) > 100) // TODO: use a real expression cost threshold here
                        {
                            continue;
                        }

                        Set<CFGNode> definingNodes = _methodCompileInfo.DefinitionsOfVariable[theDefinition.Variable.Name];
                        if (definingNodes.Count == 0)
                        {
                            continue;
                        }

                        // because of SSA form, there is never more than one defining node per variable at this point
                        if (definingNodes.Count != 1)
                        {
                            Console.WriteLine("[WARN] Method " + _methodCompileInfo.Method + " had invalid SSA form.");
                            continue;
                        }
                        CFGNode theDefiningNode = definingNodes[0];

                        // if theDefinition.Expression has side effects, do not copy propagate beyond the very next node
                        if (theDefinition.Expression is IFieldReferenceExpression ||
                            theDefinition.Expression is IMethodInvokeExpression ||
                            theDefinition.Expression is IObjectCreateExpression ||
                            theDefinition.Expression is IArrayCreateExpression ||
                            CodeUtility.MatchCode<IExpression>(theDefinition.Expression, delegate(IExpression expression)
                            {
                                return expression is IFieldReferenceExpression ||
                                    expression is IMethodInvokeExpression ||
                                    expression is IObjectCreateExpression ||
                                    expression is IArrayCreateExpression;
                            }) != null) // TODO: some other expressions have side effects or have method calls
                        {

                            if (_methodCompileInfo.IsFrozen(theDefinition.Variable))
                            {
                                continue;
                            }
                            // TODO: Maybe I shouldn't copy propagate from anything that isn't a temp?
                            if (!_methodCompileInfo.IsTemporary(theDefinition.Variable))
                            {
                                continue;
                            }

                            // make sure definition being propagated was at a predecessor node
                            // : theDefiningNode must be a predecessor of node
                            bool isPredecessor = false;

                            foreach (CFGNode predecessor in targetNode.Predecessors)
                            {
                                if (predecessor == theDefiningNode)
                                {
                                    isPredecessor = true;
                                    break;
                                }
                            }
                            if (!isPredecessor)
                            {
                                continue;
                            }

                            // make sure that variable is the expression at the sole definition at this node
                            Definition definition3;
                            if (!targetNode.TryGetDefinition(out definition3))
                            {
                                continue;
                            }

                            IVariableReferenceExpression variableReferenceExpression = definition3.Expression as IVariableReferenceExpression;
                            if (variableReferenceExpression == null || variableReferenceExpression.Variable.Name != theDefinition.Variable.Name)
                            {
                                continue;
                            }
                        }

                        bool propagated = false;

                        // replace uses of v with the reaching definition
                        CodeUtility.MatchAndReplaceCode<IExpression>(targetNode.BasicBlock, delegate(IExpression expression, ICodeObject context)
                        {

                            // do not copy propagate to lhs of assignstatement
                            IAssignStatement assignStatement = context as IAssignStatement;
                            if (assignStatement != null)
                            {
                                if (assignStatement.Target == expression)
                                {
                                    return false;
                                }
                            }

                            IVariableReferenceExpression variableReferenceExpression = expression as IVariableReferenceExpression;
                            return variableReferenceExpression != null && variableReferenceExpression.Variable.Name == v;
                        }, delegate(IExpression expression, ICodeObject context)
                        {
                            propagated = true;
                            return expressionToPropagate;
                        }, true);

                        if (propagated)
                        {
                            _methodCompileInfo.Used[targetNode].Remove(v);
                            _methodCompileInfo.UsesOfVariable[v].Remove(targetNode);


                            /*
                             * Since the target node has changed, we need to check whether it was a definition node.
                             * If it was, then all nodes that use the variable defined at the target node need to update their
                             * reaching definitions.
                             * 
                             */
                            Definition targetNodeNewDefinition;
                            if (targetNode.TryGetDefinition(out targetNodeNewDefinition))
                            {
                                foreach (CFGNode usersOfNewDefinition in _methodCompileInfo.UsesOfVariable[targetNodeNewDefinition.Variable.Name])
                                {
                                    Set<Definition> reachingDefinitionsToRemove = new Set<Definition>();
                                    foreach (Definition reachingDefinition in _methodCompileInfo.ReachingDefinitions[usersOfNewDefinition])
                                    {
                                        if (reachingDefinition.Variable.Name == targetNodeNewDefinition.Variable.Name)
                                        {
                                            reachingDefinitionsToRemove.Add(reachingDefinition);
                                        }
                                    }
                                    _methodCompileInfo.ReachingDefinitions[usersOfNewDefinition] -= reachingDefinitionsToRemove;
                                    _methodCompileInfo.ReachingDefinitions[usersOfNewDefinition].Add(targetNodeNewDefinition);
                                }
                            }

                            IVariableReferenceExpression variableReferenceExpression = expressionToPropagate as IVariableReferenceExpression;
                            if (variableReferenceExpression != null)
                            {
                                _methodCompileInfo.Used[targetNode].Add(variableReferenceExpression.Variable.Name);
                                _methodCompileInfo.UsesOfVariable[variableReferenceExpression.Variable.Name].Add(targetNode);
                            }
                            else
                            {
                                CodeUtility.MatchAndReplaceCode<IVariableReferenceExpression>(expressionToPropagate, delegate(IVariableReferenceExpression expression)
                                {
                                    _methodCompileInfo.Used[targetNode].Add(expression.Variable.Name);
                                    _methodCompileInfo.UsesOfVariable[expression.Variable.Name].Add(targetNode);
                                    return false;
                                }, delegate(IVariableReferenceExpression expression)
                                {
                                    Debug.Fail("This line should never be reached");
                                    return null;
                                }, true);
                            }
                            if (theDefiningNode.FlowControl == FlowControl.Call && targetNode.FlowControl != FlowControl.Throw && targetNode.FlowControl != FlowControl.Return)
                            {
                                targetNode.FlowControl = FlowControl.Call;
                            }

                            // removing the defining node
                            // TODO: Add regression test for when we didn't remove the defining node
                            if (_methodCompileInfo.IsTemporary(theDefinition.Variable) && (!_methodCompileInfo.LiveVariablesOut[targetNode].Contains(theDefinition.Variable.Name)))
                            {
                                EliminateCFGNode(theDefiningNode);
                                removedNodes.Add(theDefiningNode);

                                _methodCompileInfo.DefinitionsOfVariable[v].Remove(theDefiningNode);
                                _methodCompileInfo.Defined[theDefiningNode].Remove(v);
                                foreach (string v2 in _methodCompileInfo.Used[theDefiningNode])
                                {
                                    _methodCompileInfo.UsesOfVariable[v2].Remove(theDefiningNode);
                                }
                                _methodCompileInfo.Used.Remove(theDefiningNode);
                            }
                            changes = true;
                        }
                    }
                }
            } while (changes);

            PerformTransformation(new TransitiveClosureAndTopologicalOrder());
            AnalyzeDefAndUse();
            Liveness();
            ReachingDefinitions();
            AvailableExpressions();
        }
        #endregion

        #region BuildLoopTree
        private void BuildLoopTree()
        {
            Dictionary<CFGNode, List<CFGNode>> loops = new Dictionary<CFGNode, List<CFGNode>>();
            foreach (CFGEdge edge in _methodCompileInfo.DominatorBackEdges)
            {
                List<CFGNode> loopEnds;
                if (!loops.TryGetValue(edge.Target, out loopEnds))
                {
                    loops[edge.Target] = loopEnds = new List<CFGNode>();
                }
                loopEnds.Add(edge.Source);
            }
            LoopTree loopTree = new LoopTree();
            Comparison<CFGNode> comparison = delegate(CFGNode a, CFGNode b)
            {
                return _methodCompileInfo.TopologicalOrder[a].CompareTo(_methodCompileInfo.TopologicalOrder[b]);
            };
            Dictionary<CFGNode, LoopTreeVertex> loopTreeVertexCache = new Dictionary<CFGNode, LoopTreeVertex>();
            foreach (KeyValuePair<CFGNode, List<CFGNode>> pair in loops)
            {
                CFGNode node = pair.Key;
                List<CFGNode> loopEnds = new List<CFGNode>(pair.Value);
                loopEnds.Sort(comparison);
                LoopTreeVertex loopTreeVertex = null;
                if (!loopTreeVertexCache.TryGetValue(node, out loopTreeVertex))
                {
                    loopTreeVertexCache[node] = loopTreeVertex = loopTree.AddVertex(node);
                }
                loopTreeVertex.Ends = loopEnds;
                _methodCompileInfo.Loop[node] = loopTreeVertex;
                foreach (CFGNode loopHeader in loops.Keys)
                {
                    if (_methodCompileInfo.Dominators[loopHeader].Contains(node))
                    {
                        LoopTreeVertex loopTreeVertex2 = null;
                        if (!loopTreeVertexCache.TryGetValue(loopHeader, out loopTreeVertex2))
                        {
                            loopTreeVertexCache[loopHeader] = loopTreeVertex2 = loopTree.AddVertex(loopHeader);
                        }
                        loopTree.AddEdge(loopTreeVertex, loopTreeVertex2);
                    }
                }
            }

            _methodCompileInfo.LoopTree = loopTree;

            if (DebugSettings.Graph)
            {
                QuickGraph.Algorithms.Graphviz.GraphvizAlgorithm renderer = new QuickGraph.Algorithms.Graphviz.GraphvizAlgorithm(loopTree);
                renderer.FormatVertex += new QuickGraph.Algorithms.Graphviz.FormatVertexEventHandler(LoopTreeRenderer_FormatVertex);
                renderer.ImageType = NGraphviz.Helpers.GraphvizImageType.Png;
                renderer.Write("loop-tree.png");
            }
        }

        void LoopTreeRenderer_FormatVertex(object sender, QuickGraph.Algorithms.Graphviz.FormatVertexEventArgs e)
        {
            e.VertexFormatter.Label = ((LoopTreeVertex)e.Vertex).Header.ID.ToString();
        }
        #endregion

        #region Register Allocation
        private class InterferenceGraphNodeInfo
        {
            public InterferenceGraphNode Node;
            public InterferenceGraphNode[] Neighbors;
            public InterferenceGraphNodeInfo(InterferenceGraphNode node)
            {
                Node = node;
                Neighbors = new InterferenceGraphNode[Node.Graph.OutDegree(node)];
                int i = 0;
                foreach (QuickGraph.Concepts.IEdge e in Node.Graph.OutEdges(node))
                {
                    Neighbors[i++] = (InterferenceGraphNode)e.Target;
                }
            }
        }
        private bool RegisterAllocationColor(InterferenceGraph iGraph)
        {
            Dictionary<InterferenceGraphNode, int> coloring = new Dictionary<InterferenceGraphNode, int>();
            foreach (QuickGraph.Concepts.IVertex v in iGraph.Vertices)
            {
                InterferenceGraphNode n = (InterferenceGraphNode)v;
                if (n.Color != 0)
                {
                    continue;
                }
                for (int color = iGraph.PrecoloredNodeCount + 1; color <= _methodCompileInfo.MaxRegisters; color++)
                {
                    bool colorOk = true;
                    foreach (QuickGraph.Concepts.IEdge e in iGraph.OutEdges(v))
                    {
                        InterferenceGraphNode neighbor = ((InterferenceGraphEdge)e).Target;
                        int testColor;
                        if (neighbor.Color == color || (coloring.TryGetValue(neighbor, out testColor) && testColor == color))
                        {
                            colorOk = false;
                            break;
                        }
                    }
                    if (colorOk)
                    {
                        coloring[n] = color;
                        break;
                    }
                }
                if (!coloring.ContainsKey(n))
                {
                    return false; // could not find coloring for this node
                }
            }

            // coloring successful
            foreach (KeyValuePair<InterferenceGraphNode, int> pair in coloring)
            {
                pair.Key.Color = pair.Value;
            }

            return true;
        }
        private Dictionary<VariableReference, Set<VariableReference>> GenerateMoveInformation()
        {
            Dictionary<VariableReference, Set<VariableReference>> moves = new Dictionary<VariableReference, Set<VariableReference>>();

            // TODO: Generate moves

            return moves;
        }
        private void RegisterAllocation()
        {
            InterferenceGraph iGraph = BuildInterferenceGraph();
            if (DebugSettings.Graph)
            {
                new Helpers.InterferenceGraphRenderer(iGraph, _methodCompileInfo).Render("i_cfg_precolored.png", NGraphviz.Helpers.GraphvizImageType.Png);
            }
            Dictionary<VariableReference, Set<VariableReference>> moves = GenerateMoveInformation();

            // TODO: implement freezing and coalescing in register allocator

            // sort nodes by order of degree
            List<InterferenceGraphNode> sortedNodes = new List<InterferenceGraphNode>();
            Dictionary<InterferenceGraphNode, int> degreeMap = new Dictionary<InterferenceGraphNode, int>();
            foreach (QuickGraph.Concepts.IVertex v in iGraph.Vertices)
            {
                InterferenceGraphNode n = (InterferenceGraphNode)v;
                if (n.Color == 0) // make sure n is not precolored
                {
                    sortedNodes.Add(n);
                    degreeMap[n] = iGraph.OutDegree(v);
                }
            }
            Comparison<InterferenceGraphNode> nodeSortComparison = delegate(InterferenceGraphNode a, InterferenceGraphNode b)
            {
                int degreeA = degreeMap[a];
                int degreeB = degreeMap[b];
                if (degreeA > degreeB)
                {
                    return 1;
                }
                else if (degreeB == degreeA)
                {
                    return 0;
                }
                else
                {
                    return -1;
                }
            };
            sortedNodes.Sort(nodeSortComparison);

            Stack<InterferenceGraphNodeInfo> stack = new Stack<InterferenceGraphNodeInfo>();
            Set<CFGNode> roots = _methodCompileInfo.Roots;
            while (sortedNodes.Count > 0)
            {
                // simplify
                if (iGraph.OutDegree(sortedNodes[0]) < _methodCompileInfo.MaxRegisters)
                {
                    stack.Push(new InterferenceGraphNodeInfo(sortedNodes[0]));
                    iGraph.RemoveVertex(sortedNodes[0]);
                    sortedNodes.RemoveAt(0);
                }
                else
                {
                    // TODO: Implement spilling
                    throw new NotImplementedException("Spilling not implemented.");
                }

                while (RegisterAllocationColor(iGraph))
                {
                    if (stack.Count == 0)
                    {
                        break;
                    }
                    InterferenceGraphNodeInfo info = stack.Pop();
                    sortedNodes.Add(info.Node); // TODO: can we insert in the right spot here rather than adding and then searching?
                    sortedNodes.Sort(nodeSortComparison);
                    iGraph.AddVertex(info.Node);
                    foreach (InterferenceGraphNode neighbor in info.Neighbors)
                    {
                        iGraph.AddEdge(neighbor, info.Node);
                        iGraph.AddEdge(info.Node, neighbor);
                    }
                }

                if (stack.Count == 0)
                {
                    break;
                }
            }

            Set<string> parameterNameSet = new Set<string>();
            foreach (ParameterDefinition parameter in _methodCompileInfo.Method.Parameters)
            {
                parameterNameSet.Add(parameter.Name);
            }

            int localCounter = 0; // TODO: Is there any performance advantage in ordering local variables a certain way?
            foreach (InterferenceGraphNode n in iGraph.Vertices)
            {
                if (n.Color == 0)
                {
                    // don't add parameters to the local map
                    if (!parameterNameSet.Contains(n.Variable))
                    {
                        _methodCompileInfo.LocalMap[n.Variable] = localCounter++;
                    }
                }
                else
                {
                    _methodCompileInfo.RegisterMap[n.Variable] = n.Color - 1; // so we can be zero based
                }
            }

            // remove phi functions
            foreach (CFGNode n in _methodCompileInfo.PhiNodes)
            {
                n.BasicBlock.Statements.Clear();
            }
            EliminateEmptyCFGNodes();

            if (DebugSettings.Graph)
            {
                new Helpers.InterferenceGraphRenderer(iGraph, _methodCompileInfo).Render("i_cfg.png", NGraphviz.Helpers.GraphvizImageType.Png);
            }

        }
        private InterferenceGraph BuildInterferenceGraph()
        {
            int precolorCounter = 0;
            Dictionary<string, int> precolorMap = new Dictionary<string, int>();
            foreach (CFGNode phiNode in _methodCompileInfo.PhiNodes)
            {
                Definition phiDefinition = (Definition)phiNode.BasicBlock.Statements[0];
                PhiFunction phiFunction = phiDefinition.Expression as PhiFunction;

                // if any of the variables in this phiFunction are already precolored, use that color to precolor the remaining nodes
                Set<string> varNames = new Set<string>();
                int preColor;
                string varName = ((IVariableReferenceExpression)phiDefinition.Target).Variable.Name;
                if (!precolorMap.TryGetValue(varName, out preColor))
                {
                    preColor = 0;
                }
                varNames.Add(varName);
                foreach (IVariableReferenceExpression variableReferenceExpression in phiFunction.Variables)
                {
                    varName = variableReferenceExpression.Variable.Name;
                    varNames.Add(varName);
                    if (preColor == 0)
                    {
                        if (!precolorMap.TryGetValue(varName, out preColor))
                        {
                            preColor = 0;
                        }
                    }
                }
                if (preColor == 0)
                {
                    preColor = ++precolorCounter;
                }
                foreach (string v in varNames)
                {
                    precolorMap[v] = preColor;
                }
            }
            InterferenceGraph iGraph = new InterferenceGraph();
            iGraph.PrecoloredNodeCount = precolorCounter;
            Dictionary<string, InterferenceGraphNode> nodeMap = new Dictionary<string, InterferenceGraphNode>();
            foreach (Set<string> set in _methodCompileInfo.LiveVariablesOut.Values)
            {
                int precolor;
                foreach (string v1 in set)
                {
                    foreach (string v2 in set)
                    {
                        InterferenceGraphNode n1 = null, n2 = null;
                        if (!nodeMap.TryGetValue(v1, out n1))
                        {
                            n1 = iGraph.AddNode(v1);
                            if (precolorMap.TryGetValue(v1, out precolor))
                            {
                                n1.Color = precolor;
                            }
                            nodeMap[v1] = n1;
                        }
                        if (v1 != v2)
                        {
                            if (!nodeMap.TryGetValue(v2, out n2))
                            {
                                n2 = iGraph.AddNode(v2);
                                if (precolorMap.TryGetValue(v2, out precolor))
                                {
                                    n2.Color = precolor;
                                }
                                nodeMap[v2] = n2;
                            }
                            if (!iGraph.ContainsEdge(n1, n2))
                            {
                                iGraph.AddEdge(n1, n2);
                            }
                        }
                    }
                }
            }
            return iGraph;
        }
        #endregion

        // TODO: Move transformations into separate classes implementing ITransformation interface

        #endregion

        #region Helper

        private static bool TryCast<T>(object o, out T newO) where T : class
        {
            newO = o as T;
            return newO != null;
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
        private bool IsTemporary(string variableName)
        {
            return _methodCompileInfo.IsTemporary(variableName);
        }
        private void FixupRootsAndExceptionHandlingNodes(CFGNode node, CFGNode replacement)
        {
            FixupRootsAndExceptionHandlingNodes(node, (CFGNodeCluster)replacement);
        }

        private void FixupRootsAndExceptionHandlingNodes(CFGNode node, CFGNodeCluster replacement)
        {
            // fix up roots
            if (_methodCompileInfo.Roots.Contains(node))
            {
                _methodCompileInfo.ReplaceRoot(node, replacement.Start);
                _methodCompileInfo.Roots.Remove(node);
                _methodCompileInfo.Roots.Add(replacement.Start);
            }

            // TODO: THIS COMPLETELY MESSES UP TRY/CATCH/FINALLY CLUSTERS!
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                // fix up try blocks start
                if (tryBlockInfo.TryBlock.Start == node)
                {
                    tryBlockInfo.TryBlock.Start = replacement.Start;
                }
                // fix up try block end
                if (tryBlockInfo.TryBlock.End == node)
                {
                    tryBlockInfo.TryBlock.End = replacement.End;//node.Predecessors[0];
                }

                // fix up catch block start
                if (tryBlockInfo.ConsolidatedCatchBlock != null && tryBlockInfo.ConsolidatedCatchBlock.Start == node)
                {
                    tryBlockInfo.ConsolidatedCatchBlock.Start = replacement.Start;
                }

                // fix up catch block end
                if (tryBlockInfo.ConsolidatedCatchBlock != null && tryBlockInfo.ConsolidatedCatchBlock.End == node)
                {
                    tryBlockInfo.ConsolidatedCatchBlock.End = replacement.End;//node.Predecessors[0];
                }

                // fix up finally block start
                if (tryBlockInfo.FinallyBlock != null && tryBlockInfo.FinallyBlock.Start == node)
                {
                    tryBlockInfo.FinallyBlock.Start = replacement.Start;
                }

                // fix up finally block end
                if (tryBlockInfo.FinallyBlock != null && tryBlockInfo.FinallyBlock.End == node)
                {
                    tryBlockInfo.FinallyBlock.End = replacement.End;// node.Predecessors[0];
                }
            }
        }

        #endregion

    }
}
