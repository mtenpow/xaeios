using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Diagnostics;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class VTable
    {
        private TypeDefinition _type;

        public TypeDefinition Type
        {
            get { return _type; }
            set { _type = value; }
        }

        private List<MethodDefinition> _slots;

        public List<MethodDefinition> Slots
        {
            get
            {
                if (_slots == null)
                {
                    _slots = new List<MethodDefinition>();
                }
                return _slots;
            }
            set { _slots = value; }
        }

        private Dictionary<TypeDefinition, Dictionary<MethodDefinition, MethodDefinition>> _interfaceMap;

        public Dictionary<TypeDefinition, Dictionary<MethodDefinition, MethodDefinition>> InterfaceMap
        {
            get
            {
                if (_interfaceMap == null)
                {
                    _interfaceMap = new Dictionary<TypeDefinition, Dictionary<MethodDefinition, MethodDefinition>>();
                }
                return _interfaceMap;
            }
            set { _interfaceMap = value; }
        }

        public VTable()
        {
        }

        public override string ToString()
        {
            return string.Format("VTable: {0}", Type.ToString());
        }
    }
}