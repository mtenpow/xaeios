namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IDelegateInvokeExpression : IExpression
    {
        IList<IExpression> Arguments { get; }

        IExpression Target { get; set; }

    }
}

