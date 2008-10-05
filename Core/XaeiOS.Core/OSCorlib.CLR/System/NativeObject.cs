using System.Collections.Generic;

namespace System
{
    public class NativeObject
    {
        private Dictionary<object, var> _internalDictionary = new Dictionary<object, var>();

        public var this[var propertyName]
        {
            get
            {
                return _internalDictionary[propertyName];
            }
            set
            {
                _internalDictionary[propertyName] = value;
            }
        }
        public var this[NativeNumber propertyName]
        {
            get
            {
                return _internalDictionary[propertyName];
            }
            set
            {
                _internalDictionary[propertyName] = value;
            }
        }
        public var this[string propertyName]
        {
            get
            {
                return _internalDictionary[propertyName];
            }
            set
            {
                _internalDictionary[propertyName] = value;
            }
        }

        public NativeObject()
        {
        }

        public bool ContainsKey(string key)
        {
            return _internalDictionary.ContainsKey(key);
        }

        public bool ContainsKey(NativeNumber key)
        {
            return _internalDictionary.ContainsKey(key);
        }

        public void RemoveKey(string key)
        {
            _internalDictionary.Remove(key);
        }

        public void RemoveKey(NativeNumber key)
        {
            _internalDictionary.Remove(key);
        }

        private string NativeToString()
        {
            return ToString();
        }
    }
}
