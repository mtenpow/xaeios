using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal unsafe class Assembly : ICustomAttributeProvider
    {
        public string Name
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public NativeArray<Class> Classes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _classes; }
        }
        private NativeArray<Class> _classes = new NativeArray<Class>();

        public NativeArray<CustomAttribute> CustomAttributes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _customAttributes; }
        }
        private NativeArray<CustomAttribute> _customAttributes = new NativeArray<CustomAttribute>();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Assembly()
        {
        }
    }
}
