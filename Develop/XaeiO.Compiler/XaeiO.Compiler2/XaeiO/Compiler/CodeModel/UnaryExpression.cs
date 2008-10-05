using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class UnaryExpression : IUnaryExpression
    {
        #region IUnaryExpression Members

        public IExpression Expression
        {
            get
            {
                return _expression;
            }
            set
            {
                _expression = value;
            }
        }
        private IExpression _expression;

        public UnaryOperator Operator
        {
            get
            {
                return _op;
            }
            set
            {
                _op = value;
            }
        }
        private UnaryOperator _op;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                switch (_op)
                {
                    case UnaryOperator.BooleanNot:
                        {
                            return CoreTypes.Boolean;
                        }
                    case UnaryOperator.Negate:
                        {
                            return Expression.Type;
                        }
                    default:
                        {
                            throw new NotImplementedException(); // TODO: UnaryExpression.get_Type
                        }
                }
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public UnaryExpression(IExpression expression, UnaryOperator op)
        {
            _op = op;
            _expression = expression;
        }

        internal UnaryExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("{0} {1}", Operator, Expression);
        }
    }
}
