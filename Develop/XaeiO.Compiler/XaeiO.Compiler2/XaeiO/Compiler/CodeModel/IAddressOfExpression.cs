namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAddressOfExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

