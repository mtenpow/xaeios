using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public class PatternMatchEventArgs : PatternMatchEventArgs<object>
    {
        // Methods
        public PatternMatchEventArgs(object match) : base(match)
        {
        }
    }

    public class PatternMatchEventArgs<T> : EventArgs
    {
        // Methods
        public PatternMatchEventArgs(T match)
        {
            this.match = match;
        }


        // Properties
        public T Match
        {
            get
            {
                return this.match;
            }
        }


        // Fields
        private T match;
    }


}