using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class NativeThrowExceptionStatement : IStatement
    {
        public IExpression Expression
        {
            get;
            set;
        }

        public NativeThrowExceptionStatement(IExpression exception)
        {
            Expression = exception;
        }

        public override string ToString()
        {
            return "throw " + Expression.ToString();
        }
    }
}
