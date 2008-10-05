namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAddressReferenceExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

