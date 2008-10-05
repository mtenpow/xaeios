using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using System.Xml;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.Rules.Patterns;
using XaeiO.Compiler.Rules.Patterns.CodeGeneration;
using ImageFormat = XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

using Tenpow.Collections.Generic;

using Newtonsoft.Json;

using Reflection = System.Reflection;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public partial class XaeiOSBackEnd : CompilerTierBase, IBackEnd
    {

        #region OSCorlib types and methods

        private TypeDefinition OSCorlibVarType
        {
            get
            {
                if (_osCorlibVarType == null)
                {
                    _osCorlibVarType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("System.var"));
                }
                return _osCorlibVarType;
            }
        }
        private TypeDefinition _osCorlibVarType;

        private TypeDefinition OSCorlibNativeFunctionType
        {
            get
            {
                if (_osCorlibNativeFunctionType == null)
                {
                    _osCorlibNativeFunctionType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("System.NativeFunction"));
                }
                return _osCorlibNativeFunctionType;
            }
        }
        private TypeDefinition _osCorlibNativeFunctionType;

        private TypeDefinition OSCorlibRuntimeHelpersType
        {
            get
            {
                if (_osCorlibRuntimeHelpersType == null)
                {
                    _osCorlibRuntimeHelpersType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("System.Runtime.CompilerServices.RuntimeHelpers"));
                }
                return _osCorlibRuntimeHelpersType;
            }
        }
        private TypeDefinition _osCorlibRuntimeHelpersType;

        private MethodDefinition OSCorlibInstanceOfMethod
        {
            get
            {
                if (_osCorlibInstanceOfMethod == null)
                {
                    _osCorlibInstanceOfMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibVarType, "InstanceOf"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibInstanceOfMethod;
            }
        }
        private MethodDefinition _osCorlibInstanceOfMethod;

        private MethodDefinition OSCorlibBindNativeFunctionMethod
        {
            get
            {
                if (_osCorlibBindNativeFunctionMethod == null)
                {
                    _osCorlibBindNativeFunctionMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibNativeFunctionType, "Bind"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibBindNativeFunctionMethod;
            }
        }
        private MethodDefinition _osCorlibBindNativeFunctionMethod;

        private MethodDefinition OSCorlibCastMethod
        {
            get
            {
                if (_osCorlibCastMethod == null)
                {
                    _osCorlibCastMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "Cast"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCastMethod;
            }
        }
        private MethodDefinition _osCorlibCastMethod;

        private MethodDefinition OSCorlibTryCastMethod
        {
            get
            {
                if (_osCorlibCanCastMethod == null)
                {
                    _osCorlibCanCastMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "TryCast"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCanCastMethod;
            }
        }
        private MethodDefinition _osCorlibCanCastMethod;

        private MethodDefinition OSCorlibDelegateInvokeMethod
        {
            get
            {
                if (_osCorlibDelegateInvokeMethod == null)
                {
                    _osCorlibDelegateInvokeMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(ReferenceResolver.ResolveTypeReference(CoreTypes.Delegate), "Invoke"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibDelegateInvokeMethod;
            }
        }
        private MethodDefinition _osCorlibDelegateInvokeMethod;

        private MethodDefinition OSCorlibDelegateInvokeNativeMethod
        {
            get
            {
                if (_osCorlibDelegateInvokeNativeMethod == null)
                {
                    _osCorlibDelegateInvokeNativeMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(ReferenceResolver.ResolveTypeReference(CoreTypes.Delegate), "InvokeNative"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibDelegateInvokeNativeMethod;
            }
        }
        private MethodDefinition _osCorlibDelegateInvokeNativeMethod;

        private MethodDefinition OSCorlibDelegateCreateMethod
        {
            get
            {
                if (_osCorlibDelegateCreateMethod == null)
                {
                    _osCorlibDelegateCreateMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(ReferenceResolver.ResolveTypeReference(CoreTypes.Delegate), "InternalCreate"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibDelegateCreateMethod;
            }
        }
        private MethodDefinition _osCorlibDelegateCreateMethod;

        private FieldDefinition OSCorlibExceptionThrowContextField
        {
            get
            {
                if (_osCorlibExceptionThrowContextField == null)
                {
                    _osCorlibExceptionThrowContextField = ReferenceResolver.ResolveFieldReference(GetFieldByName(ReferenceResolver.ResolveTypeReference(CoreTypes.Exception), "_throwContext"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibExceptionThrowContextField;
            }
        }
        private FieldDefinition _osCorlibExceptionThrowContextField;

        private TypeDefinition OSCorlibClassType
        {
            get
            {
                if (_osCorlibClassType == null)
                {
                    _osCorlibClassType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("System.Runtime.CompilerServices.Class"));
                }
                return _osCorlibClassType;
            }
        }
        private TypeDefinition _osCorlibClassType;

        private MethodDefinition OSCorlibInitializeMetadataMethod
        {
            get
            {
                if (_osCorlibInitializeMetadataMethod == null)
                {
                    _osCorlibInitializeMetadataMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "InitializeMetadata"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibInitializeMetadataMethod;
            }
        }
        private MethodDefinition _osCorlibInitializeMetadataMethod;

        private MethodDefinition OSCorlibCreateAssemblyMethod
        {
            get
            {
                if (_osCorlibCreateAssemblyMethod == null)
                {
                    _osCorlibCreateAssemblyMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateAssembly"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateAssemblyMethod;
            }
        }
        private MethodDefinition _osCorlibCreateAssemblyMethod;

        private MethodDefinition OSCorlibCreateClassMethod
        {
            get
            {
                if (_osCorlibCreateClassMethod == null)
                {
                    _osCorlibCreateClassMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateClass"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateClassMethod;
            }
        }
        private MethodDefinition _osCorlibCreateClassMethod;

        private MethodDefinition OSCorlibCreateMethodMethod
        {
            get
            {
                if (_osCorlibCreateMethodMethod == null)
                {
                    _osCorlibCreateMethodMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateMethod"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateMethodMethod;
            }
        }
        private MethodDefinition _osCorlibCreateMethodMethod;

        private MethodDefinition OSCorlibCreateConstructorMethod
        {
            get
            {
                if (_osCorlibCreateConstructorMethod == null)
                {
                    _osCorlibCreateConstructorMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateConstructor"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateConstructorMethod;
            }
        }
        private MethodDefinition _osCorlibCreateConstructorMethod;

        private MethodDefinition OSCorlibCreatePropertyMethod
        {
            get
            {
                if (_osCorlibCreatePropertyMethod == null)
                {
                    _osCorlibCreatePropertyMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateProperty"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreatePropertyMethod;
            }
        }
        private MethodDefinition _osCorlibCreatePropertyMethod;

        private MethodDefinition OSCorlibCreateCustomAttributeMethod
        {
            get
            {
                if (_osCorlibCreateCustomAttributeMethod == null)
                {
                    _osCorlibCreateCustomAttributeMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateCustomAttribute"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateCustomAttributeMethod;
            }
        }
        private MethodDefinition _osCorlibCreateCustomAttributeMethod;

        private MethodDefinition OSCorlibCreateArrayMethod
        {
            get
            {
                if (_osCorlibCreateArrayMethod == null)
                {
                    _osCorlibCreateArrayMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibRuntimeHelpersType, "CreateArray"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibCreateArrayMethod;
            }
        }
        private MethodDefinition _osCorlibCreateArrayMethod;

        private TypeDefinition OSCorlibBootManagerType
        {
            get
            {
                if (_osCorlibBootManagerType == null)
                {
                    _osCorlibBootManagerType = ReferenceResolver.ResolveTypeReference(CoreTypes.GetCoreType("XaeiOS.Boot.BootManager"));
                }
                return _osCorlibBootManagerType;
            }
        }
        private TypeDefinition _osCorlibBootManagerType;

        private MethodDefinition OSCorlibBootManagerBootModuleEntryPoint
        {
            get
            {
                if (_osCorlibBootManagerBootModuleEntryPointMethod == null)
                {
                    _osCorlibBootManagerBootModuleEntryPointMethod = ReferenceResolver.ResolveMethodReference(GetMethodByName(OSCorlibBootManagerType, "BootModuleEntryPoint"), _assemblyCompileInfo.Assembly.Resolver);
                }
                return _osCorlibBootManagerBootModuleEntryPointMethod;
            }
        }
        private MethodDefinition _osCorlibBootManagerBootModuleEntryPointMethod;

        // TODO: Make this stuff more generic, maybe index these types and members by a string

        #endregion

        #region Kernel types and methods
        private TypeDefinition KernelSchedulerType
        {
            get
            {
                if (_kernelSchedulerType == null)
                {
                    _kernelSchedulerType = GetKernelType("XaeiOS.Kernel.Scheduler");
                }
                return _kernelSchedulerType;
            }
        }
        private TypeDefinition _kernelSchedulerType;

        private MethodDefinition KernelConvertToManagedExceptionMethod
        {
            get
            {
                if (_kernelConvertToManagedExceptionMethod == null)
                {
                    _kernelConvertToManagedExceptionMethod = GetMethodByName(KernelSchedulerType, "ConvertToManagedException");
                }
                return _kernelConvertToManagedExceptionMethod;
            }
        }
        private MethodDefinition _kernelConvertToManagedExceptionMethod;

        private TypeDefinition KernelSystemCallsType
        {
            get
            {
                if (_kernelSystemCallsType == null)
                {
                    _kernelSystemCallsType = GetKernelType("XaeiOS.SystemCalls");
                }
                return _kernelSystemCallsType;
            }
        }
        private TypeDefinition _kernelSystemCallsType;

        private MethodDefinition KernelYieldMethod
        {
            get
            {
                if (_kernelYieldMethod == null)
                {
                    _kernelYieldMethod = GetMethodByName(KernelSystemCallsType, "Yield");
                }
                return _kernelYieldMethod;
            }
        }
        private MethodDefinition _kernelYieldMethod;

        private TypeDefinition GetKernelType(string fullName)
        {
            return GetXaeiOSCompiler().KernelAssembly.MainModule.Types[fullName];
        }
        #endregion

    }
}
