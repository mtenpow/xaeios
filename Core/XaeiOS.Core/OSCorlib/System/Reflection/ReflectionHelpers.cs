using System.Runtime;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace System.Reflection
{
	internal static class ReflectionHelpers
    {
        // TODO: Iterate through list of assemblies to search for a type
        // TODO: Create System.Reflection.Cache namespace to contain reflection metadata
        // TODO: Synchronized access to these datastructures
        /// <summary>
        /// The list of loaded assemblies.
        /// This field is initialized by RuntimeHelpers::InitializeMetadata()
        /// </summary>
        internal static NativeArray<Assembly> _runtimeAssemblies;

        private static Dictionary<Class, RuntimeType> _runtimeTypeCache;

        public static void Initialize()
        {
            _runtimeTypeCache = new Dictionary<Class, RuntimeType>();
        }

        public static RuntimeType GetType(object obj)
        {
            XaeiOSObject xaeiOSObject = var.Cast<object>(obj).Cast<XaeiOSObject>();
            Class klass = xaeiOSObject.VTable.Class;

            return GetTypeFromClass(klass);
        }

        public static RuntimeType GetTypeFromHandle(RuntimeTypeHandle handle)
        {
            // handle is really a vtable
            VTable vtable = var.Cast<RuntimeTypeHandle>(handle).Cast<VTable>();

            return GetTypeFromClass(vtable.Class);
        }

        public static RuntimeType GetTypeByName(string fullName)
        {
            // TODO: Lock runtime assemblies
            for (int i = 0; i < _runtimeAssemblies.Length; i++)
            {
                Assembly assembly = _runtimeAssemblies[i];
                Class klass = GetClassFromAssembly(fullName, assembly);
                if (klass != null)
                {
                    return GetTypeFromClass(klass);
                }
            }
            return null;
        }

        private static Class GetClassFromAssembly(string fullName, Assembly assembly)
        {
            // TODO: Lock assembly
            for (int i = 0; i < assembly.Classes.Length; i++)
            {
                Class klass = assembly.Classes[i];
                if (klass.FullName == fullName)
                {
                    return klass;
                }
            }
            return null;
        }

        private static RuntimeType GetTypeFromClass(Class klass)
        {
            // check cache. if not there, create the runtime type and save to cache
            if (!_runtimeTypeCache.ContainsKey(klass))
            {
                RuntimeType declaringType;
                if (klass.DeclaringClass != null)
                {
                    declaringType = GetTypeFromClass(klass.DeclaringClass);
                }
                else
                {
                    declaringType = null;
                }
                RuntimeType runtimeType = new RuntimeType(klass, declaringType);
                _runtimeTypeCache[klass] = runtimeType;
            }

            return _runtimeTypeCache[klass];
        }
        // TODO: This method is not code generated correctly
        // root cause is likely the conditional expression
        // the arguments to RuntimeType::.ctor are reversed!
        private static RuntimeType BrokenGetTypeFromClass(Class klass)
        {
            // check cache. if not there, create the runtime type and save to cache
            if (!_runtimeTypeCache.ContainsKey(klass))
            {
                RuntimeType runtimeType = new RuntimeType(klass, klass.DeclaringClass != null ? GetTypeFromClass(klass.DeclaringClass) : null);
                _runtimeTypeCache[klass] = runtimeType;
            }

            return _runtimeTypeCache[klass];
        }

        // TODO: This method breaks XaeiO.Compiler2
        private static RuntimeType BrokenGetType(object obj)
        {
            XaeiOSObject xaeiOSObject = var.Cast<object>(obj).Cast<XaeiOSObject>();
            Class klass = xaeiOSObject.VTable.Class;
            
            // check cache
            if(_runtimeTypeCache.ContainsKey(klass))
            {
                return _runtimeTypeCache[klass];
            }

            RuntimeType runtimeType = new RuntimeType(klass, null);
            _runtimeTypeCache[klass] = runtimeType;

            return runtimeType;
        }

        // TODO: This is a temp hack for property getters and setters!!
        public static object TrampolineInvokeMethod(Method method, object self, object[] args)
        {
            if (method.Function != null)
            {
                TempHackGenerateCodeForTrampolineInvokeMethod(method.Function, self, args);
            }
            else
            {
                if (method.DeclaringClass.IsInterface)
                {
                    if(method.VTableSlot == -1)
                    {
                        // TODO: Throw MissingMethodException
                        throw new ExecutionEngineException("No vtable slot!");
                    }
                    TempHackGenerateCodeForTrampolineInvokeInterfaceMethod(self, method.DeclaringClass.VTableDataPointer, method.VTableSlot, args);
                }
                throw new NotImplementedException("Method invocation through reflection is not yet implemented.  Though, the temp property hack is in place!");
            }

            // we should never get here!
            throw new ExecutionEngineException("Trampoline for method " + method + " failed");
        }

        public static object TrampolineInvokeConstructor(Constructor constructor, object self, object[] args)
        {
            TempHackGenerateCodeForTrampolineInvokeMethod(constructor.Function, self, args);

            // we should never get here!
            throw new ExecutionEngineException("Trampoline for constructor " + constructor + " failed");
        }

        public static object CreateInstance(RuntimeType type)
        {
            return CreateInstance(((VTable)type.TypeHandle).Class);
        }

        private static object CreateInstance(Class klass)
        {
            // check for default constructor
            Constructor defaultConstructor = GetDefaultConstructor(klass);

            if (defaultConstructor == null)
            {
                // TODO: Throw MissingMethodException
                throw new ExecutionEngineException("No default constructor found in type " + klass);
            }

            return CreateInstance(defaultConstructor);
        }

        private static Constructor GetDefaultConstructor(Class klass)
        {
            NativeArray<Constructor> constructors = klass.Constructors;
            for (int i = 0; i < constructors.Length; i++)
            {
                Constructor constructor = constructors[i];
                if (constructor.Parameters.Length == 0)
                {
                    return constructor;
                }
            }

            return null;
        }

        // TODO: This method breaks XaeiO.Compiler2
        // NOTE: root cause is the implicit cast from NativeArray<Constructor> to Constructor[]
        /*private static Constructor BadGetDefaultConstructor(Class klass)
        {
            Constructor[] constructors = klass.Constructors;
            for (int i = 0; i < constructors.Length; i++)
            {
                Constructor constructor = constructors[i];
                if (constructor.Parameters.Length == 0)
                {
                    return constructor;
                }
            }

            return null;
        }*/

        private static object CreateInstance(Constructor constructor)
        {
            Logging.Debug("Creating object through reflection: " + constructor);
            XaeiOSObject obj = GenerateCodeForNewObject(constructor.DeclaringClass.VTable);
            // TODO: initialize fields
            TrampolineInvokeConstructor(constructor, obj, new object[0]);
            return obj;
        }

        public static bool IsDefined(ICustomAttributeProvider attributeProvider, Type attributeType, bool inherit)
        {
            if (inherit)
            {
                throw new NotImplementedException("Checking for inherited attributes is not yet implemented");
            }
            if (attributeType == null)
            {
                throw new ArgumentException("attributeType cannot be null");
            }
            VTable vtable = (VTable)attributeType.TypeHandle;
            Class attributeClass = vtable.Class;
            for (int i = 0; i < attributeProvider.CustomAttributes.Length; i++)
            {
                CustomAttribute customAttribute = attributeProvider.CustomAttributes[i];
                if (customAttribute.Constructor.DeclaringClass == attributeClass)
                {
                    return true;
                }
            }

            return false;
        }

        /// <summary>
        /// Invokes the specified method with the specified arguments.
        /// 
        /// This only works for pre-emptive methods.
        /// 
        /// The parent continuation object is set to the continuation object of the callee, thereby removing this method from the stack.
        /// 
        /// This is a trampoline
        /// 
        /// TODO: This is a temporary hack for property getters and setters, this should be compiler implemented
        /// </summary>
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "return {0}.call({1},0,$end,null,$pc,[null,null].concat({2}))")]
        private static extern object TempHackGenerateCodeForTrampolineInvokeMethod(NativeFunction nativeFunction, object self, object[] args);

        // TODO: Extract special register names  out into constants
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "return {0}.$.i[{1}][{2}].call({0},0,$end,null,$pco,[null,null].concat({3}))")]
        private static extern object TempHackGenerateCodeForTrampolineInvokeInterfaceMethod(object self, UIntPtr vtableDataPointer, int vtableSlot, object[] args);


        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{$:{0}}")]
        private static extern XaeiOSObject GenerateCodeForNewObject(VTable vtable);
    }
}
