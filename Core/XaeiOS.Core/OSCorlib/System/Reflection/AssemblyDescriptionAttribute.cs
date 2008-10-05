

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyDescriptionAttribute : Attribute
	{
		public string Description
		{
			get
			{
				return _description;
			}
		}
		string _description;
		public AssemblyDescriptionAttribute(string description)
		{
			_description = description;
		}
	}
}
