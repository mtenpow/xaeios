using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ConditionCase : IConditionCase
    {
        #region IConditionCase Members

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

        #region ISwitchCase Members

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

        #endregion

        public ConditionCase(IExpression condition)
        {
            _condition = condition;
        }

        internal ConditionCase()
        {
        }

        public override string ToString()
        {
            return string.Format("case {0}: {\n{1}\n}", Condition, Body);
        }
    }
}
