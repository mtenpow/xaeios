using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
    /// <summary>
    /// Represents an immutable series of characters.
    /// </summary>
    [Intrinsic("String", UseGlobalNamespace = true, SetVTable = true)]
    [CorlibCLRConjugate]
    public sealed class String
    {
        // TODO: This is emitted by XaeiO.Compiler as string.Empty rather than a reference to static class data
        public const string Empty = "";

        public extern int Length
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.length")]
            get;
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0} == {1}")]
        private extern static bool InternalEquals(string str1, string str2);

        [IndexerName("Chars")]
        public extern char this[int index]
        {
            [Intrinsic("charAt")]
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
        }

        [Intrinsic("toLowerCase")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string ToLower();

        [Intrinsic("indexOf")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern int IndexOf(string needle);

        [Intrinsic("substr")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Substr(int start);

        [Intrinsic("substr")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Substr(int start, int length);

        [Intrinsic("substring")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Substring(int start);

        [Intrinsic("substring")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Substring(int start, int end);

        [Intrinsic("split")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string[] Split(string separator);

        public string[] Split(params char[] separator)
        {
            if (separator.Length > 1)
            {
                throw new NotImplementedException();
            }
            else
            {
                return Split(separator[0].ToString());
            }
        }
        
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public bool StartsWith(string prefix)
        {
            if (prefix.Length > Length)
            {
                return false;
            }
            else
            {
                return this.Substr(0, prefix.Length) == prefix;
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public bool EndsWith(string suffix)
        {
            throw new Exception("Not yet implemented");
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.match({0})")]
        public extern bool Match(string regex);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}")]
        public override string ToString()
        {
            return this;
        }
        
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public bool Contains(string needle)
        {
            return this.IndexOf(needle) != -1;
        }

        public static string Concat(object obj0, object obj1)
        {
            return SafeToString(obj0) + SafeToString(obj1);
        }

        public static string Concat(object obj0, object obj1, object obj2)
        {
            return SafeToString(obj0) + SafeToString(obj1) + SafeToString(obj2);
        }

        public static string Concat(object obj0, object obj1, object obj2, object obj3)
        {
            return SafeToString(obj0) + SafeToString(obj1) + SafeToString(obj2) + SafeToString(obj3);
        }

        public static string Concat(object[] objs)
        {
            string[] strs = new string[objs.Length];
            for (int i = 0; i < objs.Length; i++)
            {
                strs[i] = SafeToString(objs[i]);
            }
            return Concat(strs);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static string NativeConcat(string[] objs)
        {
            NativeArray<string> sb = new NativeArray<string>();
            for (int i = 0; i < objs.Length; i++)
            {
                sb.Push(objs[i]);
            }
            return sb.Join("");
        }

        private static string SafeToString(object obj)
        {
            if (obj == null)
            {
                return "null";
            }
            else
            {
                return obj.ToString();
            }
        }

        public static int Compare(string strA, string strB)
        {
            if (GreaterThan(strA,strB))
            {
                return 1;
            }
            else if (strA == strB)
            {
                return 0;
            }
            else
            {
                return -1;
            }
        }

        public static bool IsNullOrEmpty(string str)
        {
            return str == null || Empty.Equals(str);
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} + {1})")]
        public static extern string Concat(string str0, string str1);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} + {1} + {2})")]
        public static extern string Concat(string str0, string str1, string str2);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "[{0}, {1}, {2}, {3}].join('')")]
        public static extern string Concat(string str0, string str1, string str2, string str3);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0}.join('')")]
        public static extern string Concat(string[] strs);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} == {1})")]
        public static extern bool operator ==(string a, string b);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} != {1})")]
        public static extern bool operator !=(string a, string b);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} > {1})")]
        private static extern bool GreaterThan(string a, string b);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} < {1})")]
        private static extern bool LessThan(string a, string b);
    }
}
