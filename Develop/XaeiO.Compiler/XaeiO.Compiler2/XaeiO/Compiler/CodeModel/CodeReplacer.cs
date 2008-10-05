using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public delegate T CodeReplacer<T>(T codeObject) where T : ICodeObject;
}
