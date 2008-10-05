namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IDelegateCreateExpression : IExpression
    {
        TypeReference DelegateType { get; set; }

        MethodReference Method { get; set; }

        IExpression Target { get; set; }

    }
}

