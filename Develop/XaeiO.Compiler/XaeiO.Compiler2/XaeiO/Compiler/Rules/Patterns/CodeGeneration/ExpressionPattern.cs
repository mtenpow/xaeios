using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public abstract class ExpressionPattern : CodeGenerationPattern
    {
        public abstract override int Cost
        {
            get;
        }
        protected ExpressionPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }
	}
}
