namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;

    public interface IFieldOfExpression : IExpression
    {
        FieldReference Field { get; set; }

    }
}

