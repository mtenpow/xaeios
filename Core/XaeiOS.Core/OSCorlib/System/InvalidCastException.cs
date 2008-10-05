using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for InvalidCastException.
	/// </summary>
	public class InvalidCastException : Exception
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public InvalidCastException(string message) : base(message)
		{
		}
	}
}
