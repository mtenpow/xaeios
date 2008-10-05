using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public abstract class Pattern : IPattern
    {
        // Events
        public event PatternMatchEventHandler<object> Matched;

        // Methods
        protected Pattern()
        {
        }

        public abstract bool Match(object target);

        protected virtual void OnMatched(object match)
        {
            if (this.Matched != null)
            {
                this.Matched(this, new PatternMatchEventArgs(match));
            }
        }

    }

    public abstract class Pattern<T> : Pattern<T, object>
    {
    }

    public abstract class Pattern<T, PatternMatchT> : IPattern<T, PatternMatchT>
    {
        public event PatternMatchEventHandler<PatternMatchT> Matched;

        public bool Match(object target)
        {
            if (target.GetType().IsAssignableFrom(typeof(T)))
            {
                return Match((T)target);
            }
            return false;
        }
        public abstract bool Match(T target);

        protected virtual void OnMatched(PatternMatchT match)
        {
            if (this.Matched != null)
            {
                this.Matched(this, new PatternMatchEventArgs<PatternMatchT>(match));
            }
        }
    }
}