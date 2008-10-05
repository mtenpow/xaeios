using System.Runtime.CompilerServices;

namespace System.Diagnostics
{
    public static class Logging
    {
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "LogWrite(\"INFO\", {0})")]
        public static extern void Info(string message);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "LogWrite(\"DEBUG\", {0})")]
        public static extern void Debug(string message);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "LogWrite(\"WARN\", {0})")]
        public static extern void Warn(string message);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "LogWrite(\"TRACE\", {0})")]
        public static extern void Trace(string message);
    }
}