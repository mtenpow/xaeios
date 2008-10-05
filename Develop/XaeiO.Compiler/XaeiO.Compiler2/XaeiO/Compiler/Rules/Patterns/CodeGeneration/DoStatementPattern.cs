using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class DoStatementPattern : CodeGenerationPattern
    {
        public override int Cost
        {
            get
            {
                if (!IsMatched)
                {
                    throw new CompilerException();
                }
                return 5 + Condition.Cost + Body.Cost;
            }
        }
        public BlockStatementPattern Body
        {
            get
            {
                if (_body == null)
                {
                    _body = new CostRestrictedBlockStatementPattern(CompileInfo);
                }
                return _body;
            }
            set { _body = value; }
        }
        private BlockStatementPattern _body;

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

        public DoStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        public override bool Match(CFGNode target)
        {
            IsMatched = false;
            MatchedNodes = new Set<CFGNode>();
            LoopTreeVertex loopTreeVertex = null;
            if (!CompileInfo.Loop.TryGetValue(target, out loopTreeVertex))
            {
                return false;
            }

            // find loop end
            CFGNode loopEnd = loopTreeVertex.Ends[loopTreeVertex.Ends.Count - 1];
            if (!PassesFilter(loopEnd))
            {
                return false;
            }
            if (target.Graph.OutDegree(loopEnd) != 2) // TODO: Always 2 successors?
            {
                return false;
            }

            QuickGraph.Collections.EdgeCollection edges = target.Graph.OutEdges(loopEnd);
            CFGEdge edge1 = (CFGEdge)edges[0];
            CFGEdge edge2 = (CFGEdge)edges[1];
            CFGNode thenNode, elseNode;
            if (edge1.BranchCondition.Type == BranchConditionType.True && CompileInfo.TopologicalOrder[edge1.Target] < CompileInfo.TopologicalOrder[edge1.Source])
            {
                thenNode = edge1.Target;
                if (edge2.BranchCondition.Type != BranchConditionType.False || CompileInfo.TopologicalOrder[edge2.Target] < CompileInfo.TopologicalOrder[edge2.Source])
                {
                    return false;
                }
                elseNode = edge2.Target;
            }
            else if (edge2.BranchCondition.Type == BranchConditionType.True && CompileInfo.TopologicalOrder[edge2.Target] < CompileInfo.TopologicalOrder[edge2.Source])
            {
                thenNode = edge2.Target;
                if (edge1.BranchCondition.Type != BranchConditionType.False || CompileInfo.TopologicalOrder[edge1.Target] < CompileInfo.TopologicalOrder[edge1.Source])
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

            // body is all nodes between header and end node in topological sort (including end node)
            Set<CFGNode> bodySet = new Set<CFGNode>();
            CFGNode firstBodyNode = target;
            for (int i = CompileInfo.TopologicalOrder[target]; i < CompileInfo.TopologicalOrder[loopEnd]; i++)
            {
                if (PassesFilter(CompileInfo.TopologicalSort[i]))
                {
                    bodySet.Add(CompileInfo.TopologicalSort[i]);
                }
            }

            PatternMatchEventHandler<CFGPatternMatch> bodyMatchedHandler = MatchedHandler;

            this.Body.WorkingSet = bodySet;
            this.Body.Matched += bodyMatchedHandler;

            if (this.Body.Match(firstBodyNode))
            {
                this.Body.Matched -= MatchedHandler;

                Condition.WorkingSet = new Set<CFGNode>(loopEnd);
                Condition.Matched += MatchedHandler;
                if (!Condition.Match(loopEnd))
                {
                    Condition.Matched -= MatchedHandler;
                    return false;
                }
                Condition.Matched -= MatchedHandler;

                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;

                return true;
            }
            else
            {
                this.Body.Matched -= MatchedHandler;
                return false;
            }
        }
        private void MatchedHandler(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes |= args.Match.MatchedNodes;
        }

        public override ICodeObject GenerateCode()
        {
            if (!IsMatched)
            {
                throw new CompilerException();
            }
            DoStatement doStatement = new DoStatement();
            doStatement.Condition = (IExpression)Condition.GenerateCode();
            doStatement.Body = (IBlockStatement)Body.GenerateCode();
            return doStatement;
        }

    }
}
