using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public abstract class StatementPattern : CodeGenerationPattern
	{
        protected StatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }
	}
}
