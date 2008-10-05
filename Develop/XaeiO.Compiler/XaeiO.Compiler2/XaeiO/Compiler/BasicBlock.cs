using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler
{
    public class BasicBlock : IBlockStatement
    {
        public BasicBlock()
        {
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            foreach (IStatement statement in Statements)
            {
                sb.AppendLine(statement.ToString());
            }
            return sb.ToString();
        }

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
    }

    public class ComplexBlock : BasicBlock
    {
        private Dictionary<object, CFGEdge> _complexPaths = new Dictionary<object,CFGEdge>();

        public Dictionary<object, CFGEdge> ComplexPaths
        {
            get { return _complexPaths; }
            set { _complexPaths = value; }
        }
    }
}
