using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class ParentContinuationObjectSpecialRegisterReferenceExpression : IArrayIndexerExpression
    {
        private SpecialRegister _register;

        public SpecialRegister Register
        {
            get { return _register; }
            set { _register = value; }
        }
        public ParentContinuationObjectSpecialRegisterReferenceExpression(SpecialRegister register)
        {
            _register = register;
        }

        #region IArrayIndexerExpression Members

        public IList<IExpression> Indices
        {
            get
            {
                List<IExpression> indices = new List<IExpression>();
                indices.Add(new Int32LiteralExpression((int)Register));
                return indices;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        public IExpression Target
        {
            get
            {
                return new ParentContinuationObjectRegisterReferenceExpression();
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Int32;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion
    }
}
