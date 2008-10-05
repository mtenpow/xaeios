namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IWhileStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Condition { get; set; }

    }
}

