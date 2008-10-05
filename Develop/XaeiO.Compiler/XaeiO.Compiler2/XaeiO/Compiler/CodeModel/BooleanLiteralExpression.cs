using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class BooleanLiteralExpression : ILiteralExpression
    {
        public bool Boolean
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
                _value = (bool)value;
            }
        }
        private bool _value;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Boolean;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public BooleanLiteralExpression(bool value)
        {
            _value = value;
        }

        internal BooleanLiteralExpression()
        {
        }

        public override string ToString()
        {
            return _value.ToString();
        }
    }
}
