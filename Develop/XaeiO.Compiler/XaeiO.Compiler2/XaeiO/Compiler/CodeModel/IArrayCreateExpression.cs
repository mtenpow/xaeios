namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IArrayCreateExpression : IExpression
    {
        IList<IExpression> Dimensions { get; set;  }

        IExpression Initializer { get; set; }

        TypeReference Type { get; set; }

    }
}

