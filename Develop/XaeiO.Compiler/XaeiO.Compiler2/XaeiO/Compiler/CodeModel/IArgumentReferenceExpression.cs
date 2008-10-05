namespace XaeiO.Compiler.CodeModel
{
    using System;
    using Mono.Cecil;

    public interface IArgumentReferenceExpression : IExpression
    {
        ParameterReference Parameter { get; set; }

    }
}

