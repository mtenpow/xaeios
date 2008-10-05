using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ArrayLengthExpression : IArrayLengthExpression
    {
        #region IArrayLengthExpression Members

        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Int32;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ArrayLengthExpression(IExpression expression)
        {
            _expression = expression;
        }

        internal ArrayLengthExpression()
        {
        }

        public override string ToString()
        {
            return String.Format("{0}.Length", Expression.ToString());
        }
    }
}
