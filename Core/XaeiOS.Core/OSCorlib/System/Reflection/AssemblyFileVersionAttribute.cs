

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyFileVersionAttribute : Attribute
	{
		public string Version
		{
			get
			{
				return _version;
			}
		}
        string _version;
        public AssemblyFileVersionAttribute(string version)
		{
            _version = version;
		}
	}
}
