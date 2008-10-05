using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System.Collections
{
    [CLSCompliant(false)]
    [CorlibCLRConjugate]
    public class Queue : ICollection, ICloneable
    {
        public virtual int Count
        {
            get
            {
                return _internalArray.Length;
            }
        }
        public virtual bool IsSynchronized { get; private set; }
        public virtual object SyncRoot { get; private set; }

        private NativeArray<object> _internalArray;

        public Queue()
        {
            _internalArray = new NativeArray<object>();
        }
        public Queue(ICollection col)
            : this()
        {
            throw new NotImplementedException();
            /*
            foreach (object obj in col)
            {
                Enqueue(obj);
            }*/
        }

        public virtual void Clear()
        {
            _internalArray = new NativeArray<object>();
        }

        public virtual object Clone()
        {
            return new Queue(this);
        }

        public virtual bool Contains(object obj)
        {
            for (int i = 0; i < _internalArray.Length; i++)
            {
                if (_internalArray[i].Equals(obj))
                {
                    return true;
                }
            }

            return false;
        }

        public virtual void CopyTo(Array array, int index)
        {
            throw new NotImplementedException();
        }

        public virtual object Dequeue()
        {
            return _internalArray.Shift();
        }

        public virtual void Enqueue(object obj)
        {
            _internalArray.Push(obj);
        }

        public virtual IEnumerator GetEnumerator()
        {
            throw new NotImplementedException();
        }

        public virtual object Peek()
        {
            if (Count > 0)
            {
                return _internalArray[0];
            }
            else
            {
                return null;
            }
        }

        public static Queue Synchronized(Queue queue)
        {
            // TODO: queue.synchronized
            return queue;
        }
        public virtual object[] ToArray()
        {
            throw new NotImplementedException();
        }
        public virtual void TrimToSize()
        {
            throw new NotImplementedException();
        }

    }
}
