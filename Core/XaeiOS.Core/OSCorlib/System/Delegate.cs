using System.Reflection;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System
{

    /// <summary>
    /// Represents a delegate, which is a data structure that refers to a static method or to a class instance and an instance method of that class.
    /// </summary>
    [CorlibCLRConjugate]
    [CLSCompliant(false)]
    public class Delegate
    {
        public object Target
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _target;
            }
        }
        private object _target;

        public NativeFunction Function
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _function;
            }
        }
        private NativeFunction _function;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private Delegate()
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        protected Delegate(object target, NativeFunction function)
        {
            InternalCreate(this, target, function);
        }

        [XaeiOSMethodImpl(MethodImplOptions.CompilerImpl)]
        protected virtual extern object Invoke(params object[] args);

        [XaeiOSMethodImpl(MethodImplOptions.CompilerImpl)]
        protected virtual extern object InvokeNative(params object[] args);

        protected virtual void InternalCombine(Delegate d)
        {
            throw new MulticastNotSupportedException();
        }

        public object DynamicInvoke(params object[] args)
        {
            return Invoke(args);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Delegate Create(object target, NativeFunction function)
        {
            return new Delegate(target, function);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void InternalCreate(Delegate d, object target, NativeFunction function)
        {
            d._target = target;
            d._function = function;
        }

        // TODO: This method has broken copy propagation in XaeiO.Compiler2
        private static Delegate BrokenCombine(Delegate a, Delegate b)
        {
            if (a == null)
            {
                //Console.WriteLine("Combined delegate is not multicast");
                return b;
            }
            if (b == null)
            {
                //Console.WriteLine("Combined delegate is not multicast");
                return a;
            }
            //Console.WriteLine("Combined delegate will be multicast");
            MulticastDelegate multicastDelegate = a as MulticastDelegate;
            if (multicastDelegate == null)
            {
                //Console.WriteLine("b was not multicast so creating a multicast delegate");
                multicastDelegate = MulticastDelegate.InternalCreate(a._target, a._function);
            }
            //Console.WriteLine("InternalCombine");
            multicastDelegate.InternalCombine(b);
            //Console.WriteLine("Combination done");
            return multicastDelegate;
        }

        public static Delegate Combine(Delegate a, Delegate b)
        {
            // TODO: Delegate::Combine
            if (a == null)
            {
                //Console.WriteLine("Combined delegate is not multicast");
                return b;
            }
            if (b == null)
            {
                //Console.WriteLine("Combined delegate is not multicast");
                return a;
            }
            //Console.WriteLine("Combined delegate will be multicast");
            MulticastDelegate multicastDelegate = a as MulticastDelegate;
            if (multicastDelegate == null)
            {
                multicastDelegate = MulticastDelegate.InternalCreate(a._target, a._function);
                multicastDelegate.InternalCombine(b);
                return multicastDelegate;
            }
            else
            {
                multicastDelegate.InternalCombine(b);
                return multicastDelegate;
            }
        }
        public static Delegate Remove(Delegate source, Delegate value)
        {
            throw new MulticastNotSupportedException("Delegate::Remove not yet implemented");
        }

        public static bool operator ==(Delegate d1, Delegate d2)
        {
            throw new NotImplementedException();
        }
        public static bool operator !=(Delegate d1, Delegate d2)
        {
            throw new NotImplementedException();
        }
    }
}
