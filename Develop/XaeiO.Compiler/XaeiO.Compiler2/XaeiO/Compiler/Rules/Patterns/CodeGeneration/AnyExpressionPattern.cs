using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class AnyExpressionPattern : ExpressionPattern
    {
        public override int Cost
        {
            get
            {
                if (!IsMatched)
                {
                    throw new CompilerException();
                }
                return _cost;
            }
        }
        private int _cost;
        public AnyExpressionPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }
        private IExpression MatchedExpression;
        private Tenpow.Collections.Generic.Set<CFGNode> MatchedNodes;
        public override bool Match(CFGNode target)
        {
            IsMatched = false;
            MatchedNodes = new Tenpow.Collections.Generic.Set<CFGNode>();
            MatchedExpression = null;
            // TODO: Match a condition binaryExpression

            if (target.BasicBlock.Statements.Count < 1)
            {
                return false;
            }
            IAssignStatement assignStatement = target.BasicBlock.Statements[0] as IAssignStatement;
            if (assignStatement != null)
            {
                MatchedExpression = new AssignExpression(assignStatement.Target, assignStatement.Expression);
            }
            else
            {
                IExpressionStatement expressionStatement = target.BasicBlock.Statements[0] as IExpressionStatement;
                if (expressionStatement == null)
                {
                    return false;
                }
                MatchedExpression = expressionStatement.Expression;
            }
            MatchedNodes.Add(target);

            OnMatched(new CFGPatternMatch(MatchedNodes));
            IsMatched = true;
            return true;
        }

        void ExpressionPattern_Matched(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes = args.Match.MatchedNodes;
        }

        public override ICodeObject GenerateCode()
        {
            if (!IsMatched)
            {
                throw new CompilerException();
            }
            if (MatchedExpression != null)
            {
                return MatchedExpression;
            }
            else
            {
                throw new NotImplementedException();
            }
        }
    }
}
