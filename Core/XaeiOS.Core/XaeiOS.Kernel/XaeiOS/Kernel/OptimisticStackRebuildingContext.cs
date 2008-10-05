using System;
using System.Runtime.CompilerServices;

namespace XaeiOS.Kernel
{
    public class OptimisticStackRebuildingContext : NativeObject
    {
        public object This;
        public NativeFunction Function;
        public Continuation Continuation;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public OptimisticStackRebuildingContext(object self, NativeFunction function)
        {
            This = self;
            Function = function;
        }
    }
}