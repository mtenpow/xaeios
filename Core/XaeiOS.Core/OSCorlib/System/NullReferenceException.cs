using System;
using System.Runtime.CompilerServices;

namespace System
{
    /// <summary>
    /// Summary description for NullReferenceException.
    /// </summary>
    [CorlibCLRConjugate]
    public class NullReferenceException : SystemException
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public NullReferenceException()
        {
        }
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public NullReferenceException(string message)
            : base(message)
        {
        }
        public NullReferenceException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
