

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyCopyrightAttribute : Attribute
	{
		public string Copyright
		{
			get
			{
				return _copyright;
			}
		}
		string _copyright;
		public AssemblyCopyrightAttribute(string copyright)
		{
			_copyright = copyright;
		}
	}
}
