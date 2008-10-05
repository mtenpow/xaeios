using System;
using System.Collections.Generic;

namespace XaeiOS.Runtime
{
    public static class AssemblyManager
    {
        private static NativeObject _loadedAssemblies;
        private static NativeObject _cachedAssemblies;

        public static void LoadAssembly(Assembly assembly)
        {
            _loadedAssemblies[assembly.StrongName] = var.Cast<Assembly>(assembly);
        }

        public static Assembly GetLoadedAssembly(string strongName)
        {
            if (_loadedAssemblies.ContainsKey(strongName))
            {
                return _loadedAssemblies[strongName].Cast<Assembly>();
            }
            else
            {
                return null;
            }
        }

        internal static void Initialize()
        {
            _loadedAssemblies = new NativeObject();
            _cachedAssemblies = new NativeObject();
        }
    }
}