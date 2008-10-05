using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
	public interface ICodeGenerationPattern : IPattern<CFGNode, CFGPatternMatch>
	{
        ICodeObject GenerateCode();
        int Cost
        {
            get;
        }
	}
}
