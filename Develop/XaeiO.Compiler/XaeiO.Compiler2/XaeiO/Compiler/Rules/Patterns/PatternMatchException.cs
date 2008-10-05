using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public class PatternMatchException : Exception
    {
        // Methods
        public PatternMatchException(object match)
        {
            this.match = match;
        }


        // Properties
        public object Match
        {
            get
            {
                return this.match;
            }
        }


        // Fields
        private object match;
    }
}