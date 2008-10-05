using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Resources;

using XaeiOS;

namespace XaeiOS.Process
{
    public delegate void SignalHandler(Signal signal, int data);
    public delegate void CustomSignalHandler(int data);
}
