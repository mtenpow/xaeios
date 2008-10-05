using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
	public class ConditionExpression : IConditionExpression
	{
        #region IConditionExpression Members

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

        public IExpression Else
        {
            get
            {
                return _else;
            }
            set
            {
                _else = value;
            }
        }
        private IExpression _else;

        public IExpression Then
        {
            get
            {
                return _then;
            }
            set
            {
                _then = value;
            }
        }
        private IExpression _then;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return Then.Type;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ConditionExpression(IExpression condition, IExpression then, IExpression el)
        {
            _condition = condition;
            if (!then.Type.Equals(el.Type))
            {
                throw new ArgumentException("Types of then and else expressions must match.");
            }
            _then = then;
            _else = el;
        }

        internal ConditionExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("{0} ? {1} : {2}", Condition, Then, Else);
        }
    }
}
