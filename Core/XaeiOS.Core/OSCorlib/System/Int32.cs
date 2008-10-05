using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for Int32.
	/// </summary>
    [Intrinsic("Number", UseGlobalNamespace = true)]
    [CorlibCLRConjugate]
	public struct Int32
	{
        public const int MaxValue = 0;
        public const int MinValue = 0; // TODO: Max and Min values for number types throughout

        [Intrinsic]
        public static extern implicit operator NativeNumber(Int32 a);
        [Intrinsic]
        public static extern explicit operator Int32(NativeNumber a);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString()")]
        public override string ToString()
        {
            return this.ToString();
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString({0})")]
        public extern string ToString(int radix);

        public override int GetHashCode()
        {
            return this;
        }
	}
}
