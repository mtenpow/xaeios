using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    /// <summary>
    /// Description of VTable.
    /// </summary>
    [Intrinsic(SetVTable = false)]
    internal class VTable
    {
        [Intrinsic("d")]
        public extern VTableDebugInfo DebugInfo
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("f")]
        public extern VTableFlags Flags
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("b")]
        public extern VTable BaseVTable
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("c")]
        public extern Class Class
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic("i")]
        public extern NativeObject Interfaces
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic]
        public static extern explicit operator VTable(RuntimeTypeHandle typeHandle);
        [Intrinsic]
        public static extern explicit operator RuntimeTypeHandle(VTable vtable);
    }
    
    [Flags]
    internal enum VTableFlags
    {
        None = 0,
        IsInterface = 1
    }

    [Intrinsic(SetVTable = false)]
    internal class VTableDebugInfo
    {
        [Intrinsic]
        public extern NativeArray<string> Fields
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [Intrinsic]
        public extern string FullName
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }
    }
}
