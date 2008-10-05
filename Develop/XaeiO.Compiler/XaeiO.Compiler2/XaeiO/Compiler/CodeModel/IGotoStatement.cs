namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IGotoStatement : IStatement
    {
        string Name { get; set; }

    }
}

