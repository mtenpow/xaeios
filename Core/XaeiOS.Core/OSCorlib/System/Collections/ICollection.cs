using System.Runtime.CompilerServices;

namespace System.Collections
{
    [CorlibCLRConjugate]
    public interface ICollection : IEnumerable
    {
        int Count { get; }
        bool IsSynchronized { get; }
        object SyncRoot { get; }

        void CopyTo(Array array, int index);
	}
}