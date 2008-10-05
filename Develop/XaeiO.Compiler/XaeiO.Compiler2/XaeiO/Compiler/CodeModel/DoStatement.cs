using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class DoStatement : IDoStatement
    {
        #region IDoStatement Members

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

        public DoStatement(IExpression condition)
        {
            _condition = condition;
        }

        internal DoStatement()
        {
        }

        public override string ToString()
        {
            return string.Format("do {\n{0}\n} while({1})", Body, Condition);
        }
    }
}
