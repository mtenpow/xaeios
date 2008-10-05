using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class SwitchStatementPattern : CodeGenerationPattern
    {
        public override int Cost
        {
            get
            {
                if (!IsMatched)
                {
                    throw new CompilerException();
                }
                int sum = 6 + Expression.Cost;
                foreach (IExpression switchCondition in SwitchConditions)
                {
                    sum++; // TODO: Calculate real cost of switchCondition
                }
                foreach (BlockStatementPattern switchCase in SwitchCases)
                {
                    sum += switchCase.Cost;
                }
                return sum;
            }
        }
        private List<BlockStatementPattern> SwitchCases;
        private List<IExpression> SwitchConditions;

        private Set<CFGNode> MatchedNodes;

        public ExpressionPattern Expression
        {
            get
            {
                if (_expression == null)
                {
                    _expression = new AnyExpressionPattern(CompileInfo);
                }
                return _expression;
            }
            set
            {
                _expression = value;
            }
        }
        private ExpressionPattern _expression;

        public SwitchStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        public override bool Match(CFGNode target)
        {
            IsMatched = false;
            Expression.WorkingSet = WorkingSet;
            Expression.Matched += MatchedHandler;
            MatchedNodes = new Set<CFGNode>();
            if (!Expression.Match(target))
            {
                Expression.Matched -= MatchedHandler;
                return false;
            }
            Expression.Matched -= MatchedHandler;
            int topologicalOrder = -1;
            foreach (CFGNode node in MatchedNodes)
            {
                if (CompileInfo.TopologicalOrder[node] > topologicalOrder)
                {
                    topologicalOrder = CompileInfo.TopologicalOrder[node];
                }
            }
            if (CompileInfo.TopologicalSort.Count == topologicalOrder)
            {
                return false;
            }
            target = CompileInfo.TopologicalSort[topologicalOrder];

            if(target.Graph.OutDegree(target) < 2){
                return false;
            }
            if (target.FlowControl != FlowControl.ConditionalBranch)
            {
                return false;
            }
            Set<CFGNode> firstCaseNodes = new Set<CFGNode>();
            SwitchConditions = new List<IExpression>();
            foreach (CFGEdge edge in target.Graph.OutEdges(target))
            {
                if (edge.BranchCondition.Type == BranchConditionType.SwitchCaseDefault)
                {
                    SwitchConditions.Add(null);
                    firstCaseNodes.Add(edge.Target);
                }
                else if (edge.BranchCondition.Type == BranchConditionType.SwitchCaseCondition)
                {
                    SwitchConditions.Add((IExpression)edge.BranchCondition.Data);
                    firstCaseNodes.Add(edge.Target);
                }
                else if(edge.BranchCondition.Type != BranchConditionType.SwitchFallThrough)
                {
                    return false;
                }
            }

            List<Set<CFGNode>> switchCaseTcs = new List<Set<CFGNode>>();
            foreach (CFGNode node in firstCaseNodes)
            {
                switchCaseTcs.Add(CompileInfo.ForwardOnlyTransitiveClosure[node]);
            }
            Set<CFGNode> afterSwitchSet = switchCaseTcs[0];
            for (int i = 1; i < switchCaseTcs.Count; i++)
            {
                afterSwitchSet &= switchCaseTcs[i];
            }
            SwitchCases = new List<BlockStatementPattern>();
            for (int i = 0; i < switchCaseTcs.Count; i++)
            {
                Set<CFGNode> switchCaseSet = switchCaseTcs[i];
                switchCaseSet.Add(firstCaseNodes[i]);
                for (int j = 0; j < switchCaseTcs.Count; j++)
                {
                    if (i == j)
                    {
                        continue;
                    }
                    switchCaseSet -= switchCaseTcs[j];
                }
                switchCaseSet -= afterSwitchSet;
                CostRestrictedBlockStatementPattern pattern = new CostRestrictedBlockStatementPattern(CompileInfo);
                pattern.Matched += MatchedHandler;
                pattern.WorkingSet = switchCaseSet;
                if (!pattern.Match(firstCaseNodes[i]))
                {
                    pattern.Matched -= MatchedHandler;
                    return false;
                }
                pattern.Matched -= MatchedHandler;
                SwitchCases.Add(pattern);
            }

            OnMatched(new CFGPatternMatch(MatchedNodes));
            IsMatched = true;
            return true;
        }

        private void MatchedHandler(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes |= args.Match.MatchedNodes;
        }
        private int CompareCFGNodesByTopologicalOrder(CFGNode a, CFGNode b)
        {
            return CompileInfo.TopologicalOrder[a].CompareTo(CompileInfo.TopologicalOrder[b]);
        }

        public override ICodeObject GenerateCode()
        {
            if (!IsMatched)
            {
                throw new CompilerException();
            }
            SwitchStatement switchStatement = new SwitchStatement();
            switchStatement.Expression = (IExpression)_expression.GenerateCode();
            for (int i = 0; i < SwitchCases.Count; i++)
            {
                if (SwitchConditions[i] == null)
                {
                    DefaultCase defaultCase = new DefaultCase();
                    defaultCase.Body = (IBlockStatement)SwitchCases[i].GenerateCode();
                    switchStatement.Cases.Add(defaultCase);
                }
                else
                {
                    ConditionCase conditionCase = new ConditionCase();
                    conditionCase.Condition = SwitchConditions[i];
                    conditionCase.Body = (IBlockStatement)SwitchCases[i].GenerateCode();
                    switchStatement.Cases.Add(conditionCase);
                }
            }
            return switchStatement;
        }
    }
}