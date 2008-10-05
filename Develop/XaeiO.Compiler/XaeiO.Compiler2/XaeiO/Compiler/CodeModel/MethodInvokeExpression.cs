using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class MethodInvokeExpression : IMethodInvokeExpression
    {
        #region IMethodInvokeExpression Members

        public IList<IExpression> Arguments
        {
            get
            {
                if (_arguments == null)
                {
                    _arguments = new List<IExpression>();
                }
                return _arguments;
            }
            set
            {
                _arguments = value;
            }
        }
        private IList<IExpression> _arguments;

        public IExpression Method
        {
            get
            {
                return _method;
            }
            set
            {
                _method = value;
            }
        }
        private IExpression _method;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                IMethodReferenceExpression methodReferenceExpression = _method as IMethodReferenceExpression;
                if (methodReferenceExpression != null)
                {
                    return methodReferenceExpression.Method.ReturnType.ReturnType;
                }
                else
                {
                    throw new NotImplementedException(); // TODO: MethodInvokeExpression.get_Type
                }
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public MethodInvokeExpression(IExpression method)
        {
            _method = method;
        }

        internal MethodInvokeExpression()
        {
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("{0}(", Method.ToString());
            for (int i = 0; i < Arguments.Count; i++)
            {
                sb.Append(Arguments[i].ToString());
                if (i < Arguments.Count - 1)
                {
                    sb.Append(", ");
                }
            }
            sb.Append(")");
            return sb.ToString();
        }
    }
}
