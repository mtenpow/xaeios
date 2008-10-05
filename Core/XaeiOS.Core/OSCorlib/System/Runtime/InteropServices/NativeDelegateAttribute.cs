using System;
using System.Runtime.CompilerServices;

namespace System.Runtime.InteropServices
{
    [AttributeUsage(AttributeTargets.Delegate)]
    public class NativeDelegateAttribute : Attribute
    {
        public NativeDelegateAttribute()
        {
        }
    }
}