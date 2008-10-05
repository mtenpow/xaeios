using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{
    /// <summary>
    /// Summary description for Array.
    /// </summary>
    [CLSCompliant(false)]
    [Intrinsic("Array", UseGlobalNamespace = true, SetVTable = true)]
    public class NativeArray<T> : NativeObject
    {
        [Dummy]
        public extern NativeArray();

        [Dummy]
        public extern NativeArray(int length);

        [Intrinsic("length")]
        public extern int Length
        {
            //[XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.length")]
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            //[XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}.length = {0}")]
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set;
        }

        public extern new T this[NativeNumber index]
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}]")]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}] = {1}")]
            set;
        }

        [Intrinsic("push")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern void Push(T t);
        [Intrinsic("join")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Join(string separator);
        [Intrinsic("split")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern string Split(string separator);
        [Intrinsic("pop")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern T Pop();

        [Intrinsic("shift")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern T Shift();

        [Intrinsic("unshift")]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public extern T Unshift();

        [Dummy]
        public static extern implicit operator T[](NativeArray<T> a);

        [Dummy]
        public static extern implicit operator NativeArray<T>(T[] a);

        public void RemoveAt(int i)
        {
            // TODO: RemoveAt
            throw new NotImplementedException();
        }
    }

    [CLSCompliant(false)]
    [Intrinsic("Array", UseGlobalNamespace = true, SetVTable = false)]
    public class NativeArray : NativeArray<var>
    {
        [Dummy]
        public extern NativeArray();

        [Dummy]
        public extern NativeArray(int length);
    }

    [CLSCompliant(false)]
    [Intrinsic("Array", UseGlobalNamespace = true, SetVTable = false)]
    public abstract class Array
    {
        [Intrinsic("length")]
        public extern int Length
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
        }
    }
}
