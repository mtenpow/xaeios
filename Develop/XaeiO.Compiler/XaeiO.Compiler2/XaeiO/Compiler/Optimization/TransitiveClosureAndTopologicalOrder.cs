using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Providers;
using QuickGraph.Concepts;
using QuickGraph.Concepts.Algorithms;
using QuickGraph.Concepts.Traversals;
using QuickGraph.Concepts.Collections;
using QuickGraph.Concepts.MutableTraversals;
using QuickGraph.Collections;
using QuickGraph.Collections.Sort;
using QuickGraph.Algorithms.Graphviz;
using QuickGraph.Algorithms;
using QuickGraph.Exceptions;

using NGraphviz.Helpers;

using XaeiO.Compiler.Graph;
using XaeiO.Compiler.Helpers;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Optimization
{
    public class TransitiveClosureAndTopologicalOrder : TransformationBase
    {
        private MethodCompileInfo _methodCompileInfo;
        private CFG _cfg;
        private CFGRenderer _cfgRenderer;

        public bool BuildTransitiveClosure
        {
            get;
            set;
        }
        public bool BuildTopologicalOrder
        {
            get;
            set;
        }

        public TransitiveClosureAndTopologicalOrder(bool buildTransitiveClosure, bool buildTopologicalOrder)
        {
            Requires.Add(typeof(DominatorAnalysis));
            BuildTransitiveClosure = buildTransitiveClosure;
            BuildTopologicalOrder = buildTopologicalOrder;
        }

        public TransitiveClosureAndTopologicalOrder()
            : this(true, true)
        {
        }

        public override bool Transform(MethodCompileInfo compileInfo)
        {
            _methodCompileInfo = compileInfo;
            _cfg = _methodCompileInfo.CFG;

            if (DebugSettings.AnyGraph)
            {
                _cfgRenderer = new CFGRenderer(_cfg, _methodCompileInfo);
            }

            if (DebugSettings.Graph)
            {
                _cfgRenderer.Render("before-forward-only-cfg.png");
            }

            TransitiveClosureAlgorithm algorithm;
            GraphvizAlgorithm renderer;

            /* Commented out because the only place the full transitive closure is used is in BasicMiddleEnd::EliminateUnconditionalBranches
             * I think the forward only transitive closure works just fine there
            if (BuildTransitiveClosure)
            {
                algorithm = new TransitiveClosureAlgorithm(_cfg);
                TransitiveClosureGraph<CFGNode> transitiveClosure = new TransitiveClosureGraph<CFGNode>();
                algorithm.InitTransitiveClosureVertex += new TransitiveClosureVertexEventHandler(InitTransitiveClosureVertex);
                algorithm.Create(transitiveClosure);

                _methodCompileInfo.TransitiveClosure = new DynamicDictionary<CFGNode, Set<CFGNode>>();
                foreach (TransitiveClosureGraphVertex<CFGNode> tcVertex in transitiveClosure.Vertices)
                {
                    foreach (QuickGraph.Concepts.IEdge edge in transitiveClosure.OutEdges(tcVertex))
                    {
                        _methodCompileInfo.TransitiveClosure[tcVertex.MappedVertex].Add(((TransitiveClosureGraphVertex<CFGNode>)edge.Target).MappedVertex);
                    }
                }
            }*/

            List<CFGEdge> removedEdges = new List<CFGEdge>();
            if (BuildTopologicalOrder)
            {
                // remove back edges to generate forward only transitive closures and topological order
                _methodCompileInfo.DominatorBackEdges.Clear();
                foreach (CFGEdge edge in _cfg.Edges)
                {
                    bool isDominatorBackEdge = IsDominatorBackEdge(edge);
                    if (isDominatorBackEdge || edge.BranchCondition.Type == BranchConditionType.ExceptionThrown)
                    {
                        removedEdges.Add(edge);
                        if (isDominatorBackEdge)
                        {
                            _methodCompileInfo.DominatorBackEdges.Add(edge);
                        }
                    }
                }
                foreach (CFGEdge edge in removedEdges)
                {
                    _cfg.RemoveEdge(edge);
                }

                do
                {
                    try
                    {
                        AlgoUtility.CheckAcyclic(_cfg);
                        break;
                    }
                    catch (NonAcyclicGraphException e)
                    {
                        foreach (CFGEdge edge in _cfg.Edges)
                        {
                            if (edge.Source.FlowControl != FlowControl.Next && AlgoUtility.IsReachable(edge.Target, edge.Source, _cfg))
                            {
                                removedEdges.Add(edge);
                                _cfg.RemoveEdge(edge);
                                break;
                            }
                        }
                    }
                } while (true);
                
                if (DebugSettings.Graph)
                {
                    _cfgRenderer.Render("forward-only-cfg.png");
                }

                TopologicalSortAlgorithm topologicalSortAlgorithm = new TopologicalSortAlgorithm(_cfg);
                topologicalSortAlgorithm.Compute();
                _methodCompileInfo.TopologicalOrder = new Dictionary<CFGNode, int>();
                _methodCompileInfo.TopologicalSort = new List<CFGNode>(topologicalSortAlgorithm.SortedVertices.Count);
                for (int i = 0; i < topologicalSortAlgorithm.SortedVertices.Count; i++)
                {
                    _methodCompileInfo.TopologicalSort.Add((CFGNode)topologicalSortAlgorithm.SortedVertices[i]);
                    _methodCompileInfo.TopologicalOrder[(CFGNode)topologicalSortAlgorithm.SortedVertices[i]] = i;
                }
                // TODO: optimize algorithms throughout that foolishly go through edge/node lists twice in order to accomplish something because the collection can't be altered in a foreach
            }

            if (BuildTransitiveClosure)
            {
                algorithm = new TransitiveClosureAlgorithm(_cfg);
                TransitiveClosureGraph<CFGNode> forwardOnlyTransitiveClosure = new TransitiveClosureGraph<CFGNode>(_methodCompileInfo);
                algorithm.InitTransitiveClosureVertex += new TransitiveClosureVertexEventHandler(InitTransitiveClosureVertex);
                algorithm.Create(forwardOnlyTransitiveClosure);

                _methodCompileInfo.ForwardOnlyTransitiveClosure = new DynamicDictionary<CFGNode, Set<CFGNode>>();
                foreach (KeyValuePair<TransitiveClosureGraphVertex<CFGNode>, TransitiveClosureGraphVertex<CFGNode>> edge in forwardOnlyTransitiveClosure.Edges)
                {
                    _methodCompileInfo.ForwardOnlyTransitiveClosure[edge.Key.MappedVertex].Add(edge.Value.MappedVertex);
                }
                /*
                foreach (TransitiveClosureGraphVertex<CFGNode> tcVertex in forwardOnlyTransitiveClosure.Vertices)
                {
                    foreach (IEdge edge in forwardOnlyTransitiveClosure.OutEdges(tcVertex))
                    {
                        _methodCompileInfo.ForwardOnlyTransitiveClosure[tcVertex.MappedVertex].Add(((TransitiveClosureGraphVertex<CFGNode>)edge.Target).MappedVertex);
                    }
                }*/
            }

            // reinsert removed edges
            foreach (CFGEdge edge in removedEdges)
            {
                _cfg.AddEdge(edge);
            }

            // if we're not building both the transitive closure and topological order, this transformation does not achieve consistency
            return BuildTransitiveClosure && BuildTopologicalOrder;
        }

        private bool IsDominatorBackEdge(CFGEdge e)
        {
            return _methodCompileInfo.Dominators[e.Source].Contains(e.Target);
        }

        private void FormatVertex(object sender, FormatVertexEventArgs e)
        {
            e.VertexFormatter.Label = ((TransitiveClosureGraphVertex<CFGNode>)e.Vertex).MappedVertex.ID.ToString();
        }

        private void InitTransitiveClosureVertex(object sender, TransitiveClosureVertexEventArgs arg)
        {
            TransitiveClosureGraphVertex<CFGNode> transformationVertex = (TransitiveClosureGraphVertex<CFGNode>)arg.VertexInTransformationGraph;
            transformationVertex.MappedVertex = (CFGNode)arg.VertexInOriginalGraph;
        }

        private class TransitiveClosureGraph<T> : AdjacencyGraphBase<TransitiveClosureGraphVertex<T>> where T : IVertex
        {
            MethodCompileInfo _methodCompileInfo;
            public new List<KeyValuePair<TransitiveClosureGraphVertex<CFGNode>, TransitiveClosureGraphVertex<CFGNode>>> Edges
            {
                get;
                private set;
            }
            public TransitiveClosureGraph(MethodCompileInfo methodCompileInfo)
            {
                _methodCompileInfo = methodCompileInfo;
                Edges = new List<KeyValuePair<TransitiveClosureGraphVertex<CFGNode>, TransitiveClosureGraphVertex<CFGNode>>>();
            }

            public override IEdge AddEdge(IVertex source, IVertex target)
            {
                Edges.Add(new KeyValuePair<TransitiveClosureGraphVertex<CFGNode>, TransitiveClosureGraphVertex<CFGNode>>((TransitiveClosureGraphVertex<CFGNode>)source, (TransitiveClosureGraphVertex<CFGNode>)target));
                return null;
            }
        }

        private class TransitiveClosureGraphVertex<T> : Vertex where T : IVertex
        {
            private T _mappedVertex;

            public T MappedVertex
            {
                get { return _mappedVertex; }
                set { _mappedVertex = value; }
            }

            public TransitiveClosureGraphVertex()
            {
            }

            public TransitiveClosureGraphVertex(int id)
                : base(id)
            {
            }
        }
    }
}
