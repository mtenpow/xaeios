using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class ParentContinuationObjectRegisterReferenceExpression : SpecialRegisterReferenceExpression
    {
        public ParentContinuationObjectRegisterReferenceExpression() : base(SpecialRegister.ParentContinuation)
        {
        }
    }
}
