using System.Runtime.InteropServices;

namespace System
{
	/// <summary>
	/// Summary description for Sbyte.
	/// </summary>
	[CLSCompliant(false)]
    [Intrinsic("Number", UseGlobalNamespace = true)]
	public struct SByte
	{
		public const sbyte MinValue = -128;
		public const sbyte MaxValue = 127;
	}
}
