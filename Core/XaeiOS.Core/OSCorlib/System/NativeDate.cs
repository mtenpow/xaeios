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

        [Dummy]
        public extern NativeDate(long milliseconds);

        [Intrinsic("getTime")]
        public extern long GetTime();

        [Intrinsic("getTimezoneOffset")]
        public extern long GetTimezoneOffset();

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
        public static extern long operator -(NativeDate a, long b);
        [Intrinsic]
        public static extern long operator -(long a, NativeDate b);
        [Intrinsic]
        public static extern long operator -(NativeDate a, NativeDate b);

        [Intrinsic("parse")]
        public static extern long Parse(string dateString);
	}
}
