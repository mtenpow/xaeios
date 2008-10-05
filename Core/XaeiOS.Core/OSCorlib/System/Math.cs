using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
    /// <summary>
    /// Summary description for Math.
    /// </summary>
    [Intrinsic("Math", UseGlobalNamespace = true)]
    public static class Math
    {
        [Intrinsic("ceil")]
        public static extern NativeNumber Ceiling(NativeNumber a);

        [Intrinsic("floor")]
        public static extern NativeNumber Floor(NativeNumber a);

        [Intrinsic("abs")]
        public static extern NativeNumber Abs(NativeNumber a);

        [Intrinsic("round")]
        public static extern NativeNumber Round(NativeNumber a);

        [Intrinsic("max")]
        public static extern NativeNumber Max(NativeNumber a, NativeNumber b);

        [Intrinsic("min")]
        public static extern NativeNumber Min(NativeNumber a, NativeNumber b);

        [Intrinsic("min")]
        public static extern long Min(long a, long b);

        [Intrinsic("min")]
        public static extern int Min(int a, int b);

        [Intrinsic("sin")]
        public static extern NativeNumber Sin(NativeNumber a);

        [Intrinsic("cos")]
        public static extern NativeNumber Cos(NativeNumber a);

        [Intrinsic("tan")]
        public static extern NativeNumber Tan(NativeNumber a);

        [Intrinsic("sqrt")]
        public static extern NativeNumber Sqrt(NativeNumber a);

        [Intrinsic("sqrt")]
        public static extern float Sqrt(float a);

        [Intrinsic("sqrt")]
        public static extern double Sqrt(double a);

    }
}
