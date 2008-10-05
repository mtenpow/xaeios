using System.Collections.Generic;

namespace XaeiO.Compiler.CodeModel
{
    using System;

    public interface ITryCatchFinallyStatement : IStatement
    {
        IList<ICatchClause> CatchClauses { get; set;  }

        IBlockStatement Fault { get; set; }

        IBlockStatement Finally { get; set; }

        IBlockStatement Try { get; set; }

    }
}

