using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace System.Collections.Generic
{
    [CorlibCLRConjugate]
	public class List<T> : IList<T>, IList
	{
        private NativeArray<T> _array = new NativeArray<T>();

        #region IList<T> Members

        public virtual T this[int index]
        {
            get
            {
                if (index < 0 || index >= Count)
                {
                    throw new ArgumentException("Argument out of range");
                }
                return _array[index];
            }
            set
            {
                if (index < 0 || index >= Count)
                {
                    throw new ArgumentException("Argument out of range");
                }
                _array[index] = value;
            }
        }

        object IList.this[int index]
        {
            get
            {
                return this[index];
            }
            set
            {
                this[index] = (T)value;
            }
        }

        public virtual void Clear()
        {
            _count = 0;
            _array.Length = 0;
        }

        public virtual void Add(T item)
        {
            _array[_count++] = item;
        }

        void IList.Add(object item)
        {
            this.Add((T)item);
        }

        public virtual int Count
        {
            get { return _count; }
        }
        private int _count;

        #endregion

        #region IEnumerable<T> Members

        public virtual IEnumerator<T> GetEnumerator()
        {
            return new Enumerator(this);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return new Enumerator(this);
        }

        #endregion

        public List()
        {
            _count = 0;
        }

        private class Enumerator : IEnumerator<T>
        {
            #region IEnumerator<T> Members

            public T Current
            {
                get { return _list[_currentIndex]; }
            }

            object IEnumerator.Current
            {
                get
                {
                    return this.Current;
                }
            }

            public bool MoveNext()
            {
                return ++_currentIndex < _list.Count;
            }

            public void Reset()
            {
                _currentIndex = -1;
            }

            public void Dispose()
            {
                _list = null;
            }

            #endregion


            //TODO: What if the collection is modified?

            private int _currentIndex;
            private List<T> _list;

            public Enumerator(List<T> list)
            {
                _list = list;
                _currentIndex = -1;
            }
        }
    }
}
