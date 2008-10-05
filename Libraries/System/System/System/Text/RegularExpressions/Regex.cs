using System;
using System.Runtime.CompilerServices;

namespace System.Text.RegularExpressions
{
    [CLRConjugate("System.Text.RegularExpressions.Regex")]
    public class Regex
    {
        public static bool IsMatch(string str, string pattern)
        {
            return str.Match(pattern);
        }
    }
}