using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	public sealed class var
    {
        private object _value;

        private static readonly object Undefined = new object();

        public var()
        {
            _value = Undefined;
        }

        private var(object value)
        {
            _value = value;
        }

        public T Cast<T>()
        {
            // TODO: Use JavaScript casting rules
            return (T)_value;
        }

        public static var Cast<T>(T t)
        {
            return new var(t);
        }

        public override string ToString()
        {
            return NativeToString();
        }

        public bool InstanceOf(string typeName)
        {
            if (TypeOf() == typeName)
            {
                return true;
            }

            // instanceOf only applies to native JavaScript types

            return false;
        }

        public string TypeOf()
        {
            if (_value == null)
            {
                return "object";
            }
            if (!IsDefined())
            {
                return "undefined";
            }
            if (_value is Array)
            {
                return "object";
            }
            if (_value is string)
            {
                return "string";
            }
            if (_value is bool)
            {
                return "Boolean";
            }
            if (_value is NativeNumber)
            {
                return "Number";
            }
            // TODO: other number types
            return "object";
        }

        public bool IsDefined()
        {
            return _value != Undefined;
        }

        public bool IsNull()
        {
            return _value == null;
        }

        public bool Not()
        {
            // TODO: Use JavaScript casting rules
            throw new NotImplementedException();
        }

        public string NativeToString()
        {
            // TODO: Use JavaScript toString rules?
            return _value.ToString();
        }
    }
}