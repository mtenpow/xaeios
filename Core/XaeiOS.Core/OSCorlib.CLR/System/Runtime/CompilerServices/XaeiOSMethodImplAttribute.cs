

namespace System.Runtime.CompilerServices
{
    [Dummy]
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Constructor)]
    public class XaeiOSMethodImplAttribute : Attribute
    {
        public XaeiOSMethodImplAttribute(MethodImplOptions options)
        {
            _options = options;
        }


        public MethodImplOptions Options
        {
            get
            {
                return _options;
            }
        }
        private MethodImplOptions _options;

        public string Implementation
        {
            get
            {
                return _implementation;
            }
            set
            {
                _implementation = value;
            }
        }
        private string _implementation;

    }
}
