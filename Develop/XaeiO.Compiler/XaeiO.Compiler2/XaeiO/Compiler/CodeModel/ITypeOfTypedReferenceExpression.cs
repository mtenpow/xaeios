namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ITypeOfTypedReferenceExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

