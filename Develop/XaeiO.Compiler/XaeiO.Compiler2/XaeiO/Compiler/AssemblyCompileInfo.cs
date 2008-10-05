using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;
using Mono.Cecil.Cil;
using XaeiO.Compiler.CodeModel;
using Tenpow.Collections.Generic;
using XaeiO.Compiler.Optimization;

namespace XaeiO.Compiler
{
    public class AssemblyCompileInfo
    {
        public AssemblyDefinition Assembly
        {
            get;
            private set;
        }

        public Dictionary<MethodDefinition, MethodCompileInfo> MethodCompileInfos
        {
            get;
            private set;
        }
        public AssemblyCompileInfo(AssemblyDefinition assembly)
        {
            Assembly = assembly;
            MethodCompileInfos = new Dictionary<MethodDefinition, MethodCompileInfo>();
        }

        public MethodCompileInfo CreateMethodCompileInfo(MethodDefinition methodDefinition)
        {
            MethodCompileInfo compileInfo = new MethodCompileInfo(methodDefinition, this);
            MethodCompileInfos.Add(methodDefinition, compileInfo);
            return compileInfo;
        }
    }
}