using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    /// <summary>
    /// Summary description for Double.
    /// </summary>
    [Intrinsic("Number", UseGlobalNamespace = true)]
    [CorlibCLRConjugate]
    public struct Double
    {
        [Intrinsic]
        public static extern explicit operator NativeNumber(Double d);

        [Intrinsic]
        public static extern explicit operator Double(NativeNumber n);
    }
}
