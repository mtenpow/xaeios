using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns
{
    public delegate void PatternMatchEventHandler(object sender, PatternMatchEventArgs args);
    public delegate void PatternMatchEventHandler<T>(object sender, PatternMatchEventArgs<T> args);
}
