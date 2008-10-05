using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for Single.
	/// </summary>
    [Intrinsic("Number", UseGlobalNamespace = true)]
    [CorlibCLRConjugate]
	public struct Single //TODO Implement: IComparable, IFormattable, IConvertible
	{
		public const float MaxValue =  3.40282346638528859e38f;
		public const float MinValue = -3.40282346638528859e38f;
	}
}
