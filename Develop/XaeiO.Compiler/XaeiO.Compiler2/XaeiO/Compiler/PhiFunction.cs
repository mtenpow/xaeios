using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler
{
    public class PhiFunction : IExpression
    {
        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return _variables[0].Variable.VariableType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        private IList<IVariableReferenceExpression> _variables;

        public IList<IVariableReferenceExpression> Variables
        {
            get { return _variables; }
            set { _variables = value; }
        }

        public PhiFunction()
        {
        }


        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Φ(");
            for (int i = 0; i < Variables.Count - 1; i++)
            {
                sb.Append(Variables[i].ToString());
                sb.Append(", ");
            }
            sb.Append(Variables[Variables.Count - 1].ToString());
            sb.Append(")");
            return sb.ToString();
        }
    }
}
