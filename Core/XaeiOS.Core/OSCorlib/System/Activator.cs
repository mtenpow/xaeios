using System.Reflection;
using System.Runtime.CompilerServices;

namespace System
{
	public static class Activator
    {
        public static object CreateInstance(Type type)
        {
            // TODO: Use Type::UnderlyingSystemType
            RuntimeType runtimeType = type as RuntimeType;
            if (runtimeType == null)
            {
                throw new ArgumentException("Invalid type: " + type);
            }
            return runtimeType.CreateInstance();
        }

        public static T CreateInstance<T>(Type type)
        {
            // TODO: Check that type is assignable from T
            return (T)CreateInstance(type);
        }
	}
}
