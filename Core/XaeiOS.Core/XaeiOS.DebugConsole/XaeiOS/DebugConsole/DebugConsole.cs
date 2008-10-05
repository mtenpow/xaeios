using System;
using System.Threading;
using System.IO;
using System.Collections.Generic;

using XaeiOS.Process;

namespace XaeiOS.DebugConsole
{
    public class DebugConsole
    {
        TextWriter _consoleTextWriter;

        public DebugConsole()
        {
        }

        public void Start()
        {
            // redirect output to our console output stream
            Console.SetOut(_consoleTextWriter);
        }
    }
}
