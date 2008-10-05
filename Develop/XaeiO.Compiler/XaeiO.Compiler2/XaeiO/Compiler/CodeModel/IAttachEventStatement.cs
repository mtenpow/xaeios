namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IAttachEventStatement : IStatement
    {
        IEventReferenceExpression Event { get; set; }

        IExpression Listener { get; set; }

    }
}

