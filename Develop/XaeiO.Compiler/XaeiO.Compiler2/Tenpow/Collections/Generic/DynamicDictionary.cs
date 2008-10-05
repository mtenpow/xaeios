using System;
using System.Collections.Generic;
using System.Text;

namespace Tenpow.Collections.Generic
{
    /// <summary>
    /// A dictionary that dynamically creates values to serve requests for keys not found.
    /// </summary>
    /// <typeparam name="K"></typeparam>
    /// <typeparam name="V"></typeparam>
	public class DynamicDictionary<K, V> : Dictionary<K, V>, ICloneable where V : ICloneable, new()
	{
        public new V this[K key]
        {
            get
            {
                if (!this.ContainsKey(key))
                {
                    return this[key] = new V();
                }
                return base[key];
            }
            set
            {
                base[key] = value;
            }
        }

        public DynamicDictionary<K, V> Clone()
        {
            DynamicDictionary<K, V> ret = new DynamicDictionary<K, V>();
            foreach (KeyValuePair<K, V> pair in this)
            {
                ret.Add(pair.Key, (V)pair.Value.Clone());
            }
            return ret;
        }

        object ICloneable.Clone()
        {
            return Clone();
        }

        public override bool Equals(object obj)
        {
            DynamicDictionary<K, V> dictionary = obj as DynamicDictionary<K, V>;
            if (dictionary == null)
            {
                return false;
            }
            return this == dictionary;
        }

        public static bool operator ==(DynamicDictionary<K, V> a, DynamicDictionary<K, V> b)
        {
            if (((object)a) == null && ((object)b) == null)
            {
                return true;
            }
            if (((object)a) == null || ((object)b) == null)
            {
                return false;
            }
            if (a.Count != b.Count)
            {
                return false;
            }
            foreach (K node in a.Keys)
            {
                if (!b.ContainsKey(node))
                {
                    return false;
                }
                if (!a[node].Equals(b[node]))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool operator !=(DynamicDictionary<K, V> a, DynamicDictionary<K, V> b)
        {
            return !(a == b);
        }
	}
}
