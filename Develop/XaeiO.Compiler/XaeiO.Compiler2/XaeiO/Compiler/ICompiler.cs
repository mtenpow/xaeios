using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler
{
    public interface ICompiler
    {
        IFrontEnd FrontEnd
        {
            get;
        }
        IMiddleEnd MiddleEnd
        {
            get;
        }
        IBackEnd BackEnd
        {
            get;
        }
        IAssemblyResolver Resolver
        {
            get;
        }
        CompilerOptions Options
        {
            get;
        }
        IncrementalCompilationState IncrementalCompilationState
        {
            get;
        }
        void Compile();
    }
}
