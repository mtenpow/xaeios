using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;


namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class WhileStatementPattern : CodeGenerationPattern
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

        public WhileStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        public override bool Match(CFGNode target)
        {
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

            LoopTreeVertex loopTreeVertex = null;
            if (!CompileInfo.Loop.TryGetValue(target, out loopTreeVertex))
            {
                return false;
            }
            if (target.Graph.OutDegree(target) != 2) // TODO: Always 2 successors?
            {
                return false;
            }

            QuickGraph.Collections.EdgeCollection edges = target.Graph.OutEdges(target);
            CFGEdge edge1 = (CFGEdge)edges[0];
            CFGEdge edge2 = (CFGEdge)edges[1];
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
            if (!PassesFilter(thenNode)) // only then node needs to be in working set
            {
                return false;
            }

            // find loop end deepest
            CFGNode loopEnd = loopTreeVertex.Ends[loopTreeVertex.Ends.Count - 1];
            while (CompileInfo.Loop.TryGetValue(loopEnd, out loopTreeVertex))
            {
                loopEnd = loopTreeVertex.Ends[loopTreeVertex.Ends.Count - 1];
            }

            // body is all nodes between header and end node in topological sort (including end node)
            Set<CFGNode> bodySet = new Set<CFGNode>();
            CFGNode firstBodyNode = null;
            for (int i = CompileInfo.TopologicalOrder[thenNode]; i <= CompileInfo.TopologicalOrder[loopEnd]; i++)
            {
                if (PassesFilter(CompileInfo.TopologicalSort[i]))
                {
                    if (firstBodyNode == null)
                    {
                        firstBodyNode = CompileInfo.TopologicalSort[i];
                    }
                    bodySet.Add(CompileInfo.TopologicalSort[i]);
                }
            }

            PatternMatchEventHandler<CFGPatternMatch> bodyMatchedHandler = MatchedHandler;

            this.Body.WorkingSet = bodySet;

            this.Body.Matched += bodyMatchedHandler;

            if (this.Body.Match(firstBodyNode))
            {
                this.Body.Matched -= MatchedHandler;

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
            WhileStatement whileStatement = new WhileStatement();
            whileStatement.Condition = (IExpression)Condition.GenerateCode();
            whileStatement.Body = (IBlockStatement)Body.GenerateCode();
            return whileStatement;
        }

    }
}
