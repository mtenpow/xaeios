namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ILockStatement : IStatement
    {
        IBlockStatement Body { get; set; }

        IExpression Expression { get; set; }

    }
}

