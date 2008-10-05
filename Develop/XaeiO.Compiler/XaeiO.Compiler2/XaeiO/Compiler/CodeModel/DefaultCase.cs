using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.CodeModel
{
    public class DefaultCase : IDefaultCase
    {

        #region ISwitchCase Members

        public IBlockStatement Body
        {
            get
            {
                if (_body == null)
                {
                    _body = new BlockStatement();
                }
                return _body;
            }
            set
            {
                _body = value;
            }
        }
        private IBlockStatement _body;

        #endregion

        public DefaultCase()
        {
        }

        public override string ToString()
        {
            return string.Format("default: {\n{1}\n}", Body);
        }
    }
}
