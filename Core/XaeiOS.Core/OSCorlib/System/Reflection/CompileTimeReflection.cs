using System;
using System.Runtime.CompilerServices;

namespace System.Reflection
{
    [Dummy]
    public static class CompileTimeReflection
    {
        [XaeiOSMethodImpl(MethodImplOptions.CompilerImpl)]
        public static extern string GetTypeName<T>();
    }
}