using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for Boolean.
	/// </summary>
	
    [Intrinsic("Boolean",UseGlobalNamespace = true)]
    [CorlibCLRConjugate]
	public struct Boolean
	{
		/// <value>
		/// The String representation of Boolean False
		/// </value>
		public static readonly string FalseString;

		/// <value>
		/// The String representation of Boolean True
		/// </value>	
		public static readonly string TrueString;
	
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		static Boolean () 
		{
			FalseString = "False";
			TrueString = "True";
		}
	}
}
