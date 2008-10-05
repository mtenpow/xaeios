using System.Reflection;
using System.Runtime.CompilerServices;

namespace System.Security
{
    public class SecurityException : Exception
    {
        public SecurityException(string message) : base(message)
        {
        }
    }
}
