using System;
using System.Collections.Generic;

namespace System.Text
{
	public class StringBuilder
	{
        private NativeArray<string> _internalArray;

        public StringBuilder()
        {
            _internalArray = new NativeArray<string>();
        }

        public void Append(string s)
        {
            _internalArray.Push(s);
        }

        public override string ToString()
        {
            return _internalArray.Join("");
        }
	}
}
