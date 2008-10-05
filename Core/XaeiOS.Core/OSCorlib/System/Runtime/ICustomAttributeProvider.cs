using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal interface ICustomAttributeProvider
    {
        NativeArray<CustomAttribute> CustomAttributes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
        }
    }
}
