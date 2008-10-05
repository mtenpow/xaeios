namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ITypedReferenceCreateExpression : IExpression
    {
        IExpression Expression { get; set; }

    }
}

