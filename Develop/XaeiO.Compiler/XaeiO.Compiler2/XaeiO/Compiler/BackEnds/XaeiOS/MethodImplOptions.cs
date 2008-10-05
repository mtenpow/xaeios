using System;
using System.Collections.Generic;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public enum MethodImplOptions
    {
        SystemCall = 0x1000,
        CompilerImpl = 0x10000,
        NonPreemptive = 0x100000,
        CriticalSection = 0x1000000,
        Inline = 0x100,
        NoInlining = 8,
        Synchronized = 0x20,
    }
}
