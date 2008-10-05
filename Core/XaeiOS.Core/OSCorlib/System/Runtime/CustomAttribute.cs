using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal class CustomAttribute
    {
        public Method Constructor
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public CustomAttribute()
        {
        }
    }
}
