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
    public class InterferenceGraph : AdjacencyGraph
    {
        public InterferenceGraph()
            : base(new InterferenceGraphNodeProvider(), new InterferenceGraphEdgeProvider(), false)
        {
            ((InterferenceGraphNodeProvider)VertexProvider).Graph = this;
        }

        private int _precoloredNodeCount;

        public int PrecoloredNodeCount
        {
            get { return _precoloredNodeCount; }
            set { _precoloredNodeCount = value; }
        }


        public InterferenceGraphNode AddNode()
        {
            return (InterferenceGraphNode)base.AddVertex();
        }

        public InterferenceGraphNode AddNode(string v)
        {
            InterferenceGraphNode node = AddNode();
            node.Variable = v;
            return node;
        }

        public InterferenceGraphNode AddNode(string v, int color)
        {
            InterferenceGraphNode node = AddNode();
            node.Variable = v;
            node.Color = color;
            return node;
        }

        public InterferenceGraphEdge AddEdge(InterferenceGraphNode source, InterferenceGraphNode target)
        {
            return (InterferenceGraphEdge)base.AddEdge(source, target);
        }


        private class InterferenceGraphNodeProvider : IVertexProvider
        {
            private int IdCounter = 0;
            public InterferenceGraph Graph;
            #region IVertexProvider Members

            public QuickGraph.Concepts.IVertex ProvideVertex()
            {
                return new InterferenceGraphNode(IdCounter++, Graph);
            }

            public void UpdateVertex(QuickGraph.Concepts.IVertex v)
            {
            }

            public Type VertexType
            {
                get { return typeof(InterferenceGraphNode); }
            }

            #endregion
        }

        private class InterferenceGraphEdgeProvider : IEdgeProvider
        {

            private int IdCounter = 0;
            #region IEdgeProvider Members

            public Type EdgeType
            {
                get { return typeof(InterferenceGraphEdge); }
            }

            public QuickGraph.Concepts.IEdge ProvideEdge(QuickGraph.Concepts.IVertex u, QuickGraph.Concepts.IVertex v)
            {
                return new InterferenceGraphEdge(IdCounter++, (InterferenceGraphNode)u, (InterferenceGraphNode)v);
            }

            public void UpdateEdge(QuickGraph.Concepts.IEdge v)
            {
            }

            #endregion
        }
    }

    public class InterferenceGraphNode : Vertex
    {
        public InterferenceGraph Graph
        {
            get;
            set;
        }

        public string Variable
        {
            get;
            set;
        }

        public int Color
        {
            get;
            set;
        }

        public InterferenceGraphNode(int id, InterferenceGraph graph)
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
            return Variable;
        }

        public override int GetHashCode()
        {
            return ID;
        }
    }

    public class InterferenceGraphEdge : Edge
    {
        public new InterferenceGraphNode Source
        {
            get
            {
                return (InterferenceGraphNode)base.Source;
            }
        }

        public new InterferenceGraphNode Target
        {
            get
            {
                return (InterferenceGraphNode)base.Target;
            }
        }
        public InterferenceGraphEdge(int id, InterferenceGraphNode from, InterferenceGraphNode to)
            : base(id, from, to)
        {
        }

        public override string ToString()
        {
            return "{" + Source.ToString() + ", " + Target.ToString() + "}";
        }
    }
}
