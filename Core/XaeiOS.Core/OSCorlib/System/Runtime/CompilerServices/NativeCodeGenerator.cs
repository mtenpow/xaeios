using System.Runtime.InteropServices;

namespace System.Runtime.CompilerServices
{
    [Dummy]
    public static class NativeCodeGenerator
    {
        [XaeiOSMethodImpl(MethodImplOptions.CompilerImpl|MethodImplOptions.NonPreemptive)]
        public static extern void Generate(string nativeCode, params object[] args);
    }

    [Dummy]
    public struct Register
    {
    }
}