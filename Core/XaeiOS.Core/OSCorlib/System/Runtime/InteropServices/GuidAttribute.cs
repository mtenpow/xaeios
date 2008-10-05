using System;

namespace System.Runtime.InteropServices
{
    [AttributeUsageAttribute(
        AttributeTargets.Assembly |
        AttributeTargets.Class |
        AttributeTargets.Struct |
        AttributeTargets.Enum |
        AttributeTargets.Interface |
        AttributeTargets.Delegate,
        Inherited = false)]
    public sealed class GuidAttribute : Attribute
    {
    }

}
