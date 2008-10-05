using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal class Constructor : MethodBase
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Constructor()
        {
        }
    }
}
