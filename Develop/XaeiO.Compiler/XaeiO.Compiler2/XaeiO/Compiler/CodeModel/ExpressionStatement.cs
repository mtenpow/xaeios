using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ExpressionStatement : IExpressionStatement
    {
        #region IExpressionStatement Members

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

        #endregion

        internal ExpressionStatement()
        {
        }

        public ExpressionStatement(IExpression expression)
        {
            _expression = expression;
        }

        public override string ToString()
        {
            return Expression.ToString();
        }
    }
}
