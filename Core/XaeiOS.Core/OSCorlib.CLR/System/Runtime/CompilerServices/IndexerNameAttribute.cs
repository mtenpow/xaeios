

namespace System.Runtime.CompilerServices
{
	/// <summary>
	/// Summary description for IndexerNameAttribute.
	/// </summary>
	
	[AttributeUsage(AttributeTargets.Property, Inherited=false)]
    [Dummy]
	public sealed class IndexerNameAttribute : Attribute
	{
		public string IndexName
		{
			get
			{
				return _indexerName;
			}
		}
		private string _indexerName;

		public IndexerNameAttribute(string indexerName)
		{
			_indexerName = indexerName;
		}
	}
}
