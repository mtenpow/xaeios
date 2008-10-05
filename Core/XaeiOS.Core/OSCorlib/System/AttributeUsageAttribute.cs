

namespace System
{
	/// <summary>
	/// Summary description for AttributeUsageAttribute.
	/// </summary>
	[AttributeUsage(AttributeTargets.Class)]
	public sealed class AttributeUsageAttribute : Attribute
	{
		public bool AllowMultiple 
		{
			get
			{
				return _allowMultiple;
			}
			set
			{
				_allowMultiple = value;
			}
		}
		private bool _allowMultiple;

		public bool Inherited
		{
			get
			{
				return _inherited;
			}
			set
			{
				_inherited = value;
			}
		}
		private bool _inherited;

		public AttributeTargets ValidOn
		{
			get
			{
				return _validOn;
			}
		}
		private AttributeTargets _validOn;

		public AttributeUsageAttribute(AttributeTargets validOn)
		{
			_validOn = validOn;
		}

		/// <summary>
		/// Private constructor for System.AttributeusageAttribute.Default
		/// </summary>
		private AttributeUsageAttribute() : this(AttributeTargets.All)
		{
		}

		internal static readonly AttributeUsageAttribute Default = new AttributeUsageAttribute();

	}
}
