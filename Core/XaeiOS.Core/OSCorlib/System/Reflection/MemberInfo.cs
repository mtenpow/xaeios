using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace System.Reflection
{
    public abstract class MemberInfo
    {
        public abstract Type DeclaringType
        {
            get;
        }

        public abstract string Name
        {
            get;
        }

        public abstract bool IsDefined(Type attributeType, bool inherit);
    }
}
