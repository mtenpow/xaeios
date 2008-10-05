using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ArgumentReferenceExpression : IArgumentReferenceExpression
    {
        #region IArgumentReferenceExpression Members

        public Mono.Cecil.ParameterReference Parameter
        {
            get
            {
                return _parameter;
            }
            set
            {
                _parameter = value;
            }
        }
        private ParameterReference _parameter;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return Parameter.ParameterType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ArgumentReferenceExpression(ParameterReference parameter)
        {
            _parameter = parameter;
        }

        internal ArgumentReferenceExpression()
        {
        }

        public override string ToString()
        {
            return Parameter.Name;
        }
    }
}
