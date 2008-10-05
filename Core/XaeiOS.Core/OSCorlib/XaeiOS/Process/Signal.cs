using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Resources;

using XaeiOS;

namespace XaeiOS.Process
{
    public enum Signal : int
    {
        Quit = 3,
        Kill = 9,
        Custom = 16
    }
}
