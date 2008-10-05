using System.Runtime.InteropServices;

namespace System
{
	/// <summary>
	/// Summary description for UInt32.
	/// </summary>
	[CLSCompliant(false)]
    [Intrinsic("Number", UseGlobalNamespace = true)]
	public struct UInt32 //TODO: Implement : IComparable, IFormattable, IConvertible
    {
        public const uint MinValue = 0;
        public const uint MaxValue = 0; // TODO: Min and Max values
	}
}
