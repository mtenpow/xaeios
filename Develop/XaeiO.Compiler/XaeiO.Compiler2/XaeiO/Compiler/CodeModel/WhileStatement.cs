using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class WhileStatement : IWhileStatement
    {
        #region IWhileStatement Members

        public IBlockStatement Body
        {
            get
            {
                if (_body == null)
                {
                    _body = new BlockStatement();
                }
                return _body;
            }
            set
            {
                _body = value;
            }
        }
        private IBlockStatement _body;

        public IExpression Condition
        {
            get
            {
                return _condition;
            }
            set
            {
                _condition = value;
            }
        }
        private IExpression _condition;

        #endregion

        public WhileStatement()
        {
        }

        public WhileStatement(IExpression condition)
        {
            _condition = condition;
        }

        public WhileStatement(IExpression condition, IBlockStatement body)
        {
            _condition = condition;
            _body = body;
        }
        public override string ToString()
        {
            return string.Format("while({0}) {\n{1}\n}", Condition, Body);
        }
    }
}
