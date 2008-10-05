using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class ContinuationObjectExpression : IExpression
    {
        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return CoreTypes.Array;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public ContinuationObjectExpression()
        {
        }

        public override string ToString()
        {
            return "[Continuation]";
        }
    }
}
