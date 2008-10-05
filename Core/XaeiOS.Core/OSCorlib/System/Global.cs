using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
    [CLSCompliant(false)]
    public static class Global
    {
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "setInterval({0}, {1})")]
        public static extern var SetInterval(NativeFunction f, long timeout);
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "clearInterval({0})")]
        public static extern void ClearInterval(var intervalId);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "setTimeout({0}, {1})")]
        public static extern var SetTimeout(NativeFunction f, long timeout);
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "clearTimeout({0})")]
        public static extern void ClearTimeout(var timeoutId);
    }
}