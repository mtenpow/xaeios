

namespace System.Runtime.InteropServices
{
	/// <summary>
	/// Summary description for StructLayoutAttribute.
	/// </summary>

    [System.Runtime.CompilerServices.Dummy]
	public sealed class StructLayoutAttribute : Attribute
	{
		public LayoutKind Kind
		{
			get
			{
				return _kind;
			}
		}
		LayoutKind _kind;

		public int Size;

		public StructLayoutAttribute(LayoutKind kind)
		{
			_kind = kind;
		}
	}
}
