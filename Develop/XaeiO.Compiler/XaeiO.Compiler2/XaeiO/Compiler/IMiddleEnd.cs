using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

namespace XaeiO.Compiler
{
    public interface IMiddleEnd : ICompilerTier
    {
        List<ITransformation> CustomTransformations
        {
            get;
        }
        void TransformCode(MethodCompileInfo compileInfo);
        void TransformAssembly(AssemblyCompileInfo compileInfo);
    }
}
