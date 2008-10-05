using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public class BooleanExpressionPattern : ExpressionPattern
    {
        public override int Cost
        {
            get
            {
                System.Diagnostics.Debug.Assert(IsMatched);
                return ExpressionPattern.Cost;
            }
        }
        public BooleanExpressionPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        private Set<CFGNode> MatchedNodes;

        private ExpressionPattern ExpressionPattern;
        private IExpression MatchedExpression;

        public override bool Match(CFGNode target)
        {
            AnyExpressionPattern pattern = new AnyExpressionPattern(CompileInfo);
            pattern.Matched += new PatternMatchEventHandler<CFGPatternMatch>(pattern_Matched);
            if (!pattern.Match(target))
            {
                return false;
            }
            MatchedExpression = (IExpression)pattern.GenerateCode();
            if (MatchedExpression.Type.Equals(CoreTypes.Boolean))
            {
                return false;
            }
            OnMatched(new CFGPatternMatch(MatchedNodes));
            IsMatched = true;
            ExpressionPattern = pattern;
            return true;
        }

        void pattern_Matched(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes = args.Match.MatchedNodes;
        }
        public override ICodeObject GenerateCode()
        {
            System.Diagnostics.Debug.Assert(IsMatched);
            return MatchedExpression;
        }
    }
}
