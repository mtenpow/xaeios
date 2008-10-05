using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler
{
    public interface IFrontEnd : ICompilerTier
    {
        void BuildCFG(MethodCompileInfo compileInfo);
        void BuildCFG(AssemblyCompileInfo assemblyCompileInfo);
    }
}
