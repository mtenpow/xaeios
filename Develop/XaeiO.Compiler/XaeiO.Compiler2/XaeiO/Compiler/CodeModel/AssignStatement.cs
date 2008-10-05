using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;
using XaeiO.Compiler.CodeModel;
using Mono.Cecil;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler.CodeModel
{
    public class AssignStatement : IAssignStatement
    {
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

        public AssignStatement(IExpression target, IExpression expression)
        {
            _target = target;
            _expression = expression;
        }

        public AssignStatement()
        {
        }

        public override string ToString()
        {
            return string.Format("{0} = {1}", Target, Expression);
        }
    }
}
