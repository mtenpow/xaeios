using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler
{
    public abstract class CompilerTierBase : ICompilerTier
    {
        #region ICompilerTier Members

        public ICompiler Compiler
        {
            get { return _compiler; }
            set { _compiler = value; }
        }
        private ICompiler _compiler;

        #endregion

        public CompilerTierBase()
        {
        }
    }
}
