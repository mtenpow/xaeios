using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class TypeReferenceExpression : ITypeReferenceExpression, IExpression
    {
        #region ITypeReferenceExpression Members

        public TypeReference Type
        {
            get
            {
                return _type;
            }
            set
            {
                _type = value;
            }
        }
        private TypeReference _type;

        #endregion

        #region IExpression Members

        TypeReference IExpression.Type
        {
            get
            {
                return NullType.Instance;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public TypeReferenceExpression(TypeReference type)
        {
            _type = type;
        }

        internal TypeReferenceExpression()
        {
        }

        public override string ToString()
        {
            return Type.ToString();
        }
    }
}
