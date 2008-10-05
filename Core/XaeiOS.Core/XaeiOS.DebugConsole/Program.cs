using System;
using System.Threading;
using System.Collections.Generic;

using XaeiOS;
using XaeiOS.Process;

using XaeiOS.DebugConsole;

class Program
{
    static void Main(string[] args)
    {
        StartDebugConsole();
    }

    static void StartDebugConsole()
    {
        SIP debugConsoleSIP = new SIP(delegate()
        {
            new DebugConsole().Start();
        }, ThreadPriority.Normal, "XaeiOS.DebugConsole");
    }
}
