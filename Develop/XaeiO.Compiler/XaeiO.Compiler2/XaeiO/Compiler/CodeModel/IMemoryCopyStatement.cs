namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IMemoryCopyStatement : IStatement
    {
        IExpression Destination { get; set; }

        IExpression Length { get; set; }

        IExpression Source { get; set; }

    }
}

