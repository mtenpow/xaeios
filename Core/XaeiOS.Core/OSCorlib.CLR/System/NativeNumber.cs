using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    public struct NativeNumber
    {
        private double _value;

        private NativeNumber(double value)
        {
            _value = value;
        }

        public override int GetHashCode()
        {
            return _value.GetHashCode();
        }

        public override string ToString()
        {
            return _value.ToString();
        }

        public static NativeNumber operator +(NativeNumber a, int b)
        {
            return new NativeNumber(a._value + (double)b);
        }

        public static NativeNumber operator +(int a, NativeNumber b)
        {
            return new NativeNumber((double)a + b._value);
        }

        public static NativeNumber operator -(NativeNumber a, int b)
        {
            return new NativeNumber(a._value - (double)b);
        }

        public static NativeNumber operator /(NativeNumber a, int b)
        {
            return new NativeNumber(a._value / (double)b);
        }

        public static NativeNumber operator *(NativeNumber a, int b)
        {
            return new NativeNumber(a._value * (double)b);
        }

        public static bool operator >(NativeNumber a, int b)
        {
            return a._value > b;
        }

        public static bool operator <(NativeNumber a, int b)
        {
            return a._value < b;
        }

        public static explicit operator NativeNumber(double d)
        {
            return new NativeNumber(d);
        }

        public static explicit operator double(NativeNumber d)
        {
            return d._value;
        }

        public static int ParseInt(string p)
        {
            return int.Parse(p);
        }
    }
}
