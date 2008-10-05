namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface ICatchClause : ICodeObject
    {
        IBlockStatement Body { get; set; }

        IExpression Condition { get; set; }

        VariableDefinition Variable { get; set; }

    }
}

