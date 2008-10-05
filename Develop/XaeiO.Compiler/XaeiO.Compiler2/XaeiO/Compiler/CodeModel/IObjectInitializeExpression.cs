namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IObjectInitializeExpression : IExpression
    {
        TypeReference Type { get; set; }
        IExpression Expression { get; set; }
    }
}

