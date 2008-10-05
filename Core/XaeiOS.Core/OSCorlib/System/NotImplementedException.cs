using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for NotImplementedException.
    /// </summary>
    [CorlibCLRConjugate]
	public class NotImplementedException : SystemException
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public NotImplementedException()
		{
		}

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public NotImplementedException(string message) : base(message)
        {
        }
	}
}
