using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public interface IPattern : IPattern<object, object>
    {
    }
    public interface IPattern<T, PatternMatchT>
    {
        // Events
        event PatternMatchEventHandler<PatternMatchT> Matched;

        // Methods
        bool Match(T target);

    }
}