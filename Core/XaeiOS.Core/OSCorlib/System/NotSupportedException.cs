using System;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for NotSupportedException.
    /// </summary>
    [CorlibCLRConjugate]
	public class NotSupportedException : SystemException
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public NotSupportedException()
		{
        }
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public NotSupportedException(string message) : base(message)
		{
        }
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public NotSupportedException(string message, Exception innerException) : base(message,innerException)
		{
		}
	}
}
