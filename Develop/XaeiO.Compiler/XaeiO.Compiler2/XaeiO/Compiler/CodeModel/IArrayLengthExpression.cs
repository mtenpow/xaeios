namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IArrayLengthExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

