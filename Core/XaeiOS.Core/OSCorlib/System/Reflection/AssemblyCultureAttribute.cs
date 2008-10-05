

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyCultureAttribute : Attribute
	{
		public string Culture
		{
			get
			{
				return _culture;
			}
		}
		string _culture;
		public AssemblyCultureAttribute(string culture)
		{
			_culture = culture;
		}
	}
}
