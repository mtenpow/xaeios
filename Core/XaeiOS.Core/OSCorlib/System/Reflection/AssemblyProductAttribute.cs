

namespace System.Reflection
{
    [System.Runtime.CompilerServices.Dummy]
	public sealed class AssemblyProductAttribute : Attribute
	{
		public string Product
		{
			get
			{
				return _product;
			}
		}
		string _product;
		public AssemblyProductAttribute(string product)
		{
			_product = product;
		}
	}
}
