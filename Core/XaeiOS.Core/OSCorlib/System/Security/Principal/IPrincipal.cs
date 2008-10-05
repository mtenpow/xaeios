using System.Reflection;
using System.Runtime.CompilerServices;

namespace System.Security.Principal
{
    public interface IPrincipal
    {
        IIdentity Identity { get; }
        bool IsInRole(string role);
    }
}
