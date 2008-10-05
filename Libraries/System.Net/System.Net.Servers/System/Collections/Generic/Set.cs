#region Using directives

using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

#endregion

namespace System.Collections.Generic
{
    [Serializable]
    public class Set<T> : ICollection, ICollection<T>, IEnumerable, IEnumerable<T>, ICloneable
    {
        public static Set<T> Empty
        {
            get { return new Set<T>(0); }
        }

        public int Count
        {
            get { return Data.Count; }
        }

        public bool IsReadOnly
        {
            get { return false; }
        }

        public T this[int index]
        {
            get
            {
                T[] array = new T[Count];
                Data.Keys.CopyTo(array, 0);
                return array[index];
            }
        }

        private Dictionary<T, Foo> Data;

        #region Constructors
        public Set()
        {
            Data = new Dictionary<T, Foo>();
        }
        public Set(int capacity)
        {
            Data = new Dictionary<T, Foo>(capacity);
        }
        public Set(Set<T> original)
        {
            Data = new Dictionary<T, Foo>(original.Data);
        }
        public Set(IEnumerable<T> original)
        {
            Data = new Dictionary<T, Foo>();
            AddRange(original);
        }
        public Set(params T[] elements)
            : this((IEnumerable<T>)elements)
        {
        }
        #endregion

        public virtual void Add(T a)
        {
            Data[a] = FooInstance;
        }
        public void AddRange(IEnumerable<T> range)
        {
            foreach (T a in range)
                Add(a);
        }
        public Set<U> ConvertAll<U>(Converter<T, U> converter)
        {
            Set<U> result = new Set<U>(this.Count);
            foreach (T element in this)
                result.Add(converter(element));
            return result;
        }
        public bool TrueForAll(Predicate<T> predicate)
        {
            foreach (T element in this)
                if (!predicate(element))
                    return false;
            return true;
        }
        public Set<T> FindAll(Predicate<T> predicate)
        {
            Set<T> result = new Set<T>();
            foreach (T element in this)
                if (predicate(element))
                    result.Add(element);
            return result;
        }
        public void ForEach(Action<T> action)
        {
            foreach (T element in this)
                action(element);
        }
        public virtual void Clear()
        {
            Data.Clear();
        }
        public virtual bool Contains(T a)
        {
            return Data.ContainsKey(a);
        }
        public void CopyTo(T[] array, int index)
        {
            Data.Keys.CopyTo(array, index);
        }
        public virtual bool Remove(T a)
        {
            return Data.Remove(a);
        }
        public IEnumerator<T> GetEnumerator()
        {
            return Data.Keys.GetEnumerator();
        }
        public Set<T> Clone()
        {
            return new Set<T>(this);
        }

        #region Operators
        public static Set<T> operator |(Set<T> a, Set<T> b)
        {
            Set<T> result = new Set<T>(a);
            result.AddRange(b);
            return result;
        }
        public Set<T> Union(IEnumerable<T> b)
        {
            return this | new Set<T>(b);
        }
        public static Set<T> operator &(Set<T> a, Set<T> b)
        {
            Set<T> result = new Set<T>();
            foreach (T element in a)
                if (b.Contains(element))
                    result.Add(element);
            return result;
        }
        public Set<T> Intersection(IEnumerable<T> b)
        {
            return this & new Set<T>(b);
        }
        public static Set<T> operator -(Set<T> a, Set<T> b)
        {
            Set<T> result = new Set<T>();
            foreach (T element in a)
                if (!b.Contains(element))
                    result.Add(element);
            return result;
        }
        public Set<T> Difference(IEnumerable<T> b)
        {
            return this - new Set<T>(b);
        }
        public static Set<T> operator ^(Set<T> a, Set<T> b)
        {
            Set<T> result = new Set<T>();
            foreach (T element in a)
                if (!b.Contains(element))
                    result.Add(element);
            foreach (T element in b)
                if (!a.Contains(element))
                    result.Add(element);
            return result;
        }
        public Set<T> SymmetricDifference(IEnumerable<T> b)
        {
            return this ^ new Set<T>(b);
        }

        public static bool operator <=(Set<T> a, Set<T> b)
        {
            foreach (T element in a)
                if (!b.Contains(element))
                    return false;
            return true;
        }
        public static bool operator <(Set<T> a, Set<T> b)
        {
            return (a.Count < b.Count) && (a <= b);
        }
        public static bool operator ==(Set<T> a, Set<T> b)
        {
            return (a.Count == b.Count) && (a <= b);
        }
        public static bool operator >(Set<T> a, Set<T> b)
        {
            return b < a;
        }
        public static bool operator >=(Set<T> a, Set<T> b)
        {
            return (b <= a);
        }
        public static bool operator !=(Set<T> a, Set<T> b)
        {
            return !(a == b);
        }
        #endregion

        public override bool Equals(object obj)
        {
            Set<T> a = this;
            Set<T> b = obj as Set<T>;
            if ((object)b == null)
                return false;
            return a == b;
        }
        public override int GetHashCode()
        {
            int hashcode = 0;
            foreach (T element in this)
                hashcode ^= element.GetHashCode();
            return hashcode;
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            T[] data = new T[Count];
            this.Data.Keys.CopyTo(data, 0);
            for (int i = 0; i < data.Length; i++)
            {
                sb.Append(data[i].ToString());
                if (i < data.Length - 1)
                {
                    sb.Append(", ");
                }
            }
            sb.Append("}");
            return sb.ToString();
        }

        void ICollection.CopyTo(Array array, int index)
        {
            ((ICollection)Data.Keys).CopyTo(array, index);
        }
        object ICollection.SyncRoot
        {
            get { return ((ICollection)Data.Keys).SyncRoot; }
        }
        bool ICollection.IsSynchronized
        {
            get { return ((ICollection)Data.Keys).IsSynchronized; }
        }
        object ICloneable.Clone()
        {
            return Clone();
        }
        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IEnumerable)Data.Keys).GetEnumerator();
        }

        private struct Foo { }
        private static Foo FooInstance = new Foo();
    }
}
