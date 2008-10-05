using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Providers;
using QuickGraph.Concepts;

namespace XaeiO.Compiler.Optimization
{
    public class LoopTree : AdjacencyGraph
    {
        public LoopTree()
            : base(new TypedVertexProvider(typeof(LoopTreeVertex)), new EdgeProvider(), false)
        {
        }

        public LoopTreeVertex AddVertex(CFGNode loopHeader)
        {
            LoopTreeVertex vertex = (LoopTreeVertex)AddVertex();
            vertex.Header = loopHeader;
            return vertex;
        }

        private class VertexProvider : QuickGraph.Concepts.Providers.IVertexProvider
        {
            private int IDCounter = 0;
            public VertexProvider()
            {
            }
            IVertex QuickGraph.Concepts.Providers.IVertexProvider.ProvideVertex()
            {
                return new LoopTreeVertex(IDCounter++);
            }

            void QuickGraph.Concepts.Providers.IVertexProvider.UpdateVertex(IVertex v)
            {
                v.ID = IDCounter++;
            }

            Type QuickGraph.Concepts.Providers.IVertexProvider.VertexType
            {
                get { return typeof(LoopTreeVertex); }
            }
        }
    }

    public class LoopTreeVertex : Vertex
    {
        private CFGNode _header;

        public CFGNode Header
        {
            get { return _header; }
            set { _header = value; }
        }

        private List<CFGNode> _ends;

        public List<CFGNode> Ends
        {
            get
            {
                if (_ends == null)
                {
                    _ends = new List<CFGNode>();
                }
                return _ends;
            }
            set { _ends = value; }
        }

        public LoopTreeVertex(int id)
            : base(id)
        {
        }
    }
}
