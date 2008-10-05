using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class TryCatchFinallyStatement : ITryCatchFinallyStatement
    {
        #region ITryCatchFinallyStatement Members

        public IList<ICatchClause> CatchClauses
        {
            get {
                if (_catchClauses == null)
                {
                    _catchClauses = new List<ICatchClause>();
                }
                return _catchClauses;
            }
            set
            {
                _catchClauses = value;
            }
        }
        private IList<ICatchClause> _catchClauses;

        public IBlockStatement Fault
        {
            get
            {
                if (_fault == null)
                {
                    _fault = new BlockStatement();
                }
                return _fault;
            }
            set
            {
                _fault = value;
            }
        }
        private IBlockStatement _fault;

        public IBlockStatement Finally
        {
            get
            {
                if (_finally == null)
                {
                    _finally = new BlockStatement();
                }
                return _finally;
            }
            set
            {
                _finally = value;
            }
        }
        private IBlockStatement _finally;

        public IBlockStatement Try
        {
            get
            {
                if (_try == null)
                {
                    _try = new BlockStatement();
                }
                return _try;
            }
            set
            {
                _try = value;
            }
        }
        private IBlockStatement _try;

        #endregion

        public TryCatchFinallyStatement()
        {
        }
    }
}
