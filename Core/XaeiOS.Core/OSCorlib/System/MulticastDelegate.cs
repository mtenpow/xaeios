using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Summary description for MulticastDelegate.
	/// </summary>
    [CLSCompliant(false)]
    [CorlibCLRConjugate]
	public class MulticastDelegate : Delegate
    {
        private MulticastDelegate _next;
        private MulticastDelegate _prev;

        protected MulticastDelegate(object target, NativeFunction function)
            : base(target, function)
        {
        }

        protected override object Invoke(params object[] args)
        {
            //Console.WriteLine("Invoking multicast delegate");
            object ret = base.Invoke(args);
            if (_next != null)
            {
                //Console.WriteLine(" => ");
                ret = _next.Invoke(args);
            }
            return ret;
        }

        protected override object InvokeNative(params object[] args)
        {
            throw new MulticastNotSupportedException("Native multicast delegates are not supported");
        }

        protected override void InternalCombine(Delegate d)
        {
            MulticastDelegate current = this;
            while (current._next != null) // get to the end of the chain
            {
                //Console.WriteLine(" -> ");
                current = current._next;
            }
            MulticastDelegate multicastDelegate = d as MulticastDelegate;
            if (multicastDelegate == null)
            {
                //Console.WriteLine("Creating new secondary multicast delegate for InternalCombine");
                multicastDelegate = new MulticastDelegate(d.Target, d.Function);
            }
            else
            {
                //Console.WriteLine("Cloning secondary delegate for InternalCombine");
                multicastDelegate = multicastDelegate.Clone();
            }
            current._next = multicastDelegate;
            multicastDelegate._prev = current;
        }

        public MulticastDelegate Clone()
        {
            MulticastDelegate headClone = new MulticastDelegate(Target, Function);
            MulticastDelegate prevClone = headClone;
            MulticastDelegate current = headClone._next;
            MulticastDelegate clone;
            while (current != null)
            {
                clone = new MulticastDelegate(current.Target, current.Function);
                clone._prev = prevClone;
                prevClone = clone;
                current = current._next;
            }
            return headClone;
        }

        internal static MulticastDelegate InternalCreate(object target, NativeFunction function)
        {
            return new MulticastDelegate(target, function);
        }
    }
}
