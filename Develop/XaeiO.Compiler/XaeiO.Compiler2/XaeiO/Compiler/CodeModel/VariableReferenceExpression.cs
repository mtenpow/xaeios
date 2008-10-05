using System;
using System.Collections.Generic;
using System.Text;
using Mono.Cecil;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler.CodeModel
{
    public class VariableReferenceExpression : IVariableReferenceExpression
    {
        #region IVariableReferenceExpression Members

        public Mono.Cecil.Cil.VariableReference Variable
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

        #endregion

        public VariableReferenceExpression(VariableReference variable)
        {
            _variable = variable;
        }

        public VariableReferenceExpression()
        {
        }

        #region IExpression Members

        public TypeReference Type
        {
            get
            {
                return _variable.VariableType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public override string ToString()
        {
            return Variable.Name;
        }
    }    
}
