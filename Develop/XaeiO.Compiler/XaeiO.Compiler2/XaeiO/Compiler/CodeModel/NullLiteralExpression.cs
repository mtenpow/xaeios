using System;
using System.Collections.Generic;

namespace XaeiO.Compiler.CodeModel
{
    public class NullLiteralExpression : Expression, ILiteralExpression
    {

        #region ILiteralExpression Members

        public object Value
        {
            get
            {
                return _value;
            }
            set
            {
                _value = (Boolean)value;
            }
        }
        private Boolean _value;
        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return base.Type;
            }
            set
            {
                base.Type = value;
            }
        }

        #endregion

        public NullLiteralExpression() : base(NullType.Instance)
        {
        }

        public override string ToString()
        {
            return "null";
        }
    }
}
