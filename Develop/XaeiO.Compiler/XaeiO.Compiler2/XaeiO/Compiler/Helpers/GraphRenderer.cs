using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph.Algorithms.Graphviz;
using NGraphviz.Helpers;
using System.Drawing;

namespace XaeiO.Compiler.Helpers
{
    public class CFGRenderer
    {
        public CFG Graph
        {
            get;
            private set;
        }

        public MethodCompileInfo MethodCompileInfo
        {
            get;
            private set;
        }

        public CFGRenderer(CFG graph, MethodCompileInfo compileInfo)
        {
            Graph = graph;
            MethodCompileInfo = compileInfo;
        }

        public void Render(string outputPath)
        {
            Render(outputPath, GraphvizImageType.Png);
        }

        public void Render(string outputPath, GraphvizImageType imageType)
        {
            if (DebugSettings.GraphMethod != null && MethodCompileInfo.Method.ToString() != DebugSettings.GraphMethod)
            {
                return;
            }
            GraphvizAlgorithm algorithm = new GraphvizAlgorithm(Graph);

            algorithm.GraphFormat.Label = MethodCompileInfo.Method.ToString();
            algorithm.CommonVertexFormat.Shape = GraphvizVertexShape.Rectangle;
            algorithm.CommonVertexFormat.Style = GraphvizVertexStyle.Filled;
            algorithm.CommonVertexFormat.Font = new System.Drawing.Font("Tahoma", 10);
            algorithm.CommonEdgeFormat.Font = new System.Drawing.Font("Tahoma", 10);

            algorithm.ImageType = imageType;

            algorithm.FormatEdge += new FormatEdgeEventHandler(algorithm_FormatEdge);
            algorithm.FormatVertex += new FormatVertexEventHandler(algorithm_FormatVertex);

            algorithm.Write(outputPath);
        }

        void algorithm_FormatEdge(object sender, FormatEdgeEventArgs e)
        {
            CFGEdge edge = (CFGEdge)e.Edge;
            if (edge.Source.FlowControl == FlowControl.Branch)
            {
                e.EdgeFormatter.StrokeColor = Color.Blue;
                e.EdgeFormatter.Weight *= 2;
            }
            else
            {
                e.EdgeFormatter.StrokeColor = Color.Black;
            }
            switch (edge.BranchCondition.Type)
            {
                case BranchConditionType.True:
                    {
                        e.EdgeFormatter.Label.Value = "True";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Solid;
                        break;
                    }
                case BranchConditionType.False:
                    {
                        e.EdgeFormatter.Label.Value = "False";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Solid;
                        break;
                    }
                case BranchConditionType.SwitchCaseDefault:
                    {
                        e.EdgeFormatter.Label.Value = "Default:";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Solid;
                        break;
                    }
                case BranchConditionType.SwitchCaseCondition:
                    {
                        e.EdgeFormatter.Label.Value = "Case:" + edge.BranchCondition.Data.ToString();
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Solid;
                        break;
                    }
                case BranchConditionType.ContextSwitch:
                    {
                        e.EdgeFormatter.Label.Value = "Context Switch";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Dotted;
                        break;
                    }
                case BranchConditionType.Unconditional:
                    {
                        e.EdgeFormatter.Label.Value = "";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Solid;
                        break;
                    }
                case BranchConditionType.ExceptionThrown:
                    {
                        e.EdgeFormatter.Label.Value = "Exception Thrown";
                        e.EdgeFormatter.Style = GraphvizEdgeStyle.Dashed;
                        break;
                    }
            }
        }

        void algorithm_FormatVertex(object sender, FormatVertexEventArgs e)
        {
            CFGNode node = (CFGNode)e.Vertex;
            e.VertexFormatter.Label = node.ToString();
            if (node == Graph.Root)
            {
                e.VertexFormatter.FillColor = System.Drawing.Color.Blue;
                e.VertexFormatter.FontColor = System.Drawing.Color.White;
            }
            else if (Graph.OutDegree(node) == 0)
            {
                e.VertexFormatter.FillColor = System.Drawing.Color.Red;
                e.VertexFormatter.FontColor = System.Drawing.Color.White;
            }
            else if (MethodCompileInfo.DeadCode.Contains(node))
            {
                e.VertexFormatter.FillColor = System.Drawing.Color.LightGray;
                e.VertexFormatter.FontColor = System.Drawing.Color.Black;
            }
            else if (node.FlowControl == FlowControl.Call)
            {
                e.VertexFormatter.FillColor = System.Drawing.Color.Green;
                e.VertexFormatter.FontColor = System.Drawing.Color.White;
            }
            else
            {
                e.VertexFormatter.FillColor = System.Drawing.Color.Black;
                e.VertexFormatter.FontColor = System.Drawing.Color.White;
            }
            StringBuilder sb = new StringBuilder();
            if (node.DebugInfo != null)
            {
                sb.AppendFormat("\nDebugInfo: {0}", node.DebugInfo);
            }
            sb.AppendFormat("\nFlow control: {0}", node.FlowControl);
            if (DebugSettings.DetailedGraphs)
            {
                sb.Append("\nDefined: ");
                foreach (string var in MethodCompileInfo.Defined[node])
                {
                    sb.AppendFormat("{0} ", var);
                }
                sb.Append("\nUsed: ");
                foreach (string var in MethodCompileInfo.Used[node])
                {
                    sb.AppendFormat("{0} ", var);
                }
                sb.Append("\nIn: ");
                foreach (string var in MethodCompileInfo.LiveVariablesIn[node])
                {
                    sb.AppendFormat("{0} ", var);
                }
                sb.Append("\nOut: ");
                foreach (string var in MethodCompileInfo.LiveVariablesOut[node])
                {
                    sb.AppendFormat("{0} ", var);
                }
#if GRAPH2
            sb.Append("\nDominators: ");
            foreach (CFGNode dom in MethodCompileInfo.Dominators[node])
            {
                sb.AppendFormat("{0} ", dom.ID);
            }
            sb.Append("\nGen: ");
            for (int i = 0; i < MethodCompileInfo.GeneratedDefinitions[node].Count;i++ )
            {
                sb.Append(MethodCompileInfo.GeneratedDefinitions[node][i].ToString().Replace("\", "\\").Replace("\n", "\n").Replace("\r", "").Replace("\"", "\\""));
                if (i < MethodCompileInfo.GeneratedDefinitions[node].Count - 1)
                {
                    sb.Append(" \n");
                }
            }
            sb.Append("\nKill: ");
            for (int i = 0; i < MethodCompileInfo.KilledDefinitions[node].Count; i++)
            {
                sb.Append(MethodCompileInfo.KilledDefinitions[node][i].ToString().Replace("\", "\\").Replace("\n", "\n").Replace("\r", "").Replace("\"", "\\""));
                if (i < MethodCompileInfo.KilledDefinitions[node].Count - 1)
                {
                    sb.Append(" \n");
                }
            }
            sb.Append("\nExps in: ");
            for (int i = 0; i < MethodCompileInfo.LiveExpressionsIn[node].Count; i++)
            {
                sb.Append(MethodCompileInfo.LiveExpressionsIn[node][i].ToString().Replace("\", "\\").Replace("\n", "\n").Replace("\r", "").Replace("\"", "\\""));
                if (i < MethodCompileInfo.LiveExpressionsIn[node].Count - 1)
                {
                    sb.Append(" \n");
                }
            }
            sb.Append("\nExps out: ");
            for (int i = 0; i < MethodCompileInfo.LiveExpressionsOut[node].Count; i++)
            {
                sb.Append(MethodCompileInfo.LiveExpressionsOut[node][i].ToString().Replace("\", "\\").Replace("\n", "\n").Replace("\r", "").Replace("\"", "\\""));
                if (i < MethodCompileInfo.LiveExpressionsOut[node].Count - 1)
                {
                    sb.Append(" \n");
                }
            }
#endif
            }

            if (DebugSettings.GraphReachingDefinitions)
            {
                sb.Append("\nReaching Defs: ");
                for (int i = 0; i < MethodCompileInfo.ReachingDefinitions[node].Count; i++)
                {
                    sb.Append(MethodCompileInfo.ReachingDefinitions[node][i].ToString());
                    if (i < MethodCompileInfo.ReachingDefinitions[node].Count - 1)
                    {
                        sb.Append(" \n");
                    }
                }
            }
            if (DebugSettings.GraphDominators)
            {
                sb.Append("\n Dominators: ");
                for (int i = 0; i < MethodCompileInfo.Dominators[node].Count; i++)
                {
                    sb.Append(MethodCompileInfo.Dominators[node][i].ID);
                    if (i < MethodCompileInfo.Dominators[node].Count - 1)
                    {
                        sb.Append(",");
                    }
                }
                sb.Append("\n Dominator Frontier: ");
                for (int i = 0; i < MethodCompileInfo.DominatorFrontier[node].Count; i++)
                {
                    sb.Append(MethodCompileInfo.DominatorFrontier[node][i].ID);
                    if (i < MethodCompileInfo.DominatorFrontier[node].Count - 1)
                    {
                        sb.Append(",");
                    }
                }
            }

            e.VertexFormatter.Label += sb.ToString();
            e.VertexFormatter.Label = Escape(e.VertexFormatter.Label);
        }

        private static string Escape(string s)
        {
            return s.Replace("\n", "\\n").Replace("\r", "").Replace("\"", "\\\"");
        }
    }
    public class InterferenceGraphRenderer
    {
        public InterferenceGraph Graph
        {
            get;
            private set;
        }

        public MethodCompileInfo MethodCompileInfo
        {
            get;
            private set;
        }


        private Dictionary<string, bool> WrittenEdges = new Dictionary<string, bool>();

        public InterferenceGraphRenderer(InterferenceGraph graph, MethodCompileInfo methodCompileInfo)
        {
            Graph = graph;
            MethodCompileInfo = methodCompileInfo;
        }

        public void Render(string outputPath, GraphvizImageType imageType)
        {
            if (DebugSettings.GraphMethod != null && DebugSettings.GraphMethod != MethodCompileInfo.Method.ToString())
            {
                return;
            }
            GraphvizAlgorithm algorithm = new GraphvizAlgorithm(Graph);

            algorithm.GraphFormat.Label = MethodCompileInfo.Method.ToString();
            algorithm.CommonVertexFormat.Shape = GraphvizVertexShape.Circle;
            algorithm.CommonVertexFormat.Style = GraphvizVertexStyle.Filled;
            algorithm.CommonVertexFormat.FillColor = System.Drawing.Color.RoyalBlue;
            algorithm.CommonVertexFormat.Font = new System.Drawing.Font("Tahoma", 10);
            algorithm.CommonVertexFormat.FontColor = System.Drawing.Color.White;

            algorithm.CommonEdgeFormat.Dir = GraphvizEdgeDirection.None;
            algorithm.CommonEdgeFormat.Style = GraphvizEdgeStyle.Bold;

            algorithm.ImageType = imageType;

            algorithm.FormatVertex += new FormatVertexEventHandler(algorithm_FormatVertex);

            List<InterferenceGraphEdge> removedEdges = new List<InterferenceGraphEdge>();
            List<InterferenceGraphEdge> edges = new List<InterferenceGraphEdge>();
            foreach (QuickGraph.Concepts.IEdge edge in Graph.Edges)
            {
                edges.Add((InterferenceGraphEdge)edge);
            }
            foreach (InterferenceGraphEdge edge in edges)
            {
                if (Graph.ContainsEdge(edge.Target, edge.Source) && Graph.ContainsEdge(edge.Source, edge.Target))
                {
                    removedEdges.Add(edge);
                    Graph.RemoveEdge(edge);
                }
            }

            System.Drawing.Color[] colorList = new System.Drawing.Color[]{
                System.Drawing.Color.Red,
                System.Drawing.Color.Blue,
                System.Drawing.Color.Green,
                System.Drawing.Color.Orange,
                System.Drawing.Color.Black,
                System.Drawing.Color.Green,
                System.Drawing.Color.DarkGray,
                System.Drawing.Color.Orange,
                System.Drawing.Color.Navy,
                System.Drawing.Color.Brown,
                System.Drawing.Color.Purple,
                System.Drawing.Color.PowderBlue,
                System.Drawing.Color.Yellow,
                System.Drawing.Color.Magenta,
                System.Drawing.Color.Pink,
                System.Drawing.Color.LightBlue,
                System.Drawing.Color.LightGray
            };
            int increment = 0xffffff / MethodCompileInfo.MaxRegisters;
            for (int i = 1; i <= MethodCompileInfo.MaxRegisters; i++)
            {
                //ColorMapping[i] = colorList[i - 1];
                ColorMapping[i] = System.Drawing.Color.FromArgb(i * increment);
            }

            algorithm.Write(outputPath);

            foreach (InterferenceGraphEdge edge in removedEdges)
            {
                Graph.AddEdge(edge);
            }
        }
        private Dictionary<int, System.Drawing.Color> ColorMapping = new Dictionary<int, System.Drawing.Color>();

        void algorithm_FormatVertex(object sender, FormatVertexEventArgs e)
        {
            InterferenceGraphNode node = (InterferenceGraphNode)e.Vertex;
            e.VertexFormatter.Label = node.ToString();

            if (node.Color != 0)
            {
                e.VertexFormatter.FillColor = ColorMapping[node.Color];
            }
            int registerNum;
            if (MethodCompileInfo.RegisterMap.TryGetValue(node.Variable, out registerNum))
            {
                e.VertexFormatter.Label += " => $r" + registerNum;
            }
        }
    }
}
