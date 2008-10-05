using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ThisReferenceExpression : IThisReferenceExpression
    {
        public ThisReferenceExpression(TypeReference type)
        {
            _type = type;
        }

        internal ThisReferenceExpression()
        {
        }

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
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
        TypeReference _type;

        #endregion

        public override string ToString()
        {
            return "this";
        }
    }
}
