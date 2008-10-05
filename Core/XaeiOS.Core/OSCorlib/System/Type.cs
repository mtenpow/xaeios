using System.Runtime.CompilerServices;
using System.Reflection;

namespace System
{
    /// <summary>
    /// Represents type declarations: class types, interface types, array types, value types, and enumeration types.
    /// </summary>
    public abstract class Type : MemberInfo
    {
        public abstract string Namespace
        {
            get;
        }

        public string FullName
        {
            get
            {
                return Namespace + "." + Name; // TODO: Add declaring type!!
            }
        }

        public abstract PropertyInfo[] GetProperties();
        public abstract MethodInfo[] GetMethods();
        public abstract ConstructorInfo[] GetConstructors();

        public virtual RuntimeTypeHandle TypeHandle
        {
            get
            {
                return _typeHandle;
            }
        }
        private RuntimeTypeHandle _typeHandle;

        public Type(RuntimeTypeHandle typeHandle)
        {
            _typeHandle = typeHandle;
        }

        public override string ToString()
        {
            // TODO: Declaring type name
            return Namespace + "." + Name;
        }

        public static Type GetTypeFromHandle(RuntimeTypeHandle handle)
        {
            return ReflectionHelpers.GetTypeFromHandle(handle);
        }

        public static Type GetType(string typeName)
        {
            return ReflectionHelpers.GetTypeByName(typeName);
        }
    }
}
