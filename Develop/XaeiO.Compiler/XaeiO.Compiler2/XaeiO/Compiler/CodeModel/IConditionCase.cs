namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IConditionCase : ISwitchCase
    {
        IExpression Condition { get; set; }

    }
}

