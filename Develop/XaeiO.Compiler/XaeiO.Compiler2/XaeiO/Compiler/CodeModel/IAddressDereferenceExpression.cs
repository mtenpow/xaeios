namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAddressDereferenceExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

