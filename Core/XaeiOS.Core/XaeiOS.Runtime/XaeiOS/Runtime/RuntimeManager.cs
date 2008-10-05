using System;
using System.Collections.Generic;

namespace XaeiOS.Runtime
{
    public static class RuntimeManager
    {
        public static void Start()
        {
            Initialize();
        }

        private static void Initialize()
        {
            // initialize other components
            AssemblyManager.Initialize();
            AppDomainManager.Initialize();
        }

        private static uint _runtimeIdCounter = 1;
        public static uint GenerateRuntimeId()
        {
            return ++_runtimeIdCounter;
        }
    }
}
