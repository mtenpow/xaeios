namespace XaeiO.Compiler.CodeModel
{
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IArrayInitializerExpression : IExpression
    {
        IList<IExpression> Expressions { get; set;  }

    }
}

