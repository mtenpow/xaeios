using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    [Intrinsic(SetVTable = false)]
    internal class XaeiOSObject : NativeObject
    {
        // TODO: Write specs for: object layout and semantics, vtable layout, native JS constructor augmentation, calling conventions, preemptive methods
        // TODO: Intrinsic properties aren't being set properly on non-intrinsic types

        [Intrinsic("$")]
        public extern VTable VTable
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("$t")]
        public extern var ThreadSync
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("$h")]
        public extern int HashCode
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0}")]
        internal static extern XaeiOSObject ToXaeiOSObject(object obj);
    }
}
