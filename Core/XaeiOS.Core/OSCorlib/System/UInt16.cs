using System.Runtime.InteropServices;

namespace System
{
	/// <summary>
	/// Summary description for UInt16.
	/// </summary>
	[CLSCompliant(false)]
    [Intrinsic("Number", UseGlobalNamespace = true)]
	public struct UInt16
	{
		public const ushort MaxValue = 0xffff;
		public const ushort MinValue = 0;
	}
}
