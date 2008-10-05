using System.Runtime.CompilerServices;

namespace System.Collections.Generic
{
    [CorlibCLRConjugate]
    public interface ICollection<T> : IEnumerable<T>
    {
        int Count { get; }
        bool IsReadOnly { get; }
        void Add(T item);
        bool Contains(T item);
        void CopyTo(T[] array, int arrayIndex);
        bool Remove(T item);
	}
}
