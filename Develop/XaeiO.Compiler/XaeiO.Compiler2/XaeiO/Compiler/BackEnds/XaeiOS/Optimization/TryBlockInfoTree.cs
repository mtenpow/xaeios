using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Representations;
using QuickGraph.Providers;
using QuickGraph.Concepts;

using XaeiO.Compiler.Graph;

using QuickGraph.Algorithms.Graphviz;
using NGraphviz.Helpers;

namespace XaeiO.Compiler.BackEnds.XaeiOS.Optimization
{
    public class TryBlockInfoTree : AdjacencyGraphBase<TryBlockInfoTreeVertex, TryBlockInfoTreeEdge>
    {
        public TryBlockInfoTree()
        {
        }
    }

    public class TryBlockInfoTreeVertex : Vertex
    {
        public TryBlockInfo TryBlockInfo
        {
            get;
            set;
        }

        public TryBlockInfoTreeVertex()
        {
        }

        public TryBlockInfoTreeVertex(int id) : base(id)
        {
        }
    }

    public class TryBlockInfoTreeEdge : Edge
    {
        public TryBlockInfoParentType Type
        {
            get;
            set;
        }

        public TryBlockInfoTreeEdge()
        {
        }
    }

    public class TryBlockInfoTreeRenderer
    {
        public TryBlockInfoTree Tree
        {
            get;
            private set;
        }

        public MethodCompileInfo MethodCompileInfo
        {
            get;
            private set;
        }

        public TryBlockInfoTreeRenderer(TryBlockInfoTree tree, MethodCompileInfo methodCompileInfo)
        {
            Tree = tree;
            MethodCompileInfo = methodCompileInfo;
        }

        public void Render(string outputPath, GraphvizImageType imageType)
        {
            if (DebugSettings.GraphMethod != null && DebugSettings.GraphMethod != MethodCompileInfo.Method.ToString())
            {
                return;
            }
            GraphvizAlgorithm algorithm = new GraphvizAlgorithm(Tree);

            algorithm.CommonVertexFormat.Shape = GraphvizVertexShape.Circle;
            algorithm.CommonVertexFormat.Style = GraphvizVertexStyle.Filled;
            algorithm.CommonVertexFormat.FillColor = System.Drawing.Color.RoyalBlue;
            algorithm.CommonVertexFormat.Font = new System.Drawing.Font("Tahoma", 10);
            algorithm.CommonVertexFormat.FontColor = System.Drawing.Color.White;

            algorithm.CommonEdgeFormat.Dir = GraphvizEdgeDirection.None;
            algorithm.CommonEdgeFormat.Style = GraphvizEdgeStyle.Bold;

            algorithm.ImageType = imageType;

            algorithm.FormatVertex += new FormatVertexEventHandler(algorithm_FormatVertex);

            algorithm.Write(outputPath);
        }

        void algorithm_FormatVertex(object sender, FormatVertexEventArgs e)
        {
            TryBlockInfoTreeVertex vertex = (TryBlockInfoTreeVertex)e.Vertex;
            e.VertexFormatter.Label = vertex.TryBlockInfo.TryBlock.Start.ID + " => " + vertex.TryBlockInfo.TryBlock.End.ID;
        }
    }
}
