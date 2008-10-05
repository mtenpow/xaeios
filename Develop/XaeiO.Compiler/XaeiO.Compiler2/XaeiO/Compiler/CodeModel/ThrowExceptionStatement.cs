using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ThrowExceptionStatement : IThrowExceptionStatement
    {

        #region IThrowExceptionStatement Members
        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        #endregion

        public ThrowExceptionStatement(IExpression exception)
        {
            _expression = exception;
        }

        internal ThrowExceptionStatement()
        {
        }

        public override string ToString()
        {
            return "throw " + Expression.ToString();
        }
    }
}
