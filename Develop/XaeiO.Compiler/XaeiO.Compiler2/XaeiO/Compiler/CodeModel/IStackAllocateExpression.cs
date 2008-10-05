namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IStackAllocateExpression : IExpression
    {
        IExpression Expression { get; set; }

        TypeReference Type { get; set; }

    }
}

