namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IExpressionStatement : IStatement
    {
        IExpression Expression { get; set; }

    }
}

