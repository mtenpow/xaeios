using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Principal;
using System;

namespace XaeiOS.Security
{
    public sealed class ManifestPrincipal : IPrincipal
    {
        public ManifestPrincipal ParentManifest
        {
            get;
            private set;
        }

        internal ManifestPrincipal(ManifestPrincipal parentManifest, IIdentity identity)
        {
            ParentManifest = parentManifest;
            Identity = identity;
        }

        #region IPrincipal Members

        public IIdentity Identity
        {
            get;
            private set;
        }

        public bool IsInRole(string role)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
