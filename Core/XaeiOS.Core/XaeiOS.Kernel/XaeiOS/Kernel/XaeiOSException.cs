using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace XaeiOS.Kernel
{
    public sealed class XaeiOSException
    {
        // TODO: Use explicit field layout here to set _throwContext to field slot 0
        public Continuation ThrowContext;

        [Intrinsic]
        public static extern explicit operator XaeiOSException(Exception e);

        [Intrinsic]
        public static extern explicit operator Exception(XaeiOSException d);
    }
}