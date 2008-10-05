using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal class Method : MethodBase
    {
        public int VTableSlot
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Method()
        {
        }
    }
}
