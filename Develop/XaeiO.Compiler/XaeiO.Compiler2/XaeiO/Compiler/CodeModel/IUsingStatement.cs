namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IUsingStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Expression { get; set; }

        IExpression Variable { get; set; }

    }
}

