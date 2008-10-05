using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

using Mono.Cecil;
using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler
{
    public interface IBackEnd : ICompilerTier
    {
        void EmitAssembly(AssemblyCompileInfo compileInfo);
        void EmitCode(MethodCompileInfo compileInfo);
        int CalculateStatementCost(IStatement statement);
        int CalculateExpressionCost(IExpression expression);
    }
}
