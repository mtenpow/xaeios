using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public abstract class Expression : IExpression
    {
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
        private TypeReference _type;

        #endregion

        public Expression(TypeReference type)
        {
            _type = type;
        }
    }
}
