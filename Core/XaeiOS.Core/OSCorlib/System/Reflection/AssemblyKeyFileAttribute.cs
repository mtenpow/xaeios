

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyKeyFileAttribute : Attribute
	{
		public string KeyFile
		{
			get
			{
				return _keyFile;
			}
		}
		string _keyFile;
		public AssemblyKeyFileAttribute(string keyFile)
		{
			_keyFile = keyFile;
		}
	}
}
