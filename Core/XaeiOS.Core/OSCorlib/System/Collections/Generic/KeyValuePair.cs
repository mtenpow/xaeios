namespace System.Collections.Generic
{
    public class KeyValuePair<K,V>
	{
        public K Key;
        public V Value;

        public KeyValuePair(K key, V value)
        {
            Key = key;
            Value = value;
        }
	}
}
