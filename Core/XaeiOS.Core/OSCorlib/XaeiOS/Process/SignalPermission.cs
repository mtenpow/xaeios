using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Resources;
using System.Security;
using System.Security.Principal;

using XaeiOS;
using XaeiOS.Process;
using XaeiOS.Security;

namespace XaeiOS.Process
{
    public class SignalPermission : IPermission
    {
        private Signal _signal;
        private int _data;

        public SignalPermission(Signal signal, int data)
        {
            _signal = signal;
            _data = data;
        }

        #region IPermission Members

        public IPermission Copy()
        {
            return new SignalPermission(_signal, _data);
        }

        public void Demand()
        {
            lock (SIP.CurrentSIP.SyncRoot)
            {
                List<IPrincipal> principals = SIP.CurrentSIP.GetPrincipals();
                for (int i = 0; i < principals.Count; i++)
                {
                    IPrincipal principal = principals[i];
                    if (principal is ExternalPrincipal && _signal != Signal.Custom)
                    {
                        throw new SecurityException("The external process may only send custom signals");
                    }
                }
            }
        }

        public IPermission Intersect(IPermission target)
        {
            throw new NotImplementedException();
        }

        public bool IsSubsetOf(IPermission target)
        {
            throw new NotImplementedException();
        }

        public IPermission Union(IPermission target)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
