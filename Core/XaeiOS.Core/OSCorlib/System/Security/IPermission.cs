using System.Reflection;
using System.Runtime.CompilerServices;

namespace System.Security
{
    /// <summary>
    /// Defines methods implemented by permission types.
    /// </summary>
    public interface IPermission
    {
        IPermission Copy();
        void Demand();
        IPermission Intersect(IPermission target);
        bool IsSubsetOf(IPermission target);
        IPermission Union(IPermission target);
    }
}
