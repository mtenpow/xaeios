using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ObjectCreateExpression : IObjectCreateExpression
    {
        #region IObjectCreateExpression Members

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

        public MethodReference Constructor
        {
            get
            {
                return _constructor;
            }
            set
            {
                _constructor = value;
            }
        }
        private MethodReference _constructor;

        #endregion

        #region IExpression Members

        public TypeReference Type
        {
            get
            {
                return Constructor.DeclaringType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ObjectCreateExpression(MethodReference constructor)
        {
            _constructor = constructor;
        }

        internal ObjectCreateExpression()
        {
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("new {0}(", Constructor.ToString());
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
