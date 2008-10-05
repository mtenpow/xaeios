using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public abstract class BlockStatementPattern : CodeGenerationPattern
	{
        protected BlockStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }
	}
}
