

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyTitleAttribute : Attribute
	{
		public string Title
		{
			get
			{
				return _title;
			}
		}
		string _title;
		public AssemblyTitleAttribute(string title)
		{
			_title = title;
		}
	}
}
