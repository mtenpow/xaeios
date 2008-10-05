using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.Collections;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Optimization
{
    public class DominatorAnalysis : TransformationBase
    {
        private MethodCompileInfo _methodCompileInfo;

        public DominatorAnalysis()
        {
        }

        public override bool Transform(MethodCompileInfo methodCompileInfo)
        {
            _methodCompileInfo = methodCompileInfo;

            CFGNodeSet wholeSet = new CFGNodeSet(_methodCompileInfo.CFG);
            List<CFGNode> sortedNodes = new List<CFGNode>();
            CFGNodeSet roots = new CFGNodeSet(_methodCompileInfo.CFG.Root);//_compileInfo.Roots;
            try {
                QuickGraph.Algorithms.TopologicalSortAlgorithm sortAlgorithm = new QuickGraph.Algorithms.TopologicalSortAlgorithm(_methodCompileInfo.CFG);
                sortAlgorithm.Compute();
                foreach (CFGNode node in sortAlgorithm.SortedVertices)
                {
                    if (!roots.Contains(node))
                    {
                        sortedNodes.Add(node);
                    }
                    wholeSet.Add(node);
                }
            }
            catch (QuickGraph.Exceptions.NonAcyclicGraphException)
            {
                foreach (QuickGraph.Concepts.IVertex vertex in _methodCompileInfo.CFG.Vertices)
                {
                    if (!roots.Contains((CFGNode)vertex))
                    {
                        sortedNodes.Add((CFGNode)vertex);
                    }
                    wholeSet.Add((CFGNode)vertex);
                }
            }

            Dictionary<CFGNode, CFGNodeSet> domMap = _methodCompileInfo.Dominators;
            domMap.Clear();

            foreach (CFGNode root in roots)
            {
                // root only dominated by itself
                domMap[root] = new CFGNodeSet(root);
            }

            Dictionary<CFGNode, CFGNode[]> predecessorMap = new Dictionary<CFGNode, CFGNode[]>();
            foreach (CFGNode node in sortedNodes)
            {
                predecessorMap[node] = node.Predecessors;
            }

            Dictionary<CFGNode, CFGNodeSet> domMapPrime = new Dictionary<CFGNode, CFGNodeSet>();
            foreach (KeyValuePair<CFGNode, CFGNodeSet> entry in domMap)
            {
                domMapPrime.Add(entry.Key, entry.Value.Clone());
            }

            // initialize to the whole set
            foreach (CFGNode node in sortedNodes)
            {
                domMap[node] = wholeSet;
            }

            do
            {
                bool changed = false;
                for (int i = 0; i < sortedNodes.Count; i++)
                {
                    CFGNode n = sortedNodes[i];
                    domMapPrime[n] = domMap[n];

                    domMap[n] = new CFGNodeSet(n);
                    if (predecessorMap[n].Length > 0)
                    {
                        CFGNode[] predecessors = predecessorMap[n];
                        CFGNodeSet predDomSet = domMap[predecessors[0]].Clone();
                        for (int j = 1; j < predecessors.Length; j++)
                        {
                            predDomSet = predDomSet & domMap[predecessors[j]];
                        }

                        domMap[n] += predDomSet;
                    }

                    if (!changed && domMap[n] != domMapPrime[n])
                    {
                        changed = true;
                    }
                }
                if (changed)
                {
                    continue;
                }
            } while (!DominatorMapsEquals(domMap, domMapPrime));

            // TODO: can we find idom at the same time as we find dominator set?
            // find immediate dominators
            Dictionary<CFGNode, CFGNode> idomMap = _methodCompileInfo.ImmediateDominator;
            for (int i = 0; i < sortedNodes.Count; i++)
            {
                CFGNode n = sortedNodes[i];
                CFGNode immediateDominator = null;
                foreach (CFGNode dominator in domMap[n])
                {
                    if (dominator == n)
                    {
                        continue;
                    }
                    if (immediateDominator == null)
                    {
                        immediateDominator = dominator;
                    }
                    else
                    {
                        if (domMap[dominator].Contains(immediateDominator))
                        {
                            immediateDominator = dominator;
                        }
                    }
                }
                idomMap[n] = immediateDominator;
            }

            // dominator frontier
            Dictionary<CFGNode, CFGNodeSet> frontierMap = _methodCompileInfo.DominatorFrontier;
            frontierMap.Clear();
            for (int i = 0; i < sortedNodes.Count; i++)
            {
                CFGNode n = sortedNodes[i];
                if (predecessorMap[n].Length >= 2)
                {
                    CFGNode immediateDominator = idomMap[n];
                    foreach (CFGNode predecessor in predecessorMap[n])
                    {
                        CFGNode runner = predecessor;
                        while (runner != immediateDominator && idomMap.ContainsKey(runner))
                        {
                            CFGNodeSet frontier;
                            if (!frontierMap.TryGetValue(runner, out frontier))
                            {
                                frontier = new CFGNodeSet(_methodCompileInfo.CFG);
                                frontierMap[runner] = frontier;
                            }
                            frontier.Add(n);
                            runner = idomMap[runner];
                        }
                    }
                }
            }

            return true;
        }

        private static bool DominatorMapsEquals(Dictionary<CFGNode, CFGNodeSet> domMap, Dictionary<CFGNode, CFGNodeSet> domMapPrime)
        {
            if (domMap.Count != domMapPrime.Count)
            {
                return false;
            }
            foreach (KeyValuePair<CFGNode, CFGNodeSet> pair in domMap)
            {
                CFGNodeSet primeValue;
                if (!domMapPrime.TryGetValue(pair.Key, out primeValue))
                {
                    return false;
                }
                if (pair.Value != primeValue)
                {
                    return false;
                }
            }
            return true;
        }

    }
}
