namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface ICanCastExpression : IExpression
    {
        IExpression Expression { get; set; }

        TypeReference TargetType { get; set; }

    }
}

