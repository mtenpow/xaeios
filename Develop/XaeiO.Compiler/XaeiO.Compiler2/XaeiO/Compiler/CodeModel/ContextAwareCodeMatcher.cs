using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public delegate bool ContextAwareCodeMatcher<T>(T codeObject, ICodeObject context) where T : ICodeObject;
}
