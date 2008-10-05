

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyDelaySignAttribute : Attribute
	{
		public bool DelaySign
		{
			get
			{
				return _delaySign;
			}
		}
		bool _delaySign;
		public AssemblyDelaySignAttribute(bool delaySign)
		{
			_delaySign = delaySign;
		}
	}
}
