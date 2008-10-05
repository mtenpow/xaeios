using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class BinaryExpression : IBinaryExpression
    {
        public IExpression Left
        {
            get
            {
                return _left;
            }
            set
            {
                _left = value;
            }
        }

        public BinaryOperator Operator
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

        public IExpression Right
        {
            get
            {
                return _right;
            }
            set
            {
                _right = value;
            }
        }

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                switch (Operator)
                {
                    case BinaryOperator.ValueEquality:
                    case BinaryOperator.ValueInequality:
                    case BinaryOperator.IdentityEquality:
                    case BinaryOperator.IdentityInequality:
                    case BinaryOperator.BooleanAnd:
                    case BinaryOperator.BooleanOr:
                    case BinaryOperator.GreaterThan:
                    case BinaryOperator.GreaterThanOrEqual:
                    case BinaryOperator.LessThan:
                    case BinaryOperator.LessThanOrEqual:
                        {
                            return CoreTypes.Boolean;
                        }
                    default:
                        {
                            return Left.Type;
                        }
                }
                // TODO: Implement BinaryExpression.get_Type
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        private IExpression _left;
        private BinaryOperator _op;
        private IExpression _right;

        public BinaryExpression(IExpression left, BinaryOperator op, IExpression right)
        {
            _left = left;
            _op = op;
            _right = right;
        }

        internal BinaryExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("{0} {1} {2}", Left, Operator, Right);
        }

        public override bool Equals(object obj)
        {
            IBinaryExpression binaryExpression = obj as IBinaryExpression;
            if (binaryExpression == null)
            {
                return false;
            }
            return _op.Equals(binaryExpression.Operator) && _left.Equals(binaryExpression.Left) && _right.Equals(binaryExpression.Right);
        }
    }
}
