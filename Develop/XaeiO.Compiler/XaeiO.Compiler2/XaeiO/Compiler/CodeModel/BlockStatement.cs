using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class BlockStatement : IBlockStatement
    {
        #region IBlockStatement Members

        public IList<IStatement> Statements
        {
            get
            {
                if (_statements == null)
                {
                    _statements = new List<IStatement>();
                }
                return _statements;
            }
            set
            {
                _statements = value;
            }
        }
        private IList<IStatement> _statements;

        #endregion

        public BlockStatement()
        {
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            foreach (IStatement statement in Statements)
            {
                sb.AppendLine(statement.ToString());
            }
            sb.Append("}");
            return sb.ToString();
        }
    }
}
