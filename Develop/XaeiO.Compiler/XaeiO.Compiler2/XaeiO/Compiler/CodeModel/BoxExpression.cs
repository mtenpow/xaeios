namespace XaeiO.Compiler.CodeModel
{
    using System;
    using System.Collections.Generic;
    using Mono.Cecil;
    using Mono.Cecil.Cil;

    public class BoxExpression : IBoxExpression
    {
        #region IBoxExpression Members

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

        public BoxExpression(IExpression expression, TypeReference type)
        {
            Expression = expression;
            Type = type;
        }

        internal BoxExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("box({0},{1})", Type, Expression);
        }
    }
}

