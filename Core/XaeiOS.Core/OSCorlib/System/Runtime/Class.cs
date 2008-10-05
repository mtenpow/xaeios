using System;
using System.Runtime;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Runtime
{
    internal unsafe class Class : ICustomAttributeProvider
    {
        public Assembly Assembly
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

        public string Namespace
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Class DeclaringClass
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Class BaseClass
        {
            get
            {
                if (VTable.BaseVTable == null)
                {
                    return null;
                }
                return VTable.BaseVTable.Class;
            }
        }

        public VTable VTable
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public UIntPtr VTableDataPointer
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        // TODO: This is temp property. there should be Class flags and this should check those flags
        public bool IsInterface
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        // TODO: This is temp property. there should be Class flags and this should check those flags
        public bool IsArray
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public Class ElementClass
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
                return (DeclaringClass != null ? DeclaringClass.FullName : Namespace) + "." + Name;
            }
        }

        public NativeArray<Method> Methods
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _methods;
            }
        }
        private NativeArray<Method> _methods = new NativeArray<Method>();

        public NativeArray<Constructor> Constructors
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _constructors;
            }
        }
        private NativeArray<Constructor> _constructors = new NativeArray<Constructor>();

        public NativeArray<Property> Properties
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _properties;
            }
        }
        private NativeArray<Property> _properties = new NativeArray<Property>();

        public NativeArray<CustomAttribute> CustomAttributes
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _customAttributes; }
        }
        private NativeArray<CustomAttribute> _customAttributes = new NativeArray<CustomAttribute>();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Class()
        {
        }

        public override string ToString()
        {
            return FullName;
        }
    }
}
