using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class ExecutionPointerSpecialRegisterReferenceExpression : SpecialRegisterReferenceExpression
    {
        public ExecutionPointerSpecialRegisterReferenceExpression()
            : base(SpecialRegister.ExecutionPointer)
        {
        }
    }
}
