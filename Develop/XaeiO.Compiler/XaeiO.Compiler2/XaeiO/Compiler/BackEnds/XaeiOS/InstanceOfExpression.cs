using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class InstanceOfExpression : IExpression
    {
        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Boolean;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        private string _typeName;

        public string TypeName
        {
            get { return _typeName; }
            set { _typeName = value; }
        }

        public InstanceOfExpression(IExpression expression, string typeName)
        {
            _expression = expression;
            _typeName = typeName;
        }

        public override string ToString()
        {
            return String.Format("{0} instanceof {1}", Expression, TypeName);
        }
    }
}
