using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    /// <summary>
    /// Represents a Unicode character.
    /// </summary>
    [Intrinsic("String", UseGlobalNamespace = true, SetVTable = false)]
    [CorlibCLRConjugate]
    public struct Char
    {
        /// <summary>
        /// The maximum character value.
        /// </summary>
        public const char MaxValue = (char)0xFFFF;

        /// <summary>
        /// The minimum character value.
        /// </summary>
        public const char MinValue = (char)0;

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.match({0})")]
        public extern bool Match(string regex);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}")]
        public override string ToString()
        {
            return (string)this;
        }

        [Intrinsic]
        public static extern explicit operator string(char c);

        [Intrinsic]
        public static extern explicit operator char(string s);
    }
}
