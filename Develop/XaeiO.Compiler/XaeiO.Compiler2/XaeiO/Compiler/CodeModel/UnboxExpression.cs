namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public class UnboxExpression : IUnboxExpression
    {
        #region IUnboxExpression Members

        public IExpression Expression
        {
            get;
            set;
        }

        #endregion

        #region IExpression Members

        public TypeReference Type
        {
            get;
            set;
        }

        #endregion

        public UnboxExpression(IExpression expression, TypeReference type)
        {
            Expression = expression;
            Type = type;
        }

        internal UnboxExpression()
        {
        }
    }
}

