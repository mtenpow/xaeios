using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{

    public enum FrameSlot : int
    {
        This = 0,
        Function = 1,
        Max = Function + 1
    }
}
