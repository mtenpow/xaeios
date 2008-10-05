using System.Collections.Generic;

namespace XaeiO.Compiler.CodeModel
{
    public interface IBlockStatement : IStatement
    {
        IList<IStatement> Statements
        {
            get;
            set;
        }
    }
}

