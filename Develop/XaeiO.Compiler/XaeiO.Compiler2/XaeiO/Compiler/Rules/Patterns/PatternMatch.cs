using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public class PatternMatch
    {
        // Methods
        public PatternMatch(object match)
        {
            if (match == null)
            {
                throw new ArgumentNullException("match");
            }
            this.match = match;
        }

        protected PatternMatch()
        {
        }


        // Properties
        public virtual object Match
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