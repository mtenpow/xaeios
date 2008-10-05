using System;
using System.Collections.Generic;
using System.Text;

using System.Security.Principal;


namespace System.Net.Comet
{
    public class CometClientIdentity : GenericIdentity
    {
        private string _password;
        public string Password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }

        public CometClientIdentity(string name)
            : base(name)
        {
        }
        public override string ToString()
        {
            return this.Name + ":" + _password;
        }
    }
}