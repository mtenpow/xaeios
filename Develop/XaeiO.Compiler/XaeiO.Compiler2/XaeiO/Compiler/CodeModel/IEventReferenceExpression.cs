namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public interface IEventReferenceExpression : IExpression
    {
        EventReference Event { get; set; }

        IExpression Target { get; set; }

    }
}

