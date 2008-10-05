

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyKeyNameAttribute : Attribute
	{
		public string KeyName
		{
			get
			{
				return _keyName;
			}
		}
		string _keyName;
		public AssemblyKeyNameAttribute(string keyName)
		{
			_keyName = keyName;
		}
	}
}
