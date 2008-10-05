using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    [CLSCompliant(false)]
    [CLRConjugate("XaeiOS.System.var")]
	public sealed class var
    {
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}")]
        public extern T Cast<T>();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0}")]
        public static extern var Cast<T>(T t);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0}")]
        public static extern T Cast<F,T>(F from);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString()")]
        public override string ToString()
        {
            return this.NativeToString();
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline | MethodImplOptions.CompilerImpl)]
        public extern bool InstanceOf(string typeName);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "typeof({this})")]
        public extern string TypeOf();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this} != undefined")]
        public extern bool IsDefined();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this} == null")]
        public extern bool IsNull();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "!{this}")]
        public extern bool Not();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.toString()")]
        public new extern string NativeToString();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0} != undefined")]
        public static extern bool IsDefined(var v);
    }
}
