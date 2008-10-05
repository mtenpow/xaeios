using System.Runtime.CompilerServices;
using System.Runtime;

namespace System.Diagnostics
{
    public static class ObjectDebugger
    {
        private const string DebugFullNameKey = "FullName";
        private const string DebugFieldsKey = "Fields";
        private const string DebugBaseKey = "Base";

        private static XaeiOSObject _object;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static VTable GetSystemObjectVTable()
        {
            if (_object == null)
            {
                _object = XaeiOSObject.ToXaeiOSObject(new object());
            }
            return _object.VTable;
        }

        public static string GetTypeFullName(object obj)
        {
            return obj.GetType().FullName;
        }

        [CLSCompliant(false)]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static NativeObject DebugObject(object obj)
        {
            XaeiOSObject xaeiosObject = XaeiOSObject.ToXaeiOSObject(obj);
            VTable vtable = xaeiosObject.VTable;
            if (vtable == null)
            {
                throw new NativeError("ObjectDebugger can only debug managed objects.");
            }
            return BuildDebuggableObject(xaeiosObject, vtable, new IntRef());
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static NativeObject BuildDebuggableObject(XaeiOSObject xaeiosObject, VTable vtable, IntRef fieldCounter)
        {
            NativeObject debuggableObject = new NativeObject();

            // add fields from base class
            // update field counter along the way so that we know which slots correspond to which field names
            if (vtable != GetSystemObjectVTable())
            {
                debuggableObject[DebugBaseKey] = var.Cast<NativeObject>(BuildDebuggableObject(
                    xaeiosObject,
                    vtable.BaseVTable,
                    fieldCounter
                ));
            }

            // retreive debug information for class through vtable
            VTableDebugInfo debugInfo = vtable.DebugInfo;

            // apply debug information to object instance
            {
                debuggableObject["FullName"] = var.Cast<string>(debugInfo.FullName);

                // fields
                NativeArray<string> fieldNames = debugInfo.Fields;
                for (int i = 0; i < fieldNames.Length; i++)
                {
                    debuggableObject[fieldNames[i]] = xaeiosObject[fieldCounter.Value + i];
                }
                fieldCounter.Value += fieldNames.Length;
            }

            return debuggableObject;
        }

        private class IntRef
        {
            public int Value;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public IntRef()
            {
                Value = 0;
            }
        }
    }
}