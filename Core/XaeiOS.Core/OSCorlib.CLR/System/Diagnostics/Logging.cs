using System.Runtime.CompilerServices;

namespace System.Diagnostics
{
    public static class Logging
    {
        public static void Log(string message)
        {
            Console.WriteLine(message);
        }

        public static void Debug(string message)
        {
            Console.WriteLine(message);
        }
    }
}