using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Providers;
using QuickGraph.Concepts;

namespace XaeiO.Compiler.Optimization
{
    public class TransitiveClosure<T> : AdjacencyGraph where T : IVertex
    {
        public TransitiveClosure()
            : base(new TypedVertexProvider(typeof(TransitiveClosureVertex<T>)), new EdgeProvider(), false)
        {
        }

        private class VertexProvider : QuickGraph.Concepts.Providers.IVertexProvider
        {
            private int IDCounter = 0;
            public VertexProvider()
            {
            }
            IVertex QuickGraph.Concepts.Providers.IVertexProvider.ProvideVertex()
            {
                return new TransitiveClosureVertex<T>(IDCounter++);
            }

            void QuickGraph.Concepts.Providers.IVertexProvider.UpdateVertex(IVertex v)
            {
                v.ID = IDCounter++;
            }

            Type QuickGraph.Concepts.Providers.IVertexProvider.VertexType
            {
                get { return typeof(T); }
            }
}
    }

    public class TransitiveClosureVertex<T> : Vertex where T : IVertex
    {
        private T _mappedVertex;

        public T MappedVertex
        {
            get { return _mappedVertex; }
            set { _mappedVertex = value; }
        }

        public TransitiveClosureVertex(int id) : base(id)
        {
        }
    }
}
