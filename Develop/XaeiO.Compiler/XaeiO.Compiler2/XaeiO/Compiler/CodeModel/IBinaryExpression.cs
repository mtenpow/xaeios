namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IBinaryExpression : IExpression
    {
        IExpression Left { get; set; }

        BinaryOperator Operator { get; set; }

        IExpression Right { get; set; }

    }
}

