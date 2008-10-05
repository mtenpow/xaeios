namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IUnaryExpression : IExpression
    {
        IExpression Expression { get; set; }

        UnaryOperator Operator { get; set; }

    }
}

