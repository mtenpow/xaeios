

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyVersionAttribute : Attribute
	{
		public string Version
		{
			get
			{
				return _version;
			}
		}
		string _version;

		public AssemblyVersionAttribute(string version)
		{
			_version = version;
		}
	}
}
