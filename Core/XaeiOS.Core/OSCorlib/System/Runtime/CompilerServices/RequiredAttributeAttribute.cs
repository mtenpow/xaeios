using System;

namespace System.Runtime.CompilerServices
{
    [AttributeUsageAttribute(
        AttributeTargets.Class|AttributeTargets.Struct|AttributeTargets.Enum|AttributeTargets.Interface,
        AllowMultiple = true,
        Inherited = false)]
    public sealed class RequiredAttributeAttribute : Attribute
    {
    }

}
