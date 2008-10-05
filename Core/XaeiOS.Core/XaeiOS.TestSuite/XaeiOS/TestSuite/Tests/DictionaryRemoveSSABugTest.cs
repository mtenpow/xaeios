using System;
using System.Runtime.InteropServices;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    /// <summary>
    /// Test fix for bug in XaeiO.Compiler2 where SSA form was not being generated correctly.
    /// 
    /// The bug was that phi nodes were not being placed at all the proper locations.
    /// </summary>
    public class DictionaryRemoveSSABugTest : TestBase
    {
        public override void PerformTest()
        {
            _keys = new NativeArray<string>();
            _keysToIndexMapping = new NativeObject();
            _internalObject = new NativeObject();

            Add("hello", "world");
            Add("goodbye", "buddy");
            Add("yester", "day");

            // TODO: Do this in a separate thread and if the thread hasn't exited in 20 seconds, the test failed
            Remove("hello");
            Remove("goodbye");
        }

        public DictionaryRemoveSSABugTest()
            : base("DictionaryRemoveSSABugTest")
        {
        }

        private NativeArray<string> _keys;
        private NativeObject _keysToIndexMapping;
        private NativeObject _internalObject;

        private void Add(string key, string value)
        {
            int hc = key.GetHashCode();
            if (!_internalObject.ContainsKey(hc))
            {
                _keysToIndexMapping[hc] = var.Cast<int>(_keys.Length);
                _keys.Push(key);
            }
            _internalObject[hc] = var.Cast<string>(value);
        }

        /// <summary>
        /// This method used to run forever because of the bug
        /// </summary>
        private bool Remove(string key)
        {
            int hc = key.GetHashCode();
            Log("Making sure internal object contains hashcode key " + hc);
            if (!_internalObject.ContainsKey(hc))
            {
                return false;
            }
            int keyIndex = _keysToIndexMapping[hc].Cast<int>();
            Log("Key index is " + keyIndex);
            _keysToIndexMapping.RemoveKey(hc);
            Log("Key index removed from keys to index mapping. Rebuilding keys array");

            NativeArray<string> newKeys = new NativeArray<string>();
            int length = _keys.Length;
            int newLength = _keys.Length - 1;
            for (int i = 0; i < newLength; i++)
            {
                Log("At index: " + i);
                if (i == keyIndex)
                {
                    continue;
                }
                newKeys.Push(_keys[i]);
            }
            _keys = newKeys;

            _internalObject.RemoveKey(hc);
            Log("Dictionary::Remove done!");
            return true;
        }

    }
}