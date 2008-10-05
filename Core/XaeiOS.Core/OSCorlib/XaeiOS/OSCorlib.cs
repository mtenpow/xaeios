using System;
using System.Resources;
using System.Threading;
using System.Reflection;
using System.IO;
using System.Runtime.CompilerServices;
using System.Diagnostics;

using XaeiOS.Process;

namespace XaeiOS
{
	public static class OSCorlib
	{
        private static bool _initialized;
        private static bool _initializing;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.CriticalSection)]
        public static void Initialize()
        {
            if (_initializing)
            {
                throw new NativeError("OSCorlib already initializing");
            }
            if (_initialized)
            {
                throw new NativeError("OSCorlib already initialized");
            }
            _initializing = true;
            RuntimeHelpers.Initialize();
            Thread.Initialize();
            ThreadManager.Initialize();
            SIPManager.Initialize();
            ResourceManager.Initialize();
            DynamicLinker.Initialize();
            ReflectionHelpers.Initialize();
            Logging.Trace("Done intitializing OSCorlib");
            _initialized = true;
        }
	}
}
