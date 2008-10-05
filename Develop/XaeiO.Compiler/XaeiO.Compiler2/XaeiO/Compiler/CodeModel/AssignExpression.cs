using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class AssignExpression : IAssignExpression
    {
        #region IAssignExpression Members

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

        public IExpression Target
        {
            get
            {
                return _target;
            }
            set
            {
                _target = value;
            }
        }
        private IExpression _target;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return _target.Type;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public AssignExpression(IExpression target, IExpression expression)
        {
            _target = target;
            _expression = expression;
        }

        public override string ToString()
        {
            return String.Format("{0} = {1}", Target, Expression);
        }
    }
}
