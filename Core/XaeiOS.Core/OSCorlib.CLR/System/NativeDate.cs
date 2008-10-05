using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for NativeDate.
    /// </summary>
    [CLSCompliant(false)]
    [Intrinsic("Date", UseGlobalNamespace = true, SetVTable = true)]
	public class NativeDate : NativeObject
	{
        [Dummy]
        public extern NativeDate();

        //[XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation="{this}.getTime()")]
        [Intrinsic("getTime")]
        public extern long GetTime();

        [Intrinsic]
        public static extern bool operator <(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern bool operator <=(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern bool operator >(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern bool operator >=(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern bool operator ==(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern bool operator !=(NativeDate a, NativeDate b);

        [Intrinsic]
        public static extern bool operator <(NativeDate a, long b);
        [Intrinsic]
        public static extern bool operator <=(NativeDate a, long b);
        [Intrinsic]
        public static extern bool operator >(NativeDate a, long b);
        [Intrinsic]
        public static extern bool operator >=(NativeDate a, long b);
        [Intrinsic]
        public static extern bool operator ==(NativeDate a, long b);
        [Intrinsic]
        public static extern bool operator !=(NativeDate a, long b);

        [Intrinsic]
        public static extern long operator +(NativeDate a, long b);
        [Intrinsic]
        public static extern long operator -(NativeDate a, long b);
        [Intrinsic]
        public static extern long operator +(NativeDate a, NativeDate b);
        [Intrinsic]
        public static extern long operator -(NativeDate a, NativeDate b);
	}
}
