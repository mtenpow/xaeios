namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IFieldReferenceExpression : IExpression
    {
        FieldReference Field { get; set; }

        IExpression Target { get; set; }

    }
}

