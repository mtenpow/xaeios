using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace System.Collections.Generic
{
    [CLSCompliant(false)]
    [CorlibCLRConjugate]
    public interface IDictionary<K, V>
    {
        int Count
        {
            get;
        }
        V this[K key]
        {
            get;
            set;
        }
        ICollection<K> Keys
        {
            get;
        }
        bool ContainsKey(K key);
        bool ContainsValue(V value);
        bool Remove(K key);
        void Clear();
    }

    [CLSCompliant(false)]
    [CorlibCLRConjugate]
    public class Dictionary<K, V> : IDictionary<K, V>
    {
        public virtual int Count
        {
            get
            {
                return _keys.Length;
            }
        }

        public virtual V this[K key]
        {
            get
            {
                int hc = key.GetHashCode();
                if (!_internalObject.ContainsKey(hc))
                {
                    throw new Exception("Key not found"); // TODO: Throw key not found exception
                }
                return _internalObject[hc].Cast<V>();
            }
            set
            {
                int hc = key.GetHashCode();
                if (!_internalObject.ContainsKey(hc))
                {
                    _keysToIndexMapping[hc] = var.Cast<int>(_keys.Length);
                    _keys.Push(key);
                }
                _internalObject[hc] = var.Cast<V>(value);
            }
        }

        public ICollection<K> Keys
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        private NativeArray<K> _keys;
        private NativeObject _keysToIndexMapping;
        private NativeObject _internalObject;

        public Dictionary()
        {
            _keys = new NativeArray<K>();
            _keysToIndexMapping = new NativeObject();
            _internalObject = new NativeObject();
        }

        public Dictionary(Dictionary<K, V> original) : this()
        {
            // TODO: use key value pairs
            throw new NotImplementedException();
            /*
            foreach (K key in original.Keys)
            {
                this[key] = original[key];
            }*/
        }

        public virtual bool ContainsKey(K key)
        {
            return _internalObject.ContainsKey(key.GetHashCode());
        }
        public virtual bool ContainsValue(V value)
        {
            throw new NotImplementedException();
        }
        public virtual bool Remove(K key)
        {
            int hc = key.GetHashCode();

            if (!_internalObject.ContainsKey(hc))
            {
                return false;
            }
            int keyIndex = _keysToIndexMapping[hc].Cast<int>();
            _keysToIndexMapping.RemoveKey(hc);
            
            // TODO: Use Array.RemoveAt
            NativeArray<K> newKeys = new NativeArray<K>();
            int length = _keys.Length;
            int newLength  = _keys.Length-1;
            for (int i = 0; i < newLength; i++)
            {
                if (i == keyIndex)
                {
                    continue;
                }
                newKeys.Push(_keys[i]);
            }
            _keys = newKeys;

            _internalObject.RemoveKey(hc);

            return true;
        }
        public virtual void Clear()
        {
            _keys = new NativeArray<K>();
            _keysToIndexMapping = new NativeObject();
            _internalObject = new NativeObject();
        }
        
        // TODO: remove this method
        public V[] GetValues()
        {
            string[] keys = _internalObject.GetKeys();
            V[] values = new V[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                values[i] = _internalObject[keys[i]].Cast<V>();
            }
            return values;
        }
    }
}
