namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IGenericDefaultExpression : IExpression
    {
        GenericInstanceType GenericInstanceType { get; set; }

    }
}

