using System;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// TODO: Summary description for WeakReference.
    /// </summary>
    [CorlibCLRConjugate]
	public class WeakReference
	{
        public bool IsAlive
        {
            get
            {
                throw new NotSupportedException("WeakReference not supported");
            }
        }

        public object Target
        {
            get
            {
                throw new NotSupportedException("WeakReference not supported");
            }
        }

        public WeakReference(object target)
        {
            throw new NotSupportedException("WeakReference not supported");
        }
	}
}
