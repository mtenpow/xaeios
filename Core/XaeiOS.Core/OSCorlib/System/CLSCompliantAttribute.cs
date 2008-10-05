using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for CLSCompliantAttribute.
	/// </summary>
	public sealed class CLSCompliantAttribute : Attribute
	{
		public CLSCompliantAttribute(bool isCompliant)
		{
            _isCompliant = isCompliant;
		}
		public bool IsCompliant
		{
			get
			{
				return _isCompliant;
			}
		}
		private bool _isCompliant;
 
	} 
}
