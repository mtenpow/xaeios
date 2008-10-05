using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class ObjectInitializeExpression : IObjectInitializeExpression, IExpression
    {
        #region IObjectInitializeExpression Members

        private Mono.Cecil.TypeReference _type;

        public Mono.Cecil.TypeReference Type
        {
            get { return _type; }
            set { _type = value; }
        }
        private IExpression _expression;

        public IExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        #endregion

        public ObjectInitializeExpression(IExpression expression, Mono.Cecil.TypeReference type)
        {
            _type = type;
            _expression = expression;
        }

        internal ObjectInitializeExpression()
        {
        }

        #region IExpression Members

        Mono.Cecil.TypeReference IExpression.Type
        {
            get
            {
                return _expression.Type;
            }
            set
            {
                _expression.Type = value;
            }
        }

        #endregion
    }
}
