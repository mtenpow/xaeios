namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IMethodInvokeExpression : IExpression
    {
        IList<IExpression> Arguments { get; set; }

        IExpression Method { get; set; }

    }
}

