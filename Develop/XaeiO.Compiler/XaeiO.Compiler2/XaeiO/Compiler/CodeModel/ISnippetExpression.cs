namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ISnippetExpression : IExpression
    {
        string Value { get; set; }

    }
}

