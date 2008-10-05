using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class ArrayIndexerExpression : IArrayIndexerExpression
    {
        #region IArrayIndexerExpression Members

        public IList<IExpression> Indices
        {
            get
            {
                if (_indices == null)
                {
                    _indices = new List<IExpression>();
                }
                return _indices;
            }
            set
            {
                _indices = value;
            }
        }
        private IList<IExpression> _indices;

        private IExpression _target;

        public IExpression Target
        {
            get { return _target; }
            set { _target = value; }
        }

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return new ArrayType((TypeReference)CoreTypes.Object); // TODO: Hack!
                /*
                TypeDefinition resolvedType = ReferenceResolver.ResolveTypeReference(Target.TargetType);
                IArrayType arrayType = resolvedType as IArrayType;
                if (arrayType == null)
                {
                    throw new NotSupportedException("Expected array type"); // TODO: maybe a custom indexer?
                }
                return arrayType.ElementType;*/
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ArrayIndexerExpression(IExpression target, IExpression index)
        {
            _target = target;
            Indices.Add(index);
        }

        internal ArrayIndexerExpression()
        {
        }

        public override string ToString()
        {
            // TODO: Multiple indices
            return string.Format("{0}[{1}]", Target, Indices[0]);
        }
    }
}
