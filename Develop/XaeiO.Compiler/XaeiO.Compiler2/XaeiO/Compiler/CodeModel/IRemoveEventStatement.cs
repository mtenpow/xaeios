namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface IRemoveEventStatement : IStatement
    {
        IEventReferenceExpression Event { get; set; }

        IExpression Listener { get; set; }

    }
}

