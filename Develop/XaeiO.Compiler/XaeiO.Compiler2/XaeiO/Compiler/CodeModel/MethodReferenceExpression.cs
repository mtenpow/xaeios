using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class MethodReferenceExpression : IMethodReferenceExpression
    {
        #region IMethodReferenceExpression Members

        public Mono.Cecil.MethodReference Method
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
        private MethodReference _method;

        public IExpression Target
        {
            get
            {
                return _target;
            }
            set
            {
                _target = value;
            }
        }
        private IExpression _target;

        public bool IsVirtual
        {
            get
            {
                return _isVirtual;
            }
            set
            {
                _isVirtual = value;
            }
        }
        private bool _isVirtual;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return new FunctionPointerType(_method.HasThis, _method.ExplicitThis, _method.CallingConvention, _method.ReturnType);
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public MethodReferenceExpression(IExpression target, MethodReference method, bool isVirtual)
        {
            _target = target;
            _method = method;
            _isVirtual = isVirtual;
        }

        public MethodReferenceExpression(IExpression target, MethodReference method) : this(target, method, false)
        {
        }

        internal MethodReferenceExpression()
        {
        }

        public override string ToString()
        {
            if (Target is ITypeReferenceExpression)
            {
                return string.Format("{0}::{1}", Target, Method.Name);
            }
            else
            {
                return string.Format("{0}.{1}", Target, Method.Name);
            }
        }
    }
}
