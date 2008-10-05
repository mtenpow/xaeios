using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Principal;

namespace XaeiOS.Security
{
    public sealed class ExternalIdentity : IIdentity
    {
        internal ExternalIdentity()
        {
        }

        #region IIdentity Members

        public string AuthenticationType
        {
            get { return null; }
        }

        public bool IsAuthenticated
        {
            get { return false; }
        }

        public string Name
        {
            get { return "External"; }
        }

        #endregion
    }
}
