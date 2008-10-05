using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;

using Mono.Cecil;
using Mono.Cecil.Cil;

using Tenpow.Collections.Generic;

using QuickGraph.Algorithms.Graphviz;
using NGraphviz.Helpers;

namespace XaeiO.Compiler.BackEnds.XaeiOS.Optimization
{
    /// <summary>
    /// Sets up exception handling code in the CFG prior to middle end transformation.
    /// 
    /// Consolidates TryBlockInfos with multiple handlers into one ConsolidatedCatchBlock
    /// Adds code to the end of the ConsolidatedCatchBlock to clear frame[ex] - since the exception has been caught
    /// 
    /// Finds and assigns TryBlockInfo.Parent
    /// 
    /// </summary>
    public class ExceptionHandlingInitializingTransformation : TransformationBase
    {
        private MethodCompileInfo _methodCompileInfo;
        public ExceptionHandlingInitializingTransformation()
            : base(TransformationPhaseOrder.Initial)
        {
            Requires.Add(typeof(TransitiveClosureAndTopologicalOrder));
        }
        public override bool Transform(MethodCompileInfo compileInfo)
        {
            _methodCompileInfo = compileInfo;
            IAssemblyResolver resolver = _methodCompileInfo.Method.DeclaringType.Module.Assembly.Resolver;

            BuildConsolidatedCatchBlocksAndFinallyBlocks();
            BuildTryBlockInfoTree();

            if (DebugSettings.Graph)
            {
                new XaeiO.Compiler.Helpers.CFGRenderer(_methodCompileInfo.CFG, _methodCompileInfo).Render("exception-handling-initializing-transformation.png");
            }

            return true;
        }

        /// <summary>
        /// Merges multiple catch handler into one catch handler with if/then/else logic for the different exception types/filter expressions
        /// Also sets up finally blocks to rethrow the exception that caused the finally block to be executed.
        /// </summary>
        private void BuildConsolidatedCatchBlocksAndFinallyBlocks()
        {
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                // search through all the handlers of this TryBlockInfo looking for catch handlers to consolidate
                List<KeyValuePair<CFGNodeCluster, ExceptionHandler>> catchHandlersToConsolidate = new List<KeyValuePair<CFGNodeCluster, ExceptionHandler>>();
                foreach (KeyValuePair<CFGNodeCluster, ExceptionHandler> handlerInfo in tryBlockInfo.Handlers)
                {
                    if (handlerInfo.Value.Type == ExceptionHandlerType.Catch)
                    {
                        catchHandlersToConsolidate.Add(handlerInfo);
                    }
                    if (handlerInfo.Value.Type == ExceptionHandlerType.Fault || handlerInfo.Value.Type == ExceptionHandlerType.Filter)
                    {
                        throw new NotImplementedException("Fault and Filter exception handler types are not yet supported");
                    }
                }
                if (catchHandlersToConsolidate.Count > 0)
                {
                    // TODO: Save the exception type so that we can do exception handling optimizations in the future
                    CFGNodeCluster consolidatedCatchBlock = new CFGNodeCluster();

                    // create a node to start the consolidated catch block
                    // this variable will also be the node that each exception handler node points to if it's type doesn't match the thrown exception
                    CFGNode previousExceptionHandlingNode = _methodCompileInfo.CFG.AddNode();
                    previousExceptionHandlingNode.AddDebugInfo("Start consolidated catch block");
                    previousExceptionHandlingNode.FlowControl = FlowControl.Branch;
                    consolidatedCatchBlock.Start = previousExceptionHandlingNode;

                    foreach (KeyValuePair<CFGNodeCluster, ExceptionHandler> catchHandlerToConsolidate in catchHandlersToConsolidate)
                    {
                        CFGNode isExceptionTypeNode = _methodCompileInfo.CFG.AddNode();
                        isExceptionTypeNode.FlowControl = FlowControl.ConditionalBranch;
                        ICanCastExpression isExceptionTypeExpression = new CanCastExpression(new FramePropertyReferenceExpression(FrameProperty.Exception), catchHandlerToConsolidate.Value.CatchType);
                        IExpressionStatement isExceptionTypeExpressionStatement = new ConditionalBranchExpressionStatement(isExceptionTypeExpression);
                        isExceptionTypeNode.BasicBlock.Statements.Add(isExceptionTypeExpressionStatement);

                        // if the previous handler couldn't match the exception type, we try this handlers type
                        // so add an edge from the previous handlers type matching failure node, to this type matching node
                        _methodCompileInfo.CFG.AddEdge(previousExceptionHandlingNode, isExceptionTypeNode);

                        // add code to clear frame[ex] after the first node of the catch handler
                        // TODO: Is sucks that rely on the fact that the first node in a catch handler always saves the exception in a temporary variable

                        IAssignStatement clearFrameExStatement = new AssignStatement(new FramePropertyReferenceExpression(FrameProperty.Exception), new NullLiteralExpression());
                        catchHandlerToConsolidate.Key.Start.BasicBlock.Statements.Add(clearFrameExStatement);

                        // branch to the clear frame node and then to the catch handler if the type matches...
                        _methodCompileInfo.CFG.AddEdge(isExceptionTypeNode, catchHandlerToConsolidate.Key.Start, new BranchCondition(BranchConditionType.True, isExceptionTypeExpressionStatement));

                        Debug.Assert(catchHandlerToConsolidate.Key.End.SuccessorCount <= 1, _methodCompileInfo.ToString());


                        if (consolidatedCatchBlock.End == null)
                        {
                            if (catchHandlerToConsolidate.Key.End.SuccessorCount == 0)
                            {
                                consolidatedCatchBlock.End = _methodCompileInfo.CFG.AddNode();
                                consolidatedCatchBlock.End.FlowControl = FlowControl.Return;
                                consolidatedCatchBlock.End.AddDebugInfo("End consolidated catch block");

                                _methodCompileInfo.CFG.AddEdge(catchHandlerToConsolidate.Key.End, consolidatedCatchBlock.End);
                                catchHandlerToConsolidate.Key.End.FlowControl = FlowControl.Branch;
                            }
                            else
                            {
                                consolidatedCatchBlock.End = catchHandlerToConsolidate.Key.End.Successors[0];
                            }
                        }
                        else
                        {
                            if (catchHandlerToConsolidate.Key.End.SuccessorCount == 0)
                            {
                                _methodCompileInfo.CFG.AddEdge(catchHandlerToConsolidate.Key.End, consolidatedCatchBlock.End);
                                catchHandlerToConsolidate.Key.End.FlowControl = FlowControl.Branch;
                            }
                            else
                            {
                                Debug.Assert(catchHandlerToConsolidate.Key.End.Successors[0] == consolidatedCatchBlock.End);
                            }

                        }

                        // branch to the "couldn't match the exception type" node if we couldn't match the exception type
                        previousExceptionHandlingNode = _methodCompileInfo.CFG.AddNode();
                        previousExceptionHandlingNode.FlowControl = FlowControl.Branch;
                        _methodCompileInfo.CFG.AddEdge(isExceptionTypeNode, previousExceptionHandlingNode, new BranchCondition(BranchConditionType.False, isExceptionTypeExpressionStatement));

                        // add some debug info for the CFG renders
                        catchHandlerToConsolidate.Key.Start.AddDebugInfo("Catch handler start");
                        catchHandlerToConsolidate.Key.End.AddDebugInfo("Catch handler end");
                    }

                    Debug.Assert(consolidatedCatchBlock.End != null, _methodCompileInfo.ToString());

                    // create a node that will rethrow the exception if none of the exception types match
                    CFGNode rethrowExceptionNode = _methodCompileInfo.CFG.AddNode();
                    rethrowExceptionNode.BasicBlock.Statements.Add(new ThrowExceptionStatement(new FramePropertyReferenceExpression(FrameProperty.Exception)));
                    rethrowExceptionNode.FlowControl = FlowControl.Throw;

                    // if the last exception handler couldn't match the exception type, we must rethrow.
                    _methodCompileInfo.CFG.AddEdge(previousExceptionHandlingNode, rethrowExceptionNode);

                    tryBlockInfo.ConsolidatedCatchBlock = consolidatedCatchBlock;
                }

                if (tryBlockInfo.FinallyBlock != null)
                {
                    // if an exception caused this finally block to be executed, rethrow that exception at the end of the finally block
                    IBinaryExpression ifAnExceptionExistsBinaryExpression = new BinaryExpression(new FramePropertyReferenceExpression(FrameProperty.Exception), BinaryOperator.IdentityInequality, new NullLiteralExpression());
                    ConditionalBranchExpressionStatement ifAnExpressionExistsConditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(ifAnExceptionExistsBinaryExpression);

                    CFGNode ifAnExceptionExistsNode = _methodCompileInfo.CFG.AddNode(ifAnExpressionExistsConditionalBranchExpressionStatement);
                    ifAnExceptionExistsNode.FlowControl = FlowControl.ConditionalBranch;

                    CFGNode endNode = _methodCompileInfo.CFG.AddNode();

                    CFGNode anExceptionExistsNode = _methodCompileInfo.CFG.AddNode(new ThrowExceptionStatement(new FramePropertyReferenceExpression(FrameProperty.Exception)));
                    anExceptionExistsNode.FlowControl = FlowControl.Throw;
                    _methodCompileInfo.CFG.AddEdge(ifAnExceptionExistsNode, anExceptionExistsNode, new BranchCondition(BranchConditionType.True, ifAnExpressionExistsConditionalBranchExpressionStatement));

                    _methodCompileInfo.CFG.AddEdge(ifAnExceptionExistsNode, endNode, new BranchCondition(BranchConditionType.False, ifAnExpressionExistsConditionalBranchExpressionStatement));

                    // TODO: abstract this edge removal pattern out into a class
                    endNode.FlowControl = tryBlockInfo.FinallyBlock.End.FlowControl;
                    List<CFGEdge> edgesToRemove = new List<CFGEdge>();
                    foreach (CFGEdge finallyBlockOutEdge in _methodCompileInfo.CFG.OutEdges(tryBlockInfo.FinallyBlock.End))
                    {
                        _methodCompileInfo.CFG.AddEdge(endNode, finallyBlockOutEdge.Target, finallyBlockOutEdge.BranchCondition);
                        edgesToRemove.Add(finallyBlockOutEdge);
                    }
                    foreach (CFGEdge edgeToRemove in edgesToRemove)
                    {
                        _methodCompileInfo.CFG.RemoveEdge(edgeToRemove);
                    }
                    _methodCompileInfo.CFG.AddEdge(tryBlockInfo.FinallyBlock.End, ifAnExceptionExistsNode);

                    tryBlockInfo.FinallyBlock.End.FlowControl = FlowControl.Next;
                    tryBlockInfo.FinallyBlock.End = endNode;

                    tryBlockInfo.FinallyBlock.Start.AddDebugInfo("Finally start");
                    tryBlockInfo.FinallyBlock.End.AddDebugInfo("Finally end");
                }

                Debug.Assert(tryBlockInfo.FinallyBlock != null || tryBlockInfo.ConsolidatedCatchBlock != null);
            }
        }

        /// <summary>
        /// Determines the hierarchy of try/catch/finally blocks
        /// </summary>
        private void BuildTryBlockInfoTree()
        {
            /**
             * We need to find the parent try/catch/finally for each try/catch/finally we have.
             * The basic idea to search through the dominators of the starting nodes of each try block.
             * If we find a dominator node that starts a try, catch, or finally block, the corresponding TryBlockInfo is our parent.
             * If we find multiple dominator nodes that meet that criteria, the one with the greatest topological order wins.
             * This ensures that our parent TryBlockInfo is really our parent TryBlockInfo and not our grandparent TryBlockInfo.
             */

            #region build a cache of the starting nodes of each try, catch, finally block
            Dictionary<CFGNode, TryBlockInfo> tryBlockStarts = new Dictionary<CFGNode, TryBlockInfo>();
            Dictionary<CFGNode, TryBlockInfo> catchBlockStarts = new Dictionary<CFGNode, TryBlockInfo>();
            Dictionary<CFGNode, TryBlockInfo> finallyBlockStarts = new Dictionary<CFGNode, TryBlockInfo>();

            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                tryBlockStarts.Add(tryBlockInfo.TryBlock.Start, tryBlockInfo);
                if (tryBlockInfo.ConsolidatedCatchBlock != null)
                {
                    catchBlockStarts.Add(tryBlockInfo.ConsolidatedCatchBlock.Start, tryBlockInfo);
                }
                if (tryBlockInfo.FinallyBlock != null)
                {
                    finallyBlockStarts.Add(tryBlockInfo.FinallyBlock.Start, tryBlockInfo);
                }
            }
            #endregion

            #region find dominators of each try block starting node in order to build tree of tryBlockInfos
            foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
            {
                TryBlockInfoParent currentTryBlockInfoParent = null;
                CFGNode currentTryBlockInfoParentNode = null;
                foreach (CFGNode dominator in _methodCompileInfo.Dominators[tryBlockInfo.TryBlock.Start])
                {
                    if (dominator == tryBlockInfo.TryBlock.Start)
                    {
                        // dominator is the node we're currently visiting, skip it
                        continue;
                    }
                    TryBlockInfo possibleParentTryBlockInfo;
                    if (tryBlockStarts.TryGetValue(dominator, out possibleParentTryBlockInfo))
                    {
                        if (currentTryBlockInfoParentNode == null || (_methodCompileInfo.TopologicalOrder[dominator] > _methodCompileInfo.TopologicalOrder[currentTryBlockInfoParentNode]))
                        {
                            currentTryBlockInfoParent = new TryBlockInfoParent(possibleParentTryBlockInfo, TryBlockInfoParentType.Try);
                            currentTryBlockInfoParentNode = dominator;
                        }
                    }
                    else if (catchBlockStarts.TryGetValue(dominator, out possibleParentTryBlockInfo))
                    {
                        if (currentTryBlockInfoParentNode == null || (_methodCompileInfo.TopologicalOrder[dominator] > _methodCompileInfo.TopologicalOrder[currentTryBlockInfoParentNode]))
                        {
                            currentTryBlockInfoParent = new TryBlockInfoParent(possibleParentTryBlockInfo, TryBlockInfoParentType.Catch);
                            currentTryBlockInfoParentNode = dominator;
                        }
                    }
                    else if (finallyBlockStarts.TryGetValue(dominator, out possibleParentTryBlockInfo))
                    {
                        if (currentTryBlockInfoParentNode == null || (_methodCompileInfo.TopologicalOrder[dominator] > _methodCompileInfo.TopologicalOrder[currentTryBlockInfoParentNode]))
                        {
                            currentTryBlockInfoParent = new TryBlockInfoParent(possibleParentTryBlockInfo, TryBlockInfoParentType.Finally);
                            currentTryBlockInfoParentNode = dominator;
                        }
                    }
                }

                if (currentTryBlockInfoParent != null)
                {
                    if (tryBlockInfo.Parent != null)
                    {
                        // we already have a parent!
                        // only reassign if this parent topologically follows the existing parent
                        // TODO: Maybe we can check that existing parent does not dominate proposed
                        if (_methodCompileInfo.TopologicalOrder[currentTryBlockInfoParent.TryBlockInfo.TryBlock.Start] >
                            _methodCompileInfo.TopologicalOrder[tryBlockInfo.Parent.TryBlockInfo.TryBlock.Start])
                        {
                            tryBlockInfo.Parent = currentTryBlockInfoParent;
                        }
                    }
                    else
                    {
                        tryBlockInfo.Parent = currentTryBlockInfoParent;
                    }
                }
            }
            #endregion

            if (DebugSettings.AnyGraph)
            {
                #region build a graph to visualize the tryBlockInfo tree
                TryBlockInfoTree tryBlockInfoTree = new TryBlockInfoTree();

                // build vertices
                Dictionary<TryBlockInfo, TryBlockInfoTreeVertex> tryBlockInfoVertexMap = new Dictionary<TryBlockInfo, TryBlockInfoTreeVertex>();
                foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
                {
                    TryBlockInfoTreeVertex v = tryBlockInfoTree.AddVertex();
                    v.TryBlockInfo = tryBlockInfo;
                    tryBlockInfoVertexMap[tryBlockInfo] = v;
                }

                // now add edges from parent to child
                foreach (TryBlockInfo tryBlockInfo in _methodCompileInfo.TryBlockInfos)
                {
                    if (tryBlockInfo.Parent != null)
                    {
                        TryBlockInfoTreeVertex child = tryBlockInfoVertexMap[tryBlockInfo];
                        TryBlockInfoParent tryBlockInfoParent = tryBlockInfo.Parent;
                        TryBlockInfoTreeVertex parent = tryBlockInfoVertexMap[tryBlockInfoParent.TryBlockInfo];
                        TryBlockInfoTreeEdge edge = tryBlockInfoTree.AddEdge(parent, child);
                        edge.Type = tryBlockInfoParent.Type;
                    }
                }

                TryBlockInfoTreeRenderer renderer = new TryBlockInfoTreeRenderer(tryBlockInfoTree, _methodCompileInfo);
                renderer.Render("tryBlockInfoTree.png", GraphvizImageType.Png);
                #endregion
            }
        }
    }
}
