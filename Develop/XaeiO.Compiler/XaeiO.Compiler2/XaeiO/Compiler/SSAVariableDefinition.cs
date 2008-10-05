using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using Mono.Cecil;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler
{
    public class SSAVariableDefinition : VariableDefinition
    {
        private VariableReference _variable;

        public VariableReference Variable
        {
            get { return _variable; }
            set { _variable = value; }
        }

        public bool IsTemporary
        {
            get
            {
                return _ordinal == -1;
            }
        }

        private int _ordinal;

        public int Ordinal
        {
            get { return _ordinal; }
            set { _ordinal = value; }
        }

        public SSAVariableDefinition(VariableReference variable, int ordinal, MethodDefinition method)
            : base(variable.Name + "." + ordinal, variable.Index, method, variable.VariableType)
        {
            _variable = variable;
            _ordinal = ordinal;
        }

        public SSAVariableDefinition(VariableDefinition tempVariableDefinition)
            : base(tempVariableDefinition.Name, -1, tempVariableDefinition.Method, tempVariableDefinition.VariableType)
        {
            _variable = this;
            _ordinal = -1;
        }

        public static string GetUnderlyingVariableName(string variableName)
        {
            string[] parts = variableName.Split('.');
            Debug.Assert(parts.Length == 2, "Expected SSA variable.  Instead got " + variableName);
            int throwAway;
            Debug.Assert(int.TryParse(parts[1], out throwAway));
            return parts[0];
        }
    }
}