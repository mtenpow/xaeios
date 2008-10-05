using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class ConditionStatementPattern : CodeGenerationPattern
    {
        public override int Cost
        {
            get
            {
                if (!IsMatched)
                {
                    throw new CompilerException();
                }
                return 4 + Else.Cost + Then.Cost + Condition.Cost;
            }
        }
        public BlockStatementPattern Else
        {
            get
            {
                if (_else == null)
                {
                    _else = new CostRestrictedBlockStatementPattern(CompileInfo);
                }
                return _else;
            }
            set { _else = value; }
        }
        private BlockStatementPattern _else;

        public BlockStatementPattern Then
        {
            get
            {
                if (_then == null)
                {
                    _then = new CostRestrictedBlockStatementPattern(CompileInfo);
                }
                return _then;
            }
            set { _then = value; }
        }
        private BlockStatementPattern _then;

        private Set<CFGNode> MatchedNodes;
        public ExpressionPattern Condition
        {
            get
            {
                if (_condition == null)
                {
                    _condition = new AnyExpressionPattern(CompileInfo);
                }
                return _condition;
            }
            set
            {
                _condition = value;
            }
        }
        private ExpressionPattern _condition;

        public ConditionStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        public override bool Match(CFGNode target)
        {
            IsMatched = false;
            Condition.WorkingSet = WorkingSet;
            Condition.Matched += MatchedHandler;
            MatchedNodes = new Set<CFGNode>();
            if (!Condition.Match(target))
            {
                Condition.Matched -= MatchedHandler;
                return false;
            }
            Condition.Matched -= MatchedHandler;
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

            if (target.Graph.OutDegree(target) != 2)
            {
                return false;
            }
            QuickGraph.Collections.EdgeCollection edges = target.Graph.OutEdges(target);
            CFGEdge edge1 = (CFGEdge)edges[0];
            CFGEdge edge2 = (CFGEdge)edges[1];
            if (CompileInfo.TopologicalOrder[edge1.Target] <= CompileInfo.TopologicalOrder[edge1.Source] ||
                CompileInfo.TopologicalOrder[edge2.Target] <= CompileInfo.TopologicalOrder[edge2.Source]
                )
            {
                return false;
            }
            CFGNode thenNode, elseNode;
            if (edge1.BranchCondition.Type == BranchConditionType.True)
            {
                thenNode = edge1.Target;
                if (edge2.BranchCondition.Type != BranchConditionType.False)
                {
                    return false;
                }
                elseNode = edge2.Target;
            }
            else if (edge2.BranchCondition.Type == BranchConditionType.True)
            {
                thenNode = edge2.Target;
                if (edge1.BranchCondition.Type != BranchConditionType.False)
                {
                    return false;
                }
                elseNode = edge1.Target;
            }
            else
            {
                return false;
            }
            if (!PassesFilter(thenNode) | !PassesFilter(elseNode))
            {
                return false;
            }

            Set<CFGNode> tcThen = Filter(CompileInfo.ForwardOnlyTransitiveClosure[thenNode]);
            Set<CFGNode> tcElse = Filter(CompileInfo.ForwardOnlyTransitiveClosure[elseNode]);
            Set<CFGNode> thenAndElseOnly = tcThen ^ tcElse;
            Set<CFGNode> sansThenAndElse = tcThen & tcElse;

            Set<CFGNode> thenSet = tcThen - sansThenAndElse;
            Set<CFGNode> elseSet = tcElse - sansThenAndElse;

            if (sansThenAndElse.Count != 0)
            {
                // next node after conditionstatement must dominate everything after it
                List<CFGNode> sansThenAndElseList = new List<CFGNode>(sansThenAndElse); // TODO: this algorithm could be better
                sansThenAndElseList.Sort(this.CompareCFGNodesByTopologicalOrder);
                if (sansThenAndElseList.Count > 1 && CompileInfo.TopologicalOrder[sansThenAndElseList[0]] >= CompileInfo.TopologicalOrder[sansThenAndElseList[1]])
                {
                    return false;
                }
            }

            // then node must dominate all nodes in thenSet
            foreach (CFGNode node in thenSet)
            {
                if (!CompileInfo.Dominators[node].Contains(thenNode))
                {
                    return false;
                }
            }
            thenSet.Add(thenNode);

            // same with else node and else set
            foreach (CFGNode node in elseSet)
            {
                if (!CompileInfo.Dominators[node].Contains(elseNode))
                {
                    return false;
                }
            }
            elseSet.Add(elseNode);

            this.Then.WorkingSet = thenSet;
            this.Else.WorkingSet = elseSet;

            this.Then.Matched += MatchedHandler;
            this.Else.Matched += MatchedHandler;

            if (this.Condition.Match(target) && this.Then.Match(thenNode) && this.Else.Match(elseNode))
            {
                this.Then.Matched -= MatchedHandler;
                this.Else.Matched -= MatchedHandler;
                this.Condition.Matched -= MatchedHandler;

                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;
                return true;
            }
            else
            {
                this.Then.Matched -= MatchedHandler;
                this.Else.Matched -= MatchedHandler;
                this.Condition.Matched -= MatchedHandler;
                return false;
            }
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
            ConditionStatement conditionStatement = new ConditionStatement();
            conditionStatement.Condition = (IExpression)this.Condition.GenerateCode();
            conditionStatement.Then = (IBlockStatement)this.Then.GenerateCode();
            conditionStatement.Else = (IBlockStatement)this.Else.GenerateCode();

            return conditionStatement;
        }
    }
}