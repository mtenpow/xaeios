using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class Fixup
    {
        private string _description;
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        private uint _offset;
        public uint Offset
        {
            get { return _offset; }
            set { _offset = value; }
        }

        private FixupType _type;

        public FixupType Type
        {
            get { return _type; }
            set { _type = value; }
        }

        private int _index;

        public int Index
        {
            get { return _index; }
            set { _index = value; }
        }

        public Fixup()
        {
        }
    }

    [Flags]
    public enum FixupType
    {
        None = 0,
        CodeSection = 1,
        DataSection = 2,
        InitializationSection = 4,
        SectionMask = CodeSection | DataSection | InitializationSection,
        MethodCodePointer = 8,
        VTableDataPointer = 16,
        StaticFieldDataPointer = 32,
        VTableSlot = 64
    }
}
