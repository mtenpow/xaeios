using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;
using System.Diagnostics;

namespace XaeiOS.Boot
{
    public static class BootManager
    {
        public static void Boot(VoidDelegate initDelegate)
        {
            // TODO: Start kernel, sip, etc
            initDelegate();
        }
    }
}
