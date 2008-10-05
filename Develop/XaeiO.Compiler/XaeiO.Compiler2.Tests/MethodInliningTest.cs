using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiO.Compiler2.Tests
{
    public class MethodInliningTest
    {
        private int _value = 10;

        public void TestMethodInlining()
        {
            Console.WriteLine(Value.ToString());
        }

        public int Value
        {
            get
            {
                return _value;
            }
        }
    }
}
