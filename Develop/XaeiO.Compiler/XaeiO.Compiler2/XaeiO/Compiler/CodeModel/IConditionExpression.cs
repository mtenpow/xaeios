namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IConditionExpression : IExpression
    {
        IExpression Condition { get; set; }

        IExpression Else { get; set; }

        IExpression Then { get; set; }

    }
}

