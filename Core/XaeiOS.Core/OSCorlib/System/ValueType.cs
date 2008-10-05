using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
	/// <summary>
	/// Provides the base class for value types.
	/// </summary>
    [CLSCompliant(false)]
    [CorlibCLRConjugate]
    [Dummy]
	public abstract class ValueType
    {
        [Intrinsic]
        public static extern bool operator ==(ValueType a, ValueType b);
        [Intrinsic]
        public static extern bool operator !=(ValueType a, ValueType b);
	}
}
