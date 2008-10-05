using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class CatchClause : ICatchClause
    {
        #region ICatchClause Members

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

        private IExpression _condition;

        public IExpression Condition
        {
            get { return _condition; }
            set { _condition = value; }
        }

        private Mono.Cecil.Cil.VariableDefinition _variable;

        public Mono.Cecil.Cil.VariableDefinition Variable
        {
            get { return _variable; }
            set { _variable = value; }
        }

        #endregion

        public CatchClause()
        {
        }
    }
}
