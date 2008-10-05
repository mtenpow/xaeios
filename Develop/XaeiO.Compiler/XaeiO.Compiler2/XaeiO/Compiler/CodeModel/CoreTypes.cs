using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public static class CoreTypes
    {
        private static AssemblyDefinition _corlib;
        public static AssemblyDefinition Corlib
        {
            get
            {
                return _corlib;
            }
            set
            {
                _corlib = value;
                _object = _string = _int32 = _int64 = _single = _double
                    = _array = _boolean = _double = _enum = _exception = _multicastDelegate
                    = _valueType = _void = null;
            }
        }
        static CoreTypes()
        {
            _corlib = AssemblyFactory.GetAssembly(typeof(object).Assembly.Location);
        }

        public static bool IsVoid(TypeReference type)
        {
            return type.FullName == "System.Void";
        }

        public static TypeReference GetCoreType(string fullName)
        {
            TypeReference ret = _corlib.MainModule.Types[fullName];
            if (ret == null)
            {
                throw new CompilerException("Could not get core type: " + fullName);
            }
            return ret;
        }

        public static TypeReference Object
        {
            get
            {
                if (_object == null)
                {
                    _object = GetCoreType("System.Object");
                }
                return _object;
            }
        }
        private static TypeReference _object;

        public static TypeReference String
        {
            get
            {
                if (_string == null)
                {
                    _string = GetCoreType("System.String");
                }
                return _string;
            }
        }
        private static TypeReference _string;

        public static TypeReference Int32
        {
            get
            {
                if (_int32 == null)
                {
                    _int32 = GetCoreType("System.Int32");
                }
                return _int32;
            }
        }
        private static TypeReference _int32;

        public static TypeReference Int64
        {
            get
            {
                if (_int64 == null)
                {
                    _int64 = GetCoreType("System.Int64");
                }
                return _int64;
            }
        }
        private static TypeReference _int64;

        public static TypeReference Single
        {
            get
            {
                if (_single == null)
                {
                    _single = GetCoreType("System.Single");
                }
                return _single;
            }
        }
        private static TypeReference _single;

        public static TypeReference Double
        {
            get
            {
                if (_double == null)
                {
                    _double = GetCoreType("System.Double");
                }
                return _double;
            }
        }
        private static TypeReference _double;

        public static TypeReference Boolean
        {
            get
            {
                if (_boolean == null)
                {
                    _boolean = GetCoreType("System.Boolean");
                }
                return _boolean;
            }
        }
        private static TypeReference _boolean;

        public static TypeReference Void
        {
            get
            {
                if (_void == null)
                {
                    _void = GetCoreType("System.Void");
                }
                return _void;
            }
        }
        private static TypeReference _void;

        public static TypeReference Delegate
        {
            get
            {
                if (_delegate == null)
                {
                    _delegate = GetCoreType("System.Delegate");
                }
                return _delegate;
            }
        }
        private static TypeReference _delegate;

        public static TypeReference MulticastDelegate
        {
            get
            {
                if (_multicastDelegate == null)
                {
                    _multicastDelegate = GetCoreType("System.MulticastDelegate");
                }
                return _multicastDelegate;
            }
        }
        private static TypeReference _multicastDelegate;

        public static TypeReference Exception
        {
            get
            {
                if (_exception == null)
                {
                    _exception = GetCoreType("System.Exception");
                }
                return _exception;
            }
        }
        private static TypeReference _exception;

        public static TypeReference Array
        {
            get
            {
                if (_array == null)
                {
                    _array = GetCoreType("System.Array");
                }
                return _array;
            }
        }
        private static TypeReference _array;

        public static TypeReference ValueType
        {
            get
            {
                if (_valueType == null)
                {
                    _valueType = GetCoreType("System.ValueType");
                }
                return _valueType;
            }
        }
        private static TypeReference _valueType;

        public static TypeReference Enum
        {
            get
            {
                if (_enum == null)
                {
                    _enum = GetCoreType("System.Enum");
                }
                return _enum;
            }
        }
        private static TypeReference _enum;
    }
}
