namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ILiteralExpression : IExpression
    {
        object Value { get; set; }

    }
}

