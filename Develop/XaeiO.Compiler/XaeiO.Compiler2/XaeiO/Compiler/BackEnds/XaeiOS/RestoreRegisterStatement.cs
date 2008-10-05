using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class RestoreRegisterStatement : IStatement
    {
        private int _register;
        public int Register
        {
            get { return _register; }
            set { _register = value; }
        }

        private int _frameOffset;
        public int FrameOffset
        {
            get { return _frameOffset; }
            set { _frameOffset = value; }
        }

        public RestoreRegisterStatement(int register, int frameOffset)
        {
            _register = register;
            _frameOffset = frameOffset;
        }
    }
}
