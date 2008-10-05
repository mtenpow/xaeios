using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler
{
    public class CodeFormatter
    {
        private int _indentLevel;
        private StringBuilder _sb;
        private bool _indent = true;
        public CodeFormatter()
        {
            _sb = new StringBuilder();
        }

        public void Write(string s)
        {
            if (_indent)
            {
                WriteIndents();
            }
            _sb.Append(s);
            _indent = false;
        }

        public void Write(int i)
        {
            Write(i.ToString());
        }

        public void WriteFormat(string formatString, params object[] args)
        {
            if (_indent)
            {
                WriteIndents();
            }
            _sb.AppendFormat(formatString, args);
            _indent = false;
        }

        public void WriteLine()
        {
            _sb.AppendLine();
            _indent = true;
        }

        public void FlushIndents()
        {
            if (_indent)
            {
                WriteIndents();
                _indent = false;
            }
        }

        private void WriteIndents()
        {
            for (int i = 0; i < _indentLevel; i++)
            {
                _sb.Append("    ");
            }
        }
        public void WriteIndent()
        {
            _indentLevel++;
        }
        public void WriteOutdent()
        {
            _indentLevel = Math.Max(0, _indentLevel - 1);
        }
        public uint GetOffset()
        {
            return (uint)_sb.Length + (_indent ? (uint)_indentLevel : 0);
        }
        public override string ToString()
        {
            return _sb.ToString();
        }
    }
}
