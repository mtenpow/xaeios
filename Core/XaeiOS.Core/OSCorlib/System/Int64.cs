using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
	/// <summary>
	/// Summary description for Int64.
	/// </summary>
    [Intrinsic("Number", UseGlobalNamespace = true)]
	public struct Int64
	{
        public const long MaxValue = 0;
        public const long MinValue = 0; // TODO: Fix max and min values

        [Intrinsic]
        public static extern implicit operator NativeNumber(Int64 a);
        [Intrinsic]
        public static extern explicit operator Int64(NativeNumber a);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString()")]
        public override string ToString()
        {
            return this.ToString();
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString({0})")]
        public extern string ToString(int radix);
	}
}
