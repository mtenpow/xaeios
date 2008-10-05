using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace System.Collections
{
    [CorlibCLRConjugate]
    public interface IList
    {
        object this[int index]
        {
            get;
            set;
        }
        void Add(object item);
        void Clear();
        int Count
        {
            get;
        }
    }
}
