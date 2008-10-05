using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class SwitchStatement : ISwitchStatement
    {
        #region ISwitchStatement Members

        public IList<ISwitchCase> Cases
        {
            get
            {
                if (_cases == null)
                {
                    _cases = new List<ISwitchCase>();
                }
                return _cases;
            }
            set
            {
                _cases = value;
            }
        }
        private IList<ISwitchCase> _cases;

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

        public SwitchStatement(IExpression expression)
        {
            _expression = expression;
        }

        public SwitchStatement()
        {
        }
    }
}
