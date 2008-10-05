using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{

    public class ExceptionExpression : IExceptionExpression
    {
        #region IExpression Members

        public TypeReference Type
        {
            get
            {
                return CoreTypes.Exception;
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        #endregion

        public ExceptionExpression()
        {
        }

        public override string ToString()
        {
            return "$e";
        }
    }
}
