using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    [Flags]
    public enum VTableFlags
    {
        None = 0,
        IsInterface = 1
    }
}
