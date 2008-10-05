using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal class Property : ICustomAttributeProvider
    {
        public Class DeclaringClass
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Class Type
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public string Name
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public string FullName
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return DeclaringClass.FullName + "::" + Name;
            }
        }

        public Method GetMethod
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Method SetMethod
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Property()
        {
        }

        public NativeArray<CustomAttribute> CustomAttributes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _customAttributes; }
        }
        private NativeArray<CustomAttribute> _customAttributes = new NativeArray<CustomAttribute>();
    }
}
