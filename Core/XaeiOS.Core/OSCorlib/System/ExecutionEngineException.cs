using System.Reflection;
using System.Runtime.CompilerServices;

namespace System
{
    public class ExecutionEngineException : SystemException
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public ExecutionEngineException(string message)
            : base(message)
        {
        }

        // TODO: Find some way of only exposing this constructor to the kernel
    }
}
