namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IDoStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Condition { get; set; }

    }
}

