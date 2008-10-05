using System.Diagnostics;
using System.Runtime;
using System.Collections.Generic;
using System.Reflection;

namespace System.Runtime.CompilerServices
{
    public static class RuntimeHelpers
    {
        public const string DataSegmentName = "_";
        public const string VTableFieldName = "$";

        // TODO: synchronize access to the array type cache, and other metadata caches as well
        private static Dictionary<Class, Class> _arrayTypeCache;
        private static int _hashCodeCounter;

        public static void Initialize()
        {
            _hashCodeCounter = 1;
            _arrayTypeCache = new Dictionary<Class, Class>();
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation =
            "(function(obj){var keys = []; for(var i in obj){  if(i == \"" + VTableFieldName + "\"){ continue; } keys.push(i);}; return keys;})({0})")]
        public static extern string[] GetKeys(NativeObject obj);

        // TODO: need method to generate local variable

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static int GenerateHashCode()
        {
            return _hashCodeCounter++; // TODO: Real generate hashcode method
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static int NativeGetHashCode(object obj)
        {
            XaeiOSObject xaeiosObject = XaeiOSObject.ToXaeiOSObject(obj);
            if (!var.IsDefined(var.Cast<int>(xaeiosObject.HashCode)))
            {
                xaeiosObject.HashCode = GenerateHashCode();
            }
            return xaeiosObject.HashCode;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static unsafe object Cast(XaeiOSObject obj, VTable typeVtable, bool throwError)
        {
            if (obj == null)
            {
                if (throwError)
                {
                    throw new InvalidCastException("Cannot cast null");
                }
                else
                {
                    return null;
                }
            }
            if (typeVtable == null)
            {
                throw new ExecutionEngineException("Cannot cast to null type");
            }
            bool isInterface = (typeVtable.Flags & VTableFlags.IsInterface) != 0;
            VTable vtable = obj.VTable;
            if (vtable == null)
            {
                throw new ExecutionEngineException("Could not find vtable for object");
            }
            while (vtable != null)
            {
                if (vtable == typeVtable)
                {
                    return obj;
                }
                else if (isInterface && ImplementsInterface(vtable, typeVtable))
                {
                    return obj;
                }
                else
                {
                    vtable = vtable.BaseVTable;
                }
            }
            if (throwError)
            {
                throw new InvalidCastException(string.NativeConcat(new string[] { "Cannot cast ", vtable.Class.FullName, " to type ", typeVtable.Class.FullName }));
            }
            else
            {
                return null;
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static unsafe object TryCast(XaeiOSObject obj, VTable typeVTable)
        {
            return Cast(obj, typeVTable, false);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static bool ImplementsInterface(VTable vtable, VTable interfaceVtable)
        {
            // TODO: This may not cover all cases, what if an interface implements an interface?
            NativeObject interfaces = vtable.Interfaces;
            string[] keys = GetKeys(interfaces);
            for (int i = 0; i < keys.Length; i++)
            {
                if (GenerateCodeToDereferenceVTableDataPointer(keys[i]) == interfaceVtable)
                {
                    return true;
                }
            }
            return false;
        }

        internal static unsafe bool TypesEqual(object a, object b)
        {
            if (a == null || b == null)
            {
                return false;
            }
            return (var.Cast<object>(a).Cast<NativeObject>()[VTableFieldName] == var.Cast<object>(b).Cast<NativeObject>()[VTableFieldName]);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static void InitializeMetadata()
        {
            if (Reflection.ReflectionHelpers._runtimeAssemblies == null)
            {
                Reflection.ReflectionHelpers._runtimeAssemblies = new NativeArray<Assembly>();
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Assembly CreateAssembly(string name)
        {
            Assembly assembly = new Assembly();
            assembly.Name = name;
            Reflection.ReflectionHelpers._runtimeAssemblies.Push(assembly);
            return assembly;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Class CreateClass(
            string ns, string name, Assembly assembly, UIntPtr vtableDataPointer,
            Class elementClass,
            bool isInterface, bool isArray
        )
        {
            Class klass = new Class();
            klass.Name = name;
            klass.Namespace = ns;
            klass.Assembly = assembly;
            klass.VTableDataPointer = vtableDataPointer;
            VTable vtable = GenerateCodeToDereferenceVTableDataPointer(vtableDataPointer);
            klass.VTable = vtable;
            vtable.Class = klass;
            klass.ElementClass = elementClass;
            klass.IsInterface = isInterface;
            klass.IsArray = isArray;
            assembly.Classes.Push(klass);
            return klass;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Method CreateMethod(Class declaringType, string name, NativeFunction function, int vtableSlot)
        {
            Method method = new Method();
            method.Name = name;
            method.Function = function;
            method.VTableSlot = vtableSlot;
            if (function != null)
            {
                function["m"] = var.Cast<Method>(method);
            }
            method.DeclaringClass = declaringType;
            declaringType.Methods.Push(method);
            return method;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Constructor CreateConstructor(Class declaringType, string name, NativeFunction function)
        {
            Constructor ctor = new Constructor();
            ctor.Name = name;
            ctor.Function = function;
            if (function != null)
            {
                function["m"] = var.Cast<Constructor>(ctor);
            }
            ctor.DeclaringClass = declaringType;
            declaringType.Constructors.Push(ctor);
            return ctor;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Property CreateProperty(Class declaringType, string name, Method getMethod, Method setMethod)
        {
            Property property = new Property();
            property.DeclaringClass = declaringType;
            property.Name = name;
            property.GetMethod = getMethod;
            property.SetMethod = setMethod;
            declaringType.Properties.Push(property);
            return property;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static CustomAttribute CreateCustomAttribute(ICustomAttributeProvider attributeProvider, Method constructor)
        {
            CustomAttribute attribute = new CustomAttribute();
            attribute.Constructor = constructor;
            attributeProvider.CustomAttributes.Push(attribute);
            return attribute;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static string GetMethodNameForStackTrace(NativeFunction function)
        {
            if (function == null)
            {
                throw new ArgumentException("function cannot be null");
            }
            var methodVar = function["m"];
            if (methodVar == null)
            {
                // no function metadata available
                Logging.Debug("No function metadata available for function: " + function.NativeToString());
                return null;
            }
            Method method = methodVar.Cast<Method>();
            return method.FullName;
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = DataSegmentName + "[{0}]")]
        private static extern VTable GenerateCodeToDereferenceVTableDataPointer(string dataPointer);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "_[{0}]")]
        private static extern VTable GenerateCodeToDereferenceVTableDataPointer(UIntPtr dataPointer);

        // TODO: Support multiple dimensions for Arrays
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.CriticalSection)]
        internal static Array CreateArray(VTable elementTypeVTable, int length)
        {
            Class elementType = elementTypeVTable.Class;
            Class arrayType;
            if (_arrayTypeCache.ContainsKey(elementType))
            {
                arrayType = _arrayTypeCache[elementType];
            }
            else
            {
                VTable arrayVtable = (VTable)(typeof(Array).TypeHandle);
                arrayType = CreateClass(
                    elementType.Namespace, elementType.Name,
                    elementType.Assembly, arrayVtable.Class.VTableDataPointer,
                    elementType, false, true);
                _arrayTypeCache[elementType] = arrayType;
            }

            XaeiOSObject array = var.Cast<NativeArray>(new NativeArray(length)).Cast<XaeiOSObject>();
            array.VTable = arrayType.VTable;

            return var.Cast<XaeiOSObject>(array).Cast<Array>();
        }

        // TODO: Implement this method in the compiler
        public static void InitializeArray(Array array, RuntimeFieldHandle fldHandle)
        {
            Logging.Debug("Initializing array " + array + " with value " + fldHandle);
            RuntimeType type = (RuntimeType)array.GetType();
            if (!type.Class.IsArray)
            {
                throw new SystemException("Array was not marked with class that was an array.  Class: " + type.Class);
            }
            if (type.Class.ElementClass == null)
            {
                throw new SystemException("Array was not marked with class that did not have an element class.  Class: " + type.Class);
            }
            Type elementType = Type.GetTypeFromHandle(((RuntimeTypeHandle)type.Class.ElementClass.VTable));
            if (elementType == Type.GetType("System.Int32"))
            {
                int[] intArray = var.Cast<Array>(array).Cast<int[]>();
                byte[] initialValue = var.Cast<RuntimeFieldHandle>(fldHandle).Cast<byte[]>();
                InitializeInt32Array(intArray, initialValue);
            }
            else
            {
                throw new SystemException("Cannot initialize array of type: " + elementType);
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive|MethodImplOptions.NoInlining)]
        private static void InitializeInt32Array(int[] intArray, byte[] initialValue)
        {
            GenerateCodeToInitializeInt32Array(intArray, initialValue);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.Inline, Implementation = @"
    var arrayIndex = 0;
    for (var i = 0; i < {1}.length; i++)
    {
        var whichByte = i % 4;
        if (whichByte == 0)
        {
            {0}[arrayIndex] = 0;
        }
        {0}[arrayIndex] |= {1}[i] << (whichByte * 8);
        if (whichByte == 3)
        {
            arrayIndex++;
        }
    }")]
        private static extern void GenerateCodeToInitializeInt32Array(int[] intArray, byte[] initialValue);
    }
}