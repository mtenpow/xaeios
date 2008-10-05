

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyTrademarkAttribute : Attribute
	{
		public string Trademark
		{
			get
			{
				return _trademark;
			}
		}
		string _trademark;
		public AssemblyTrademarkAttribute(string trademark)
		{
			_trademark = trademark;
		}
	}
}
