using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class StringLiteralExpression : ILiteralExpression
    {
        public String String
        {
            get
            {
                return _string;
            }
            set
            {
                _string = value;
            }
        }
        #region ILiteralExpression Members

        public object Value
        {
            get
            {
                return _string;
            }
            set
            {
                _string = (string)value;
            }
        }
        private string _string;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.String;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public StringLiteralExpression(string value)
        {
            _string = value;
        }

        internal StringLiteralExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("\"{0}\"", _string);
        }
    }
}
