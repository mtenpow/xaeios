namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface ISizeOfExpression : IExpression
    {
        TypeReference Type { get; set; }

    }
}

