using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

using XaeiOS;

namespace XaeiOS.Process.ImageFormat
{
    internal class ObjectImage
    {
        public AssemblyName Name;
        public NativeObject Header;

        /// <summary>
        /// Number of methods in code section
        /// </summary>
        public long MethodCount;
        public long CodeStreamLength;
        public string CodeStream; // TODO: use streams instead

        /// <summary>
        /// Number of data slots in data section
        /// </summary>
        public long DataCount;
        public long DataStreamLength;
        public string DataStream; // TODO: Use streams instead

        public long InitializationStreamLength;
        public string InitializationStream; // TODO: use streams instead

        public long ModuleImageCodeStoreIndex;
        public long ModuleImageDataStoreIndex;

        public NativeArray<KeyValuePair<uint, string>> CodeSectionFixups; // TODO: Use List<T>
        public NativeArray<KeyValuePair<uint, string>> DataSectionFixups;
        public NativeArray<KeyValuePair<uint, string>> InitializationSectionFixups;

        public NativeObject GetMetadata()
        {
            return Header["Metadata"].Cast<NativeObject>();
        }
        public NativeArray<var> GetFixups()
        {
            return Header["Fixups"].Cast<NativeArray<var>>();
        }
    }
}
