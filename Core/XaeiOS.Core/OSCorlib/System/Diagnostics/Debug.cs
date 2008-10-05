using System.Runtime.CompilerServices;

namespace System.Diagnostics
{
    public static class Debug
    {
        public static void Assert(string message, bool condition)
        {
            if (!condition)
            {
                Logging.Debug("Assertion failed: " + message);
                throw new Exception(message);
            }
        }
    }
}