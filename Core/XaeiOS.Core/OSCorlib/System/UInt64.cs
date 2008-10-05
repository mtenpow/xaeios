using System.Runtime.InteropServices;

namespace System
{
    /// <summary>
    /// Summary description for UInt64.
    /// </summary>
    [CLSCompliant(false)]
    [Intrinsic("Number", UseGlobalNamespace = true)]
    public struct UInt64 //TODO: Implement : IComparable, IFormattable, IConvertible
    {
        public const ulong MinValue = 0;
        public const ulong MaxValue = 0; // TODO: Min and Max values
    }
}
