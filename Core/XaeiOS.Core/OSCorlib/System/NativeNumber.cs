using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    [Intrinsic("Number", UseGlobalNamespace = true, SetVTable = true)]
    [CLRConjugate("XaeiOS.System.NativeNumber")]
    public unsafe struct NativeNumber
    {
        public override int GetHashCode()
        {
            return (int)this;
        }

        public override string ToString()
        {
            return NativeToString();
        }

        [Intrinsic("toString")]
        private extern string NativeToString();

        [Intrinsic]
        public static extern NativeNumber operator +(NativeNumber a, int b);
        [Intrinsic]
        public static extern NativeNumber operator +(int a, NativeNumber b);
        [Intrinsic]
        public static extern NativeNumber operator -(NativeNumber a, int b);
        [Intrinsic]
        public static extern NativeNumber operator /(NativeNumber a, int b);
        [Intrinsic]
        public static extern NativeNumber operator *(NativeNumber a, int b);
        [Intrinsic]
        public static extern bool operator >(NativeNumber a, int b);
        [Intrinsic]
        public static extern bool operator <(NativeNumber a, int b);
        [Intrinsic]
        public static extern bool operator ==(NativeNumber a, NativeNumber b);
        [Intrinsic]
        public static extern bool operator !=(NativeNumber a, NativeNumber b);

        [Intrinsic("parseInt", UseGlobalNamespace = true)]
        public static extern int ParseInt(string p);
    }
}
