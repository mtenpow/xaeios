using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler
{
    public interface ICompilerTier
    {
        ICompiler Compiler
        {
            get;
            set;
        }
    }
}
