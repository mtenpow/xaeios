using System;
using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class SetExecutionPointerStatement : IAssignStatement
    {
        private IExpression _target;

        public IExpression Target
        {
            get { return _target; }
            set { throw new NotSupportedException(); }
        }
        private IExpression _expression;
        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        public SetExecutionPointerStatement(IExpression expression)
        {
            _expression = expression;
            _target = new ExecutionPointerSpecialRegisterReferenceExpression();
        }

        public SetExecutionPointerStatement(int value) : this(new Int32LiteralExpression(value))
        {
        }

        public override string ToString()
        {
            return string.Format("{0} = {1}", Target, Expression);
        }
    }
}

