namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface ISwitchStatement : IStatement
    {
        IList<ISwitchCase> Cases { get; set; }

        IExpression Expression { get; set; }

    }
}

