using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class FramePropertyReferenceExpression : IExpression
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

        public FrameProperty FrameProperty
        {
            get;
            set;
        }

        public FramePropertyReferenceExpression(FrameProperty frameProperty)
        {
            FrameProperty = frameProperty;
        }

        public override string ToString()
        {
            return "Frame." + FrameProperty;
        }
    }
}
