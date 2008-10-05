using System;
namespace System.Runtime.InteropServices
{
    [AttributeUsage(AttributeTargets.Field)]
    [System.Runtime.CompilerServices.Dummy]
    public sealed class FieldOffsetAttribute : Attribute
    {
        public int Value
        {
            get
            {
                return _value;
            }
        }
        private int _value;

        public FieldOffsetAttribute(int offset)
        {
            _value = offset;
        }
    }
}