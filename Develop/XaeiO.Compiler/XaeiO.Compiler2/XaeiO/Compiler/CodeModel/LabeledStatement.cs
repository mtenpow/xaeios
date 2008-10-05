using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class LabeledStatement : ILabeledStatement
    {
        #region ILabeledStatement Members

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
        private string _name;

        public IStatement Statement
        {
            get
            {
                return _statement;
            }
            set
            {
                _statement = value;
            }
        }
        private IStatement _statement;

        #endregion

        public LabeledStatement(string name, IStatement statement)
        {
            _name = name;
            _statement = statement;
        }

        public LabeledStatement(string name)
        {
            _name = name;
        }

        internal LabeledStatement()
        {
        }
    }
}
