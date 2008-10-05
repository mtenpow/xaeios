using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    [CLSCompliant(false)]
    [Intrinsic("Function", UseGlobalNamespace = true, SetVTable = true)]
    public class NativeFunction : NativeObject
    {
        [Intrinsic]
        public extern NativeFunction(string args, string body);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.apply({0}, {1})")]
        public extern var Apply(var target, var[] args);

        [Intrinsic("call")]
        public extern var Call(var target, params var[] args);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} == {1})")]
        public static extern bool operator ==(NativeFunction a, NativeFunction b);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "({0} != {1})")]
        public static extern bool operator !=(NativeFunction a, NativeFunction b);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "arguments")]
        public static extern var[] GetArguments();

        [Intrinsic("toString")]
        public extern string NativeToString();

        // TODO: XaeiO.Compiler should prevent non-preemptive methods from override pre-emptive methods
        public override string ToString()
        {
            return this.NativeToString();
        }

        /*
         * function $A(i)
{
    if(!i) return [];
    var a = new Array(i.length);
    for(var k=0;k<i.length;k++)
    {
        a[k] = i[k];
    }
    return a;
}
Function.prototype.bind = function()
{
    var m = this;
    var a = $A(arguments);
    var o = a.shift();
    return function() {
        return m.apply(o, a.concat($A(arguments)));
    }
}
         */
        
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public NativeFunction Bind(var self)
        {
            NativeFunction fn = GenerateCodeForThis();
            if (GetArguments().Length == 1) // optimization for delegate create
            {
                return GenerateCodeForBoundNativeFunctionSimple(fn, self);
            }
            else
            {
                throw new NativeError("Not yet implemented");
                /* // TODO: This code causes a bug in CopyPropagation for BasicMiddleEnd: Array out of bounds for a Set
                NativeArray args = new NativeArray();
                for (int i = 0; i < GetArguments().Length; i++)
                {
                    args[i] = GetArguments()[i];
                }
                var self = args.Shift();
                return GenerateCodeForBoundNativeFunction(fn, self, args);
                 */
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "this")]
        public static extern NativeFunction GenerateCodeForThis();
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "function(){ return {0}.apply({1}, arguments); }")]
        public static extern NativeFunction GenerateCodeForBoundNativeFunctionSimple(NativeFunction fn, var self);
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "function(){ throw new Error(\"Complex NativeFunction bind not yet implemented by XaeiOS\") }")]
        public static extern NativeFunction GenerateCodeForBoundNativeFunction(NativeFunction fn, var self, var[] args);

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static explicit operator NativeFunction(Delegate d)
        {
            var delegateVar = var.Cast<Delegate>(d);
            if (delegateVar.TypeOf() == "function")
            {
                return delegateVar.Cast<NativeFunction>();
            }
            else
            {
                throw new InvalidCastException("Cannot cast non native delegate to a native function");
            }
        }
    }
}
