using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal class MethodBase : ICustomAttributeProvider
    {
        public Class DeclaringClass
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Class ReturnType
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

        public NativeFunction Function
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public NativeArray<Parameter> Parameters
        {
            get
            {
                return _parameters;
            }
        }
        private NativeArray<Parameter> _parameters = new NativeArray<Parameter>();

        public NativeArray<CustomAttribute> CustomAttributes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _customAttributes; }
        }
        private NativeArray<CustomAttribute> _customAttributes = new NativeArray<CustomAttribute>();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public MethodBase()
        {
        }

        public override string ToString()
        {
            return FullName;
        }
    }
}
