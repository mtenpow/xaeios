using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class TryCastExpression : ITryCastExpression, IExpression
    {
        #region IObjectInitializeExpression Members

        private Mono.Cecil.TypeReference _targetType;

        public Mono.Cecil.TypeReference TargetType
        {
            get { return _targetType; }
            set { _targetType = value; }
        }
        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        #endregion

        public TryCastExpression(IExpression expression, Mono.Cecil.TypeReference type)
        {
            _targetType = type;
            _expression = expression;
        }

        internal TryCastExpression()
        {
        }

        #region IExpression Members

        Mono.Cecil.TypeReference IExpression.Type
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

        public override string ToString()
        {
            return Expression + " is " + TargetType;
        }
    }
}
