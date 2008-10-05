

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyConfiguration : Attribute
	{
		public string Configuration
		{
			get
			{
				return _configuration;
			}
		}
		string _configuration;
		public AssemblyConfiguration(string configuration)
		{
			_configuration = configuration;
		}
	}
}
