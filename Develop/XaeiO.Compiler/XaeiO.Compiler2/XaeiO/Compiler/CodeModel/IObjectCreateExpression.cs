namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IObjectCreateExpression : IExpression
    {
        IList<IExpression> Arguments { get; set; }

        MethodReference Constructor { get; set; }

    }
}

