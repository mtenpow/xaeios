using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class Int64LiteralExpression : ILiteralExpression
    {
        public Int64 Int64
        {
            get
            {
                return _value;
            }
            set
            {
                _value = value;
            }
        }
        #region ILiteralExpression Members

        public object Value
        {
            get
            {
                return _value;
            }
            set
            {
                _value = (Int64)value;
            }
        }
        private Int64 _value;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Int64;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public Int64LiteralExpression(Int64 value)
        {
            _value = value;
        }

        internal Int64LiteralExpression()
        {
        }

        public override string ToString()
        {
            return _value.ToString();
        }
    }
}
