using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using Mono.Cecil.Cil;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class PseudoVariableDefinition : VariableDefinition
    {
        public PseudoVariableDefinition(string name) : base(NullType.Instance)
        {
            base.Name = name;
        }
    }
}
