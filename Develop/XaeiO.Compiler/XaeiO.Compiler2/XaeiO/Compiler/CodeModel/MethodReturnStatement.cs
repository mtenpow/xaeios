using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class MethodReturnStatement : IMethodReturnStatement
    {
        #region IMethodReturnStatement Members

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

        public MethodReturnStatement(IExpression expression)
        {
            _expression = expression;
        }

        internal MethodReturnStatement()
        {
        }

        public override string ToString()
        {
            if (Expression != null)
            {
                return string.Format("return {0}", Expression.ToString());
            }
            else
            {
                return "return";
            }
        }
    }
}
