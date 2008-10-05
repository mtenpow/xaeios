using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    /// <summary>
    /// Summary description for Decimal.
    /// </summary>
    [Intrinsic("Number", UseGlobalNamespace = true)]
    public struct Decimal
    {
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString()")]
        public override string ToString()
        {
            return this.ToString();
        }
    }
}
