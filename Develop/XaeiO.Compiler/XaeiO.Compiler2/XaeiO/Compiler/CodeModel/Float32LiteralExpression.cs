using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class Float32LiteralExpression : ILiteralExpression
    {
        public double Float32
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
                _value = (Double)value;
            }
        }
        private Double _value;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Single;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public Float32LiteralExpression(Double value)
        {
            _value = value;
        }

        internal Float32LiteralExpression()
        {
        }

        public override string ToString()
        {
            return _value.ToString();
        }
    }
}
