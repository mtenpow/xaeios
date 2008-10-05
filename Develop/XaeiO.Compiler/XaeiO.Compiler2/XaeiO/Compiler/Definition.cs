using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;
using XaeiO.Compiler.CodeModel;
using Mono.Cecil;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler
{
    public class Definition : IAssignStatement
    {
        public VariableReference Variable
        {
            get
            {
                return _variable;
            }
            set
            {
                _variable = value;
            }
        }
        private VariableReference _variable;

        public IExpression Target
        {
            get
            {
                if (_target == null)
                {
                    _target = new VariableReferenceExpression(Variable);
                }
                return _target;
            }
            set
            {
                IVariableReferenceExpression variable = value as IVariableReferenceExpression;
                if (variable == null)
                {
                    throw new ArgumentException("value");
                }
                Variable = variable.Variable;
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

        public Definition()
        {
        }

        public Definition(IAssignStatement statement)
        {
            IVariableReferenceExpression variableReferenceExpression = statement.Target as IVariableReferenceExpression;
            if (variableReferenceExpression == null)
            {
                throw new ArgumentException("IAssignStatement was not a definition");
            }
            _variable = variableReferenceExpression.Variable;
            _expression = statement.Expression;
        }

        public Definition(VariableReference variable, IExpression expression)
        {
            _variable = variable;
            _expression = expression;
        }

        public override int GetHashCode()
        {
            return (_variable.Name.GetHashCode() << 3) ^ Expression.GetHashCode();
        }

        public override bool Equals(object obj)
        {
            if (obj == null)
            {
                return false;
            }
            Definition d = obj as Definition;
            if (null == (object)d)
            {
                return false;
            }
            return d == this;
        }

        public static bool operator ==(Definition a, Definition b)
        {
            if ((object)a == null)
            {
                return null == (object)b;
            }
            else if(null == (object)b)
            {
                return false;
            }
            return a.Variable.Name == b.Variable.Name && a.Expression.Equals(b.Expression);
        }

        public static bool operator !=(Definition a, Definition b)
        {
            return !(a == b);
        }

        public override string ToString()
        {
            return Variable.Name + " = " + Expression.ToString();
        }
    }
}
