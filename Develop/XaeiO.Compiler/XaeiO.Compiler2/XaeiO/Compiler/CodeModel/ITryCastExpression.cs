namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface ITryCastExpression : IExpression
    {
        IExpression Expression { get; set; }

        TypeReference TargetType { get; set; }

    }
}

