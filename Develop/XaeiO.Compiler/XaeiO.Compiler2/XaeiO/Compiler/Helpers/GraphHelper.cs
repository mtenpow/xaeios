using System;
using System.Collections.Generic;
using System.Text;

using QuickGraph;
using QuickGraph.Concepts;
using QuickGraph.Algorithms;
using QuickGraph.Representations;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Helpers
{
	public static class GraphHelper
	{
        public static List<CFGEdge> IsolateNodes(Set<CFGNode> nodes)
        {
            if (nodes.Count == 0)
            {
                return new List<CFGEdge>();
            }
            CFG graph = nodes[0].Graph;
            List<CFGEdge> removedEdges = new List<CFGEdge>();
            foreach (CFGNode node in nodes)
            {
                foreach (CFGEdge edge in graph.OutEdges(node))
                {
                    if (!nodes.Contains(edge.Target))
                    {
                        removedEdges.Add(edge);
                    }
                }
                foreach (CFGEdge edge in graph.InEdges(node))
                {
                    if (!nodes.Contains(edge.Source))
                    {
                        removedEdges.Add(edge);
                    }
                }
            }
            foreach (CFGEdge edge in removedEdges)
            {
                graph.RemoveEdge(edge);
            }
            return removedEdges;
        }
        public static int FindGreatestTopologicalOrder(Set<CFGNode> nodes)
        {
            throw new NotImplementedException();
        }
	}
}
