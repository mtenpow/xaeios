using System.Runtime.CompilerServices;

namespace System.Collections
{
    [CorlibCLRConjugate]
    public interface IEnumerable
	{
        IEnumerator GetEnumerator();
    }

    [CorlibCLRConjugate]
    public interface IEnumerator : IDisposable
    {
        object Current
        {
            get;
        }
        bool MoveNext();
        void Reset();
    }
}
