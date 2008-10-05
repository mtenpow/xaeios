namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAddressOutExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

