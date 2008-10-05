namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IMethodReturnStatement : IStatement
    {
        IExpression Expression { get; set; }

    }
}

