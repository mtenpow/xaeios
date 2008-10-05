using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Principal;

namespace System.Net.Comet
{
    public class CometClientPrincipal : GenericPrincipal
    {
        public CometClientIdentity CometClientIdentity
        {
            get
            {
                return (CometClientIdentity)Identity;
            }
        }
        public CometClientPrincipal(CometClientIdentity identity)
            : base(identity, null)
        {
        }
        public override string ToString()
        {
            return CometClientIdentity.ToString();
        }
    }
}
