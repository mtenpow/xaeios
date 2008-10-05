namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAssignStatement : IStatement
    {
        IExpression Expression { get; set; }

        IExpression Target { get; set; }

    }
}

