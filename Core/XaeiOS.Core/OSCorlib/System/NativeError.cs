using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace System
{
    [Intrinsic("Error",UseGlobalNamespace = true)]
	public class NativeError : Exception
	{
        [Intrinsic]
        public extern NativeError();

        [Intrinsic]
        public extern NativeError(string message);

        public override string ToString()
        {
            return NativeToString();
        }

        [Intrinsic("toString")]
        private extern string NativeToString();
	}
}
