using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for ArgumentOutOfRangeException.
    /// </summary>
    [CorlibCLRConjugate]
	public class ArgumentOutOfRangeException : ArgumentException
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public ArgumentOutOfRangeException(String message)
            : base(message)
		{
		}
	}
}
