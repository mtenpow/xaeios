namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IForStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Condition { get; set; }

        IStatement Increment { get; set; }

        IStatement Initializer { get; set; }

    }
}

