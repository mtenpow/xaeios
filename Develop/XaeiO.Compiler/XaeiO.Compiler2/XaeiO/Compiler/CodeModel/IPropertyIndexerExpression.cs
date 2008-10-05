namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;

    public interface IPropertyIndexerExpression : IExpression
    {
        IList<IExpression> Indices { get; }

        IPropertyReferenceExpression Target { get; set; }

    }
}

