using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;
using System.Reflection;

namespace System
{
    [CLSCompliant(false)]
    [CorlibCLRConjugate]
    public class Object
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Object()
        {
        }

        public virtual string ToString()
        {
            return GetType().ToString();
        }

        public virtual int GetHashCode()
        {
            return RuntimeHelpers.NativeGetHashCode(this);
        }

        public virtual bool Equals(object o)
        {
            return this == o;
        }

        public Type GetType()
        {
            return ReflectionHelpers.GetType(this);
        }

        /// <summary>
        /// This method is only here to support assemblies compiled against mscorlib.
        /// </summary>
        internal virtual void Finalize()
        {
        }
    }

    /// <summary>
    /// Represents a native JavaScript object.
    /// 
    /// Derive from this class if you want expando capability.
    /// </summary>
    [CLSCompliant(false)]
    [Intrinsic("Object", UseGlobalNamespace = true, SetVTable = true)]
    [CLRConjugate("XaeiOS.System.NativeObject")]
    public unsafe class NativeObject
    {

        public extern var this[var propertyName]
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}]")]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}] = {1}")]
            set;
        }
        public extern var this[NativeNumber propertyName]
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}]")]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}] = {1}")]
            set;
        }
        public extern var this[string propertyName]
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}]")]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}] = {1}")]
            set;
        }

        [Dummy]
        public extern NativeObject();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public string[] GetKeys()
        {
            return RuntimeHelpers.GetKeys(this);
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0} in {this}")]
        public extern bool ContainsKey(String key);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0} in {this}")]
        public extern bool ContainsKey(NativeNumber key);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "delete {this}[{0}]")]
        public extern void RemoveKey(String key);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "delete {this}[{0}]")]
        public extern void RemoveKey(NativeNumber key);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "delete {this}[{0}]")]
        public extern void RemoveKey(var key);

        [Intrinsic("toString")]
        private extern string NativeToString();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public override string ToString()
        {
            return this.NativeToString();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public override int GetHashCode()
        {
            return RuntimeHelpers.NativeGetHashCode(this);
        }
    }
}
