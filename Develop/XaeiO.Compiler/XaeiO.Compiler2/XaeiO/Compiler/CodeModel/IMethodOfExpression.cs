namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IMethodOfExpression : IExpression
    {
        MethodReference Method { get; set; }

    }
}

