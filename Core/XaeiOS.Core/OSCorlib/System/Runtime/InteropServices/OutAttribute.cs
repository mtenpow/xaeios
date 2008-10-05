

namespace System.Runtime.InteropServices
{
    [AttributeUsage(AttributeTargets.Parameter)]
    [System.Runtime.CompilerServices.Dummy]
    public sealed class OutAttribute : Attribute
    {
        public OutAttribute()
        {
        }
    }

    [AttributeUsage(AttributeTargets.Parameter)]
    [System.Runtime.CompilerServices.Dummy]
    public sealed class XaeiOSOutAttribute : Attribute
    {
        private bool _isOut;
        public bool IsOut
        {
            get
            {
                return _isOut;
            }
            set
            {
                _isOut = value;
            }
        }

        public XaeiOSOutAttribute(bool isOut)
        {
            _isOut = isOut;
        }
    }
}
