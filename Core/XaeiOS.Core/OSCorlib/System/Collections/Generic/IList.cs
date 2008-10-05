using System.Runtime.CompilerServices;

namespace System.Collections.Generic
{
    [CorlibCLRConjugate]
    public interface IList<T> : IEnumerable<T>
    {
        T this[int index]
        {
            get;
            set;
        }
        void Add(T item);
        void Clear();
        int Count
        {
            get;
        }
    }
}
