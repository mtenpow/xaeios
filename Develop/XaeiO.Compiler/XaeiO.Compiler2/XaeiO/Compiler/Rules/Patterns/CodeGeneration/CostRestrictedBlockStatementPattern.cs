using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class CostRestrictedBlockStatementPattern : BlockStatementPattern
    {
        public override int Cost
        {
            get
            {
                if (!IsMatched)
                {
                    throw new CompilerException();
                }
                int cost = 0;
                foreach (CostRestrictedStatementPattern pattern in Patterns)
                {
                    cost += pattern.Cost;
                }
                return cost;
            }
        }
        private int _maxCost = int.MaxValue;

        private List<CostRestrictedStatementPattern> Patterns;

        public int MaxCost
        {
            get { return _maxCost; }
            set { _maxCost = value; }
        }
        public CostRestrictedBlockStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        public override bool Match(CFGNode node)
        {
            IsMatched = false;
            Patterns = new List<CostRestrictedStatementPattern>();
            MatchedNodes = new Tenpow.Collections.Generic.Set<CFGNode>();
            if (!PassesFilter(node))
            {
                return false;
            }
            int cost = 0;
            while (true)
            {
                CostRestrictedStatementPattern pattern = new CostRestrictedStatementPattern(CompileInfo);
                pattern.WorkingSet = WorkingSet;
                pattern.Matched += PatternMatched;
                pattern.MaxCost = MaxCost - cost;
                if (pattern.Match(node))
                {
                    cost += pattern.Cost;
                    Patterns.Add(pattern);

                    int topologicalOrder = -1;
                    // TODO: verify that last matched nodes are in topological order
                    foreach (CFGNode n in LastMatchedNodes)
                    {
                        if (CompileInfo.TopologicalOrder[n] > topologicalOrder)
                        {
                            topologicalOrder = CompileInfo.TopologicalOrder[n];
                        }
                    }
                    if (CompileInfo.TopologicalSort.Count == topologicalOrder + 1 || topologicalOrder == -1)
                    {
                        break;
                    }
                    node = CompileInfo.TopologicalSort[topologicalOrder + 1];
                    if (!PassesFilter(node))
                    {
                        break;
                    }
                }
                else
                {
                    break;
                }
            }
            OnMatched(new CFGPatternMatch(MatchedNodes));
            IsMatched = true;
            return true;
        }

        private Tenpow.Collections.Generic.Set<CFGNode> MatchedNodes;
        private Tenpow.Collections.Generic.Set<CFGNode> LastMatchedNodes;
        void PatternMatched(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes |= (LastMatchedNodes = args.Match.MatchedNodes);
        }
        public override ICodeObject GenerateCode()
        {
            if (!IsMatched)
            {
                throw new CompilerException();
            }
            BlockStatement blockStatement = new BlockStatement();
            foreach (CostRestrictedStatementPattern pattern in Patterns)
            {
                blockStatement.Statements.Add((IStatement)pattern.GenerateCode());
            }
            return blockStatement;
        }
    }
}
