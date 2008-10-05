using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for SystemException.
	/// </summary>
    [CorlibCLRConjugate]
	public class SystemException : Exception
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public SystemException()
		{
        }
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public SystemException(string message) : base(message)
		{
        }
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public SystemException(string message, Exception innerException) : base(message,innerException)
		{
		}
	}
}
