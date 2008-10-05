using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Concepts.Providers;

namespace XaeiO.Compiler
{
    public class CFGPattern : AdjacencyGraph
    {
        private List<Predicate<CFGNode>> _predicates = new List<Predicate<CFGNode>>();
        public List<Predicate<CFGNode>> Predicates
        {
            get { return _predicates; }
            set { _predicates = value; }
        }

        private CFGPatternMatchFlags? _specialFlags;
        public CFGPatternMatchFlags? SpecialFlags
        {
            get { return _specialFlags; }
            set { _specialFlags = value; }
        }

        private CFGPatternNode _root;
        public CFGPatternNode Root
        {
            get { return _root; }
            set { _root = value; }
        }

        public CFGPatternEdge AddEdge(CFGPatternNode source, CFGPatternNode target, BranchConditionType conditionType)
        {
            return AddEdge(source, target, new BranchCondition(conditionType));
        }

        public CFGPatternEdge AddEdge(CFGPatternNode source, CFGPatternNode target, BranchCondition condition)
        {
            CFGPatternEdge edge = (CFGPatternEdge)base.AddEdge(source, target);
            edge.BranchCondition = condition;
            return edge;
        }

        public CFGPatternNode AddNode()
        {
            return (CFGPatternNode)base.AddVertex();
        }

        public CFGPattern()
            : base(new CFGPatternNodeProvider(), new CFGPatternEdgeProvider(), false)
        {
            ((CFGPatternNodeProvider)this.VertexProvider).Pattern = this;
        }

        private class CFGPatternNodeProvider : IVertexProvider
        {
            private int IdCounter = 0;
            public CFGPattern Pattern;
            public CFGPatternNodeProvider()
            {
            }
            #region IVertexProvider Members

            public QuickGraph.Concepts.IVertex ProvideVertex()
            {
                return new CFGPatternNode(IdCounter++, Pattern);
            }

            public void UpdateVertex(QuickGraph.Concepts.IVertex v)
            {
                throw new Exception("The method or operationInfo is not implemented.");
            }

            public Type VertexType
            {
                get { return typeof(CFGPatternNode); }
            }

            #endregion
        }

        private class CFGPatternEdgeProvider : IEdgeProvider
        {

            private int IdCounter = 0;
            #region IEdgeProvider Members

            public Type EdgeType
            {
                get { return typeof(CFGPatternEdge); }
            }

            public QuickGraph.Concepts.IEdge ProvideEdge(QuickGraph.Concepts.IVertex u, QuickGraph.Concepts.IVertex v)
            {
                return new CFGPatternEdge(IdCounter++, (CFGPatternNode)u, (CFGPatternNode)v);
            }

            public void UpdateEdge(QuickGraph.Concepts.IEdge v)
            {
                throw new Exception("The method or operationInfo is not implemented.");
            }

            #endregion
        }
        public virtual bool Match(CFG graph, CFGPatternMatchFlags flags)
        {
            return Root.Match(graph.Root, flags);
        }
    }
    public class CFGPatternNode : Vertex
    {
        private CFGPatternMatchFlags? _specialFlags;
        public CFGPatternMatchFlags? SpecialFlags
        {
            get { return _specialFlags; }
            set { _specialFlags = value; }
        }

        private FlowControl? _flowControl;

        public FlowControl? FlowControl
        {
            get { return _flowControl; }
            set { _flowControl = value; }
        }

        private List<Predicate<CFGNode>> _predicates = new List<Predicate<CFGNode>>();
        public List<Predicate<CFGNode>> Predicates
        {
            get { return _predicates; }
            set { _predicates = value; }
        }
        
        private CFGPattern _pattern;
        public CFGPattern Pattern
        {
            get { return _pattern; }
        }

        public virtual bool Match(CFGNode node, CFGPatternMatchFlags flags)
        {
            CFGPatternMatchFlags currentFlags = SpecialFlags == null ? SpecialFlags.Value : flags;
            if (FlowControl != null)
            {
                if (FlowControl.Value != node.FlowControl)
                {
                    return false;
                }
            }
            foreach (Predicate<CFGNode> predicate in Predicates)
            {
                if (!predicate(node))
                {
                    return false;
                }
            }
            if ((currentFlags & CFGPatternMatchFlags.PerfectMatch) > 0)
            {

                if (Pattern.OutDegree(this) != node.Graph.OutDegree(node))
                {
                    return false;
                }
            }

            // find a match for each edge
            List<CFGPatternEdge> patternEdges = new List<CFGPatternEdge>();
            foreach (QuickGraph.Concepts.IEdge edge in this.Pattern.OutEdges(this))
            {
                patternEdges.Add((CFGPatternEdge)edge);
            }
            List<CFGEdge> edges = new List<CFGEdge>();
            foreach (QuickGraph.Concepts.IEdge edge in node.Graph.OutEdges(node))
            {
                edges.Add((CFGEdge)edge);
            }
            while (patternEdges.Count > 0)
            {
                foreach (CFGPatternEdge patternEdge in patternEdges)
                {
                    bool foundMatch = false;
                    foreach (CFGEdge edge in edges)
                    {
                        if (patternEdge.Match(edge, flags))
                        {
                            foundMatch = true;
                            patternEdges.Remove(patternEdge);
                            edges.Remove(edge);
                            break;
                        }
                    }
                    if (!foundMatch)
                    {
                        return false;
                    }
                }
            }

            return true;
        }
        
        internal CFGPatternNode(int id, CFGPattern pattern) : base(id)
        {
            _pattern = pattern;
        }
    }
    public class CFGPatternEdge : Edge
    {
        private CFGPatternMatchFlags? _specialFlags;
        public CFGPatternMatchFlags? SpecialFlags
        {
            get { return _specialFlags; }
            set { _specialFlags = value; }
        }

        private BranchCondition _branchCondition;
        public BranchCondition BranchCondition
        {
            get { return _branchCondition; }
            set { _branchCondition = value; }
        }


        private CFGPattern _pattern;
        public CFGPattern Pattern
        {
            get { return _pattern; }
        }

        internal CFGPatternEdge(int id, CFGPatternNode source, CFGPatternNode target) : base(id, source, target)
        {
        }

        public virtual bool Match(CFGEdge edge, CFGPatternMatchFlags flags)
        {
            throw new NotImplementedException();
        }
    }

    [Flags]
    public enum CFGPatternMatchFlags
    {
        PartialMatch,
        PerfectMatch
    }
}
