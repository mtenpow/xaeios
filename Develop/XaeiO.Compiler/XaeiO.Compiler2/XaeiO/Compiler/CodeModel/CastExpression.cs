using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class CastExpression : ICastExpression
    {
        #region ICastExpression Members

        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        private Mono.Cecil.TypeReference _targetType;

        public Mono.Cecil.TypeReference TargetType
        {
            get { return _targetType; }
            set { _targetType = value; }
        }

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return TargetType;
            }
            set
            {
                TargetType = value;
            }
        }

        #endregion

        public CastExpression(IExpression expression, Mono.Cecil.TypeReference targetType)
        {
            _expression = expression;
            _targetType = targetType;
        }

        internal CastExpression()
        {
        }

        public override string ToString()
        {
            return String.Format("({0}){1}", TargetType, Expression);
        }
    }
}
