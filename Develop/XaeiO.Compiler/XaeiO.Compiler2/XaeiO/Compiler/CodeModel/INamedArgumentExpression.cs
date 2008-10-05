namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface INamedArgumentExpression : IExpression
    {
        IMemberReference Member { get; set; }

        IExpression Value { get; set; }

    }
}

