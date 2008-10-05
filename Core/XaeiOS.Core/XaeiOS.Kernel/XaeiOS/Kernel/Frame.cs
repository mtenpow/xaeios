using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace XaeiOS.Kernel
{
    [Intrinsic("Array", UseGlobalNamespace = true, SetVTable = false)]
    public class Frame : NativeArray
    {
        // TODO: Use FieldLayout attribute to ensure this is structured properly
        public object This;
        public NativeFunction Function;

        // params follow
        // locals follow
        // rest of stack...

        [Intrinsic("$ecp")]
        public extern int ExceptionCatchPointer
        {
            get;
            set;
        }

        [Intrinsic("$e")]
        public extern Exception Exception
        {
            get;
            set;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Frame(object self, NativeFunction function)
        {
            This = self;
            Function = function;
        }
    }
}