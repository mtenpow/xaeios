using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public static class Extensions
    {
        public static StringLiteralExpression ToExpression(this string str)
        {
            return new StringLiteralExpression(str);
        }
        public static Int32LiteralExpression ToExpression(this int i)
        {
            return new Int32LiteralExpression(i);
        }
        public static BooleanLiteralExpression ToExpression(this bool b)
        {
            return new BooleanLiteralExpression(b);
        }
    }
}
