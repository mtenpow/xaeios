using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ConditionStatement : IConditionStatement
    {
        #region IConditionStatement Members

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

        public IBlockStatement Else
        {
            get
            {
                if (_else == null)
                {
                    _else = new BlockStatement();
                }
                return _else;
            }
            set
            {
                _else = value;
            }
        }
        private IBlockStatement _else;

        public IBlockStatement Then
        {
            get
            {
                if (_then == null)
                {
                    _then = new BlockStatement();
                }
                return _then;
            }
            set
            {
                _then = value;
            }
        }
        private IBlockStatement _then;

        #endregion

        public ConditionStatement(IExpression condition)
        {
            _condition = condition;
        }

        internal ConditionStatement()
        {
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("if(");
            sb.Append(Condition);
            sb.AppendLine("){");
            sb.Append(Then);
            sb.AppendLine("} else {");
            sb.Append(Else);
            sb.AppendLine("}");
            return sb.ToString();
        }
    }
}
