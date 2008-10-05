using System;
using System.Runtime.CompilerServices;

namespace System.Runtime.InteropServices
{
    [Dummy]
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Constructor)]
    public class MethodCallingConventionAttribute : Attribute
    {
        private CallingConvention _callingConvention;

        public CallingConvention CallingConvention
        {
            get { return _callingConvention; }
            set { _callingConvention = value; }
        }

        public MethodCallingConventionAttribute(CallingConvention callingConvention)
        {
            _callingConvention = callingConvention;
        }
    }
}