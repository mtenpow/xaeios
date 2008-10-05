namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ISwitchCase : ICodeObject
    {
        IBlockStatement Body { get; set; }

    }
}

