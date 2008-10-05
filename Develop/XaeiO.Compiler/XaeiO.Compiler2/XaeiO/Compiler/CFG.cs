using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

using QuickGraph;
using QuickGraph.Concepts;
using QuickGraph.Representations;
using QuickGraph.Concepts.Providers;
using QuickGraph.Collections;

namespace XaeiO.Compiler
{
    public class CFG : AdjacencyGraph
    {
        private CFGNode _root;
        public CFGNode Root
        {
            get { return _root; }
            set { _root = value; }
        }

        public CFGNode[] Successors(CFGNode node)
        {
            List<CFGNode> nodes = new List<CFGNode>();
            EdgeCollection edges = this.OutEdges(node);
            foreach (IEdge edge in edges)
            {
                CFGNode targetNode = (CFGNode)edge.Target;
                if (!nodes.Contains(targetNode))
                {
                    nodes.Add(targetNode);
                }
            }
            return nodes.ToArray();
        }

        private class InEdgePredicate : QuickGraph.Concepts.Predicates.IEdgePredicate
        {
            private CFGNode Target;
            public InEdgePredicate(CFGNode target)
            {
                Target = target;
            }


            #region IEdgePredicate Members

            public bool Test(IEdge e)
            {
                return e.Target == Target;
            }

            #endregion
        }
        public CFGNode[] Predecessors(CFGNode node)
        {
            List<CFGNode> nodes = new List<CFGNode>();
            EdgeCollection edges = InEdges(node);
            foreach (IEdge edge in edges)
            {
                CFGNode sourceNode = (CFGNode)edge.Source;
                if (!nodes.Contains(sourceNode))
                {
                    nodes.Add(sourceNode);
                }
            }
            return nodes.ToArray();
        }

        // TODO: Cache data in CFG (cache is cleared when an edge or node is added or removed)

        public EdgeCollection InEdges(CFGNode node)
        {
            FilteredEdgeEnumerable edges = this.SelectEdges(new InEdgePredicate(node));
            return new EdgeCollection(edges);
        }

        public CFG()
            : base(new CFGNodeProvider(), new CFGEdgeProvider(), false)
        {
            ((CFGNodeProvider)VertexProvider).Graph = this;
        }


        public CFGNode AddNode()
        {
            CFGNode newNode = (CFGNode)base.AddVertex();
            if (_root == null)
            {
                _root = newNode;
            }
            return newNode;
        }

        public CFGNode AddNode(IStatement statement)
        {
            return AddNode(statement, FlowControl.Next);
        }

        public CFGNode AddNode(IStatement statement, FlowControl flowControl)
        {
            CFGNode node = AddNode();
            node.BasicBlock.Statements.Add(statement);
            node.FlowControl = flowControl;
            return node;
        }


        public CFGEdge AddEdge(CFGNodeCluster sourceCluster, CFGNode target, BranchConditionType conditionType)
        {
            return AddEdge(sourceCluster.End, target, conditionType);
        }

        public CFGEdge AddEdge(CFGNode source, CFGNodeCluster targetCluster, BranchConditionType conditionType)
        {
            return AddEdge(source, targetCluster.Start, conditionType);
        }

        public CFGEdge AddEdge(CFGNodeCluster sourceCluster, CFGNodeCluster targetCluster, BranchConditionType conditionType)
        {
            return AddEdge(sourceCluster.End, targetCluster.Start, conditionType);
        }

        public CFGEdge AddEdge(CFGNodeCluster sourceCluster, CFGNodeCluster targetCluster, BranchCondition condition)
        {
            return AddEdge(sourceCluster.End, targetCluster.Start, condition);
        }

        public CFGEdge AddEdge(CFGNodeCluster sourceCluster, CFGNodeCluster targetCluster)
        {
            return AddEdge(sourceCluster.End, targetCluster.Start);
        }

        public CFGEdge AddEdge(CFGNode source, CFGNodeCluster targetCluster)
        {
            return AddEdge(source, targetCluster.Start);
        }

        public CFGEdge AddEdge(CFGNodeCluster sourceCluster, CFGNode target)
        {
            return AddEdge(sourceCluster.End, target);
        }

        public CFGEdge AddEdge(CFGNode source, CFGNode target)
        {
            return (CFGEdge)base.AddEdge(source, target);
        }

        public CFGEdge AddEdge(CFGNode source, CFGNode target, BranchConditionType conditionType)
        {
            return AddEdge(source, target, new BranchCondition(conditionType));
        }

        public CFGEdge AddEdge(CFGNode source, CFGNode target, BranchCondition condition)
        {
            CFGEdge edge = (CFGEdge)base.AddEdge(source, target);
            edge.BranchCondition = condition;
            return edge;
        }

        public void InsertAfter(CFGNode node, CFGNode insertAfterMe)
        {
            // all out edges of insertAfterMe become out edges of node
            List<CFGEdge> edgesToRemove = new List<CFGEdge>();
            foreach (CFGEdge outEdge in OutEdges(insertAfterMe))
            {
                AddEdge(node, outEdge.Target, outEdge.BranchCondition);
                edgesToRemove.Add(outEdge);
            }
            foreach (CFGEdge edgeToRemove in edgesToRemove)
            {
                RemoveEdge(edgeToRemove);
            }

            // now add an edge from insertAfterme to node
            AddEdge(insertAfterMe, node, BranchConditionType.Unconditional);
        }

        private class CFGNodeProvider : IVertexProvider
        {
            private int IdCounter = 0;
            public CFG Graph;
            #region IVertexProvider Members

            public QuickGraph.Concepts.IVertex ProvideVertex()
            {
                return new CFGNode(IdCounter++, Graph);
            }

            public void UpdateVertex(QuickGraph.Concepts.IVertex v)
            {
                v.ID = IdCounter++;
            }

            public Type VertexType
            {
                get { return typeof(CFGNode); }
            }

            #endregion
        }

        private class CFGEdgeProvider : IEdgeProvider
        {

            private int IdCounter = 0;
            #region IEdgeProvider Members

            public Type EdgeType
            {
                get { return typeof(CFGEdge); }
            }

            public QuickGraph.Concepts.IEdge ProvideEdge(QuickGraph.Concepts.IVertex u, QuickGraph.Concepts.IVertex v)
            {
                return new CFGEdge(IdCounter++, (CFGNode)u, (CFGNode)v);
            }

            public void UpdateEdge(QuickGraph.Concepts.IEdge v)
            {
                v.ID = IdCounter++;
            }

            #endregion
        }
    }

    public class CFGNode : Vertex
    {

        public string DebugInfo
        {
            get;
            private set;
        }

        private FlowControl _flowControl = FlowControl.Next;
        public FlowControl FlowControl
        {
            get { return _flowControl; }
            set { _flowControl = value; }
        }

        public BasicBlock BasicBlock
        {
            get
            {
                return _basicBlock;
            }
            set
            {
                _basicBlock = value;
            }
        }
        private BasicBlock _basicBlock = new BasicBlock();

        public CFGNode[] Successors
        {
            get
            {
                return Graph.Successors(this);
            }
        }

        public int SuccessorCount
        {
            get
            {
                return Graph.OutDegree(this);
            }
        }

        public CFGNode[] Predecessors
        {
            get
            {
                return Graph.Predecessors(this);
            }
        }

        public int PredecessorCount
        {
            get
            {
                return Graph.InEdges(this).Count;
            }
        }

        public CFG Graph
        {
            get;
            set;
        }

        public CFGNode(int id, CFG graph)
            : base(id)
        {
            if (graph == null)
            {
                throw new ArgumentNullException();
            }
            Graph = graph;
        }

        public override string ToString()
        {
            return this.ID + ": " + BasicBlock.ToString();
        }
        public override int GetHashCode()
        {
            return ID;
        }

        public bool TryGetDefinition(out Definition definition)
        {
            if (BasicBlock.Statements.Count == 0)
            {
                definition = null;
                return false;
            }
            definition = BasicBlock.Statements[0] as Definition;
            return definition != null;
        }

        public void AddDebugInfo(string s)
        {
            if (DebugInfo == null)
            {
                DebugInfo = s;
            }
            else
            {
                DebugInfo += "\n" + s;
            }
        }
    }

    public class CFGEdge : Edge
    {
        public new CFGNode Source
        {
            get
            {
                return (CFGNode)base.Source;
            }
        }

        public new CFGNode Target
        {
            get
            {
                return (CFGNode)base.Target;
            }
        }

        private BranchCondition _branchCondition = new BranchCondition();
        public BranchCondition BranchCondition
        {
            get { return _branchCondition; }
            set { _branchCondition = value; }
        }

        public CFGEdge(int id, CFGNode from, CFGNode to)
            : base(id, from, to)
        {
        }

        public override string ToString()
        {
            return BranchCondition.Type.ToString();
        }
    }

    public class CFGNodeCluster : ICloneable
    {
        private CFGNode _start;

        public CFGNode Start
        {
            get { return _start; }
            set { _start = value; }
        }
        private CFGNode _end;

        public CFGNode End
        {
            get { return _end; }
            set { _end = value; }
        }

        public CFGNodeCluster(CFGNode start, CFGNode end)
        {
            _start = start;
            _end = end;
        }

        public CFGNodeCluster()
        {
        }

        public CFGNodeCluster(CFGNodeCluster start, CFGNodeCluster end)
        {
            _start = start.Start;
            _end = end.End;
        }

        public static explicit operator CFGNode(CFGNodeCluster c)
        {
            return c.Start;
        }

        public static explicit operator CFGNodeCluster(CFGNode n)
        {
            return new CFGNodeCluster(n, n);
        }

        public object Clone()
        {
            return new CFGNodeCluster(Start, End);
        }
    }
}
