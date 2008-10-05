using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class AddressOfExpression : IAddressOfExpression
    {
        #region IAddressOfExpression Members

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
                return new PointerType(Expression.Type);
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        #endregion

        public AddressOfExpression(IExpression expression)
        {
            _expression = expression;
        }

        internal AddressOfExpression()
        {
        }

        public override string ToString()
        {
            return String.Format("&{0}", Expression.ToString());
        }
    }
}
