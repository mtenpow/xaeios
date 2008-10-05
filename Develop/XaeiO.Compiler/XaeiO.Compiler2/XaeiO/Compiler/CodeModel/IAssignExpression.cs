namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAssignExpression : IExpression
    {
        IExpression Expression { get; set; }

        IExpression Target { get; set; }

    }
}

