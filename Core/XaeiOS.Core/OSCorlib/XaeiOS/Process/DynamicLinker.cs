using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

using XaeiOS;
using XaeiOS.Process.ImageFormat;

namespace XaeiOS.Process
{
    internal class DynamicLinker
    {
        private static bool _initialized;
        private static bool _initializing;
        private static string _osCorlibObjectImageData;

        public static void Initialize()
        {
            if (_initialized)
            {
                throw new NativeError("DynamicLinker is already initialized");
            }
            if (_initializing)
            {
                throw new NativeError("DynamicLinker is already initializing");
            }
            _initializing = true;
            _osCorlibObjectImageData = null;
            _initialized = true;
        }

        private AssemblyName _entryPointImage;

        public AssemblyName LoadObjectImage(string objectImageData)
        {
            throw new Exception("Not yet implemented");
        }

        public void SetEntryPointObjectImage(AssemblyName entryPointImage)
        {
            _entryPointImage = entryPointImage;
        }

        public void Link()
        {
        }

    }
}
