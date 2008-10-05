namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IThrowExceptionStatement : IStatement
    {
        IExpression Expression { get; set; }

    }
}

