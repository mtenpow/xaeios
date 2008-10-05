using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.IO;

using XaeiOS;
using XaeiOS.Process;

namespace System
{
    [CorlibCLRConjugate]
    public static class Console
    {
        public static TextWriter Out
        {
            get
            {
                SIP sip = SIP.CurrentSIP;
                if (sip == null)
                {
                    throw new ExecutionEngineException("No process currently running");
                }
                return sip.Output;
            }
        }
        public static string ReadLine()
        {
            throw new NotImplementedException();
        }
        public static int Read()
        {
            throw new NotImplementedException();
        }
        public static string Title
        {
            get
            {
                throw new NotSupportedException();
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        public static void Write(string s)
        {
            Out.Write(s);
        }

        public static void WriteLine(string s)
        {
            Write(s + "\n");
        }

        public static void WriteLine(int value)
        {
            Write(value + "\n");
        }

        public static void WriteLine()
        {
            Write("\n");
        }

        public static void SetOut(TextWriter writer)
        {
            SIP sip = SIP.CurrentSIP;
            if (sip == null)
            {
                throw new ExecutionEngineException("No process currently running");
            }
            sip.Output = writer;
        }
    }
}
