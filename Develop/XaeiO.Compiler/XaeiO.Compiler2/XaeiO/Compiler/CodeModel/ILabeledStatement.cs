namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ILabeledStatement : IStatement
    {
        string Name { get; set; }

        IStatement Statement { get; set; }

    }
}

