using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ArrayCreateExpression : IArrayCreateExpression
    {
        #region IArrayCreateExpression Members

        public IList<IExpression> Dimensions
        {
            get
            {
                if(_dimensions == null)
                {
                    _dimensions = new List<IExpression>();
                }
                return _dimensions;
            }
            set
            {
                _dimensions = value;
            }
        }
        private IList<IExpression> _dimensions;

        public IExpression Initializer
        {
            get
            {
                return _initializer;
            }
            set
            {
                _initializer = value;
            }
        }
        private IExpression _initializer;

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
        private Mono.Cecil.TypeReference _type;

        #endregion

        public ArrayCreateExpression(Mono.Cecil.TypeReference type, IExpression dimension)
        {
            _type = type;
            Dimensions.Add(dimension);
        }

        internal ArrayCreateExpression()
        {
        }

        #region IArrayCreateExpression Members


        Mono.Cecil.TypeReference IArrayCreateExpression.Type
        {
            get
            {
                return new ArrayType((TypeReference)_type);
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        public override string ToString()
        {
            // TODO: Initializer and dimensions
            return string.Format("new {0}[{1}]", Type, Dimensions[0]);
        }

        #endregion
    }
}
