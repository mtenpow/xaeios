

namespace System.Runtime.CompilerServices
{
	/// <summary>
	/// Summary description for MethodImplAttribute.
	/// </summary>
	[AttributeUsage(AttributeTargets.Method)]
	public sealed class MethodImplAttribute : System.Attribute
	{
		public MethodImplAttribute(short optionsValue)
		{
			throw new NotSupportedException();
			//_options = optionsValue;
		}
		public MethodImplAttribute(MethodImplOptions options)
		{
			_options = options;
		}

		internal MethodImplOptions Options
		{
			get
			{
				return _options;
			}
		}
		private MethodImplOptions _options;

    }

    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Constructor)]
    public class XaeiOSMethodImplAttribute : System.Attribute
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
