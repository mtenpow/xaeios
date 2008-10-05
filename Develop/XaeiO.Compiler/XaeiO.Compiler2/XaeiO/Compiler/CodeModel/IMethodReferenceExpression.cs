namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IMethodReferenceExpression : IExpression
    {
        MethodReference Method { get; set; }

        IExpression Target { get; set; }

        bool IsVirtual { get; set; }

    }
}

