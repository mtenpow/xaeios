using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using Mono.Cecil;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler.CodeModel
{
    public class VariableDefinitionExpression : IVariableDefinitionExpression
    {
        #region IVariableDefinitionExpression Members

        public Mono.Cecil.Cil.VariableDefinition Variable
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
        private Mono.Cecil.Cil.VariableDefinition _variable;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return Variable.VariableType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public VariableDefinitionExpression(VariableDefinition variableDefinition)
        {
            _variable = variableDefinition;
        }

        public VariableDefinitionExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("{0} {1}", Variable.VariableType, Variable.Name);
        }
    }
}
