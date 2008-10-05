namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IPropertyReferenceExpression : IExpression
    {
        PropertyReference Property { get; set; }

        IExpression Target { get; set; }

    }
}

