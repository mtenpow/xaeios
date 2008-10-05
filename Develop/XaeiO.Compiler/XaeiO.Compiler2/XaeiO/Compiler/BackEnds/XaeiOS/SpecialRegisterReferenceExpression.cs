using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class SpecialRegisterReferenceExpression : IExpression
    {
        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Object;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        private SpecialRegister _register;

        public SpecialRegister Register
        {
            get { return _register; }
            set { _register = value; }
        }

        public SpecialRegisterReferenceExpression(SpecialRegister register)
        {
            _register = register;
        }

        public override string ToString()
        {
            return SpecialRegisterHelper.GetSpecialRegisterName(Register);
        }
    }
}
