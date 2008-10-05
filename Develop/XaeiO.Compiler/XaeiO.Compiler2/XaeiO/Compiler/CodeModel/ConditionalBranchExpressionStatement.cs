using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ConditionalBranchExpressionStatement : IExpressionStatement
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

        public ConditionalBranchExpressionStatement(IExpression expression)
        {
            _expression = expression;
        }

        internal ConditionalBranchExpressionStatement()
        {
        }

        public override string ToString()
        {
            return Expression.ToString();
        }
    }
}
