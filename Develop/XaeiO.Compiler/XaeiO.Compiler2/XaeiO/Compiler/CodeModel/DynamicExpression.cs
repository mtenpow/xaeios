using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class DynamicExpression : IExpression
    {
        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return NullType.Instance; // TODO: is this the right type to return here?
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        private DynamicExpressionDelegate _delegate;

        public DynamicExpressionDelegate Delegate
        {
            get { return _delegate; }
            set { _delegate = value; }
        }

        public DynamicExpression(DynamicExpressionDelegate d)
        {
            _delegate = d;
        }

        internal DynamicExpression()
        {
        }

        public override string ToString()
        {
            return "[dynamic expression]";
        }
    }

    public delegate void DynamicExpressionDelegate();
}
