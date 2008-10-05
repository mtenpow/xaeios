using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class Int32LiteralExpression : ILiteralExpression
    {
        public Int32 Int32
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
                _value = (Int32)value;
            }
        }
        private Int32 _value;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Int32;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public Int32LiteralExpression(Int32 value)
        {
            _value = value;
        }

        internal Int32LiteralExpression()
        {
        }

        public override string ToString()
        {
            return _value.ToString();
        }
    }
}
