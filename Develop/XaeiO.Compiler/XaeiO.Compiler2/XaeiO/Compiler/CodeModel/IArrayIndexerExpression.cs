namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IArrayIndexerExpression : IExpression
    {
        IList<IExpression> Indices { get; set;  }

        IExpression Target { get; set; }

    }
}

