using System;
using System.Runtime.CompilerServices;

namespace System.IO
{
    public abstract class TextWriter
    {
        static TextWriter()
        {
            Null = new NullTextWriter();
        }

        public abstract void Write(string s);

        public static TextWriter Null
        {
            get;
            private set;
        }

        private class NullTextWriter : TextWriter
        {
            public override void Write(string s)
            {
            }
        }
    }
}