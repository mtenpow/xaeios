using System.Runtime.CompilerServices;

namespace System.Collections.Generic
{
    [CorlibCLRConjugate]
    public interface IEnumerable<T> : IEnumerable
	{
        IEnumerator<T> GetEnumerator();
    }

    [CorlibCLRConjugate]
    public interface IEnumerator<T> : IEnumerator, IDisposable
    {
        T Current
        {
            get;
        }
    }
}
