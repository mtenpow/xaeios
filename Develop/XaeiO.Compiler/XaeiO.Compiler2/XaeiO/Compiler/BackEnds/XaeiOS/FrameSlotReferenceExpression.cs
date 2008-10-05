using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class FrameSlotReferenceExpression : IExpression
    {
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

        public FrameSlot FrameSlot
        {
            get;
            set;
        }

        public FrameSlotReferenceExpression(FrameSlot frameSlot)
        {
            FrameSlot = frameSlot;
        }

        public override string ToString()
        {
            return "Frame[" + FrameSlot.ToString() + "]";
        }
    }
}
