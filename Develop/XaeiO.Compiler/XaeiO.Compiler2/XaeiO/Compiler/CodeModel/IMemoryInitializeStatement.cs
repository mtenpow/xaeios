namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IMemoryInitializeStatement : IStatement
    {
        IExpression Length { get; set; }

        IExpression Offset { get; set; }

        IExpression Value { get; set; }

    }
}

