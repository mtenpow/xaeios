using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler
{
    public enum FlowControl
    {
        Branch = 1,
        Break = 2,
        Call = 4,
        ConditionalBranch = 8,
        Meta = 16,
        Next = 32,
        Return = 64,
        Throw = 128
    }
}
