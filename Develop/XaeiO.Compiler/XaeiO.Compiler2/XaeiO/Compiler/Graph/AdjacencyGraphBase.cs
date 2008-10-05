using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Providers;
using QuickGraph.Concepts;
using QuickGraph.Concepts.Providers;

namespace XaeiO.Compiler.Graph
{
    public abstract class AdjacencyGraphBase<V, E> : AdjacencyGraph where V : IVertex, new() where E : IEdge, new()
    {
        public AdjacencyGraphBase()
            : base(new VertexProvider(), new EdgeProvider(), false)
        {
        }

        public new V AddVertex()
        {
            return (V)base.AddVertex();
        }

        public E AddEdge(V source, V target)
        {
            return (E)base.AddEdge(source, target);
        }

        private new class VertexProvider : IVertexProvider
        {
            private int _idCounter = 0;
            public VertexProvider()
            {
            }
            public IVertex ProvideVertex()
            {
                V vertex = new V();
                vertex.ID = _idCounter++;
                return vertex;
            }

            public void UpdateVertex(IVertex v)
            {
                v.ID = _idCounter++;
            }

            public Type VertexType
            {
                get { return typeof(V); }
            }
        }

        private new class EdgeProvider : IEdgeProvider
        {
            private static int _idCounter = 0;

            public Type EdgeType
            {
                get { return typeof(E); }
            }

            public IEdge ProvideEdge(IVertex u, IVertex v)
            {
                IEdge edge = new E();
                edge.ID = _idCounter++;
                edge.Source = u;
                edge.Target = v;
                return edge;
            }

            public void UpdateEdge(IEdge v)
            {
                v.ID = _idCounter++;
            }
        }

    }

    public abstract class AdjacencyGraphBase<V> : AdjacencyGraphBase<V, Edge>
        where V : IVertex, new()
    {
    }
}
