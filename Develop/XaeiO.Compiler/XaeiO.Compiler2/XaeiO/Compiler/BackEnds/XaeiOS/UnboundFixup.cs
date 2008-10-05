using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

using XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class UnboundFixup
    {
        private uint _offset;
        public uint Offset
        {
            get { return _offset; }
            set { _offset = value; }
        }

        private object _reference;
        public object Reference
        {
            get { return _reference; }
            set { _reference = value; }
        }

        private MethodDefinition _context;
        public MethodDefinition Context
        {
            get { return _context; }
            set { _context = value; }
        }

        private FixupType _type;
        public FixupType Type
        {
            get { return _type; }
            set { _type = value; }
        }

        public UnboundFixup()
        {
        }
    }
}
