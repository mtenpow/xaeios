namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IForEachStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Expression { get; set; }

        VariableDefinition Variable { get; set; }

    }
}

