using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for ArgumentException.
    /// </summary>
    [CorlibCLRConjugate]
	public class ArgumentException : Exception
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public ArgumentException(String message) : base(message)
		{
		}
	}
}
