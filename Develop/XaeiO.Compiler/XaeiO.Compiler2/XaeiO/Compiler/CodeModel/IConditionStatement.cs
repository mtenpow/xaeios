namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IConditionStatement : IStatement
    {
        IExpression Condition { get; set; }

        IBlockStatement Else { get; set; }

        IBlockStatement Then { get; set; }

    }
}

