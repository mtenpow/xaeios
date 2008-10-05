using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace XaeiOS.Kernel
{
    [CLSCompliant(false)]
    [Intrinsic("Array", UseGlobalNamespace = true, SetVTable = false)]
    public class Continuation
    {
        // TODO: XaeiO.Compiler2 does not properly emit getters for Intrinsic types

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Initialize()
        {
        }

        // TODO: Use explicit field layout to ensure continuation is laid out properly
        public int ExecutionPointer;
        public long TimeSlice;
        public var ReturnValue;
        public Continuation ParentContinuation;
        public Frame Frame;

        // registers follow

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Continuation()
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static Continuation Create(object self, NativeFunction function)
        {
            Continuation c = new Continuation();
            c.ExecutionPointer = 1;
            c.ParentContinuation = null;
            c.Frame = new Frame(self, function);
            return c;
        }
    }
}