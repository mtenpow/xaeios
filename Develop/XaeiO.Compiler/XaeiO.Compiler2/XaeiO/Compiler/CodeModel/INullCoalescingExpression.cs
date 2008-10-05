namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface INullCoalescingExpression : IExpression
    {
        IExpression Condition { get; set; }

        IExpression Expression { get; set; }

    }
}

