

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyCompanyAttribute : Attribute
	{
		public string Company
		{
			get
			{
				return _company;
			}
		}
		string _company;
		public AssemblyCompanyAttribute(string company)
		{
			_company = company;
		}
	}
}
