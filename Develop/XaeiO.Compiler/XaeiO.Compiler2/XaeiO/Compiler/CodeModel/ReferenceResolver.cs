using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public static class ReferenceResolver
    {
        private static Dictionary<TypeDefinition, TypeDefinition> _arrayTypeCache = new Dictionary<TypeDefinition, TypeDefinition>();
        private static IAssemblyResolver _defaultAssemblyResolver = new DefaultAssemblyResolver();

        public static TypeDefinition ResolveTypeReference(TypeReference typeReference)
        {
            return ResolveTypeReference(typeReference, _defaultAssemblyResolver);
        }
        public static TypeDefinition ResolveTypeReference(TypeReference typeReference, IAssemblyResolver assemblyResolver)
        {
            return ResolveTypeReference(typeReference, assemblyResolver, true);
        }
        public static TypeDefinition ResolveTypeReference(TypeReference typeReference, IAssemblyResolver assemblyResolver, bool throwIfNotResolved)
        {
            TypeDefinition definition = typeReference as TypeDefinition;
            if (definition != null)
            {
                return definition;
            }

            ArrayType arrayType = typeReference as ArrayType;
            if (arrayType != null)
            {
                return ResolveTypeReference(arrayType, assemblyResolver, throwIfNotResolved);
            }

            // TODO: Use a weak reference cache here
            IMetadataScope metadataScope = typeReference.Scope;

            // check referenced assemblies
            AssemblyNameReference assemblyNameReference = metadataScope as AssemblyNameReference;
            if (assemblyNameReference != null)
            {
                AssemblyDefinition assemblyDefinition;
                // module could be null, so check scope
                if (typeReference.Module == null)
                {
                    assemblyDefinition = assemblyResolver.Resolve(assemblyNameReference);
                }
                else
                {
                    assemblyDefinition = typeReference.Module.Assembly.Resolver.Resolve(assemblyNameReference);
                }
                foreach (ModuleDefinition moduleDefinition in assemblyDefinition.Modules)
                {
                    TypeDefinition ret = findTypeDefinition(typeReference, moduleDefinition.Types);
                    if (ret != null)
                    {
                        return ret;
                    }
                }
            }

            ModuleDefinition moduleDefinition2 = metadataScope as ModuleDefinition;
            if (moduleDefinition2 != null)
            {
                TypeDefinition ret = findTypeDefinition(typeReference, moduleDefinition2.Types);
                if (ret != null)
                {
                    return ret;
                }
            }

            if (metadataScope == null)
            {
                // corlib?
                moduleDefinition2 = CoreTypes.Corlib.MainModule;
                TypeDefinition ret = findTypeDefinition(typeReference, moduleDefinition2.Types);
                if (ret != null)
                {
                    return ret;
                }
            }

            if (throwIfNotResolved)
            {
                throw new CompilerException("Unable to resolve type reference: " + typeReference);
            }
            else
            {
                return null;
            }
        }

        public static TypeDefinition ResolveTypeReference(ArrayType arrayType, IAssemblyResolver assemblyResolver, bool throwIfNotResolved)
        {
            throw new NotImplementedException();
            /* TODO: I'm not sure what to do here.  There's not such thing as a TypeDefinition of an array type
            // TODO: What about sized arrays?
            TypeDefinition elementTypeDefinition = ResolveTypeReference(arrayType.ElementType, assemblyResolver, throwIfNotResolved);
            if (elementTypeDefinition == null)
            {
                Debug.Assert(!throwIfNotResolved);
                return null;
            }*/

        }
        private static TypeDefinition findTypeDefinition(TypeReference typeReference, TypeDefinitionCollection typeDefinitionCollection)
        {
            // TODO: Check declaring type
            foreach (TypeDefinition typeDefinition in typeDefinitionCollection)
            {
                if (typeDefinition.Name == typeReference.Name && typeDefinition.Namespace == typeReference.Namespace)
                {
                    return typeDefinition;
                }
            }
            return null;
        }

        public static bool TryResolveTypeReference(TypeReference typeReference, IAssemblyResolver assemblyResolver, out TypeDefinition typeDefinition)
        {
            typeDefinition = ResolveTypeReference(typeReference, assemblyResolver, false);
            return typeDefinition != null;
        }

        public static MethodDefinition ResolveMethodReference(MethodReference methodReference)
        {
            return ResolveMethodReference(methodReference, _defaultAssemblyResolver);
        }
        public static MethodDefinition ResolveMethodReference(MethodReference methodReference, IAssemblyResolver assemblyResolver)
        {
            return ResolveMethodReference(methodReference, assemblyResolver, true);
        }
        public static MethodDefinition ResolveMethodReference(MethodReference methodReference, IAssemblyResolver assemblyResolver, bool throwIfNotResolved)
        {
            MethodDefinition definition = methodReference as MethodDefinition;
            if (definition != null)
            {
                return definition;
            }

            TypeDefinition typeDefinition = ResolveTypeReference(methodReference.DeclaringType, assemblyResolver);
            if (typeDefinition == null)
            {
                if (throwIfNotResolved)
                {
                    throw new CompilerException("Unable to resolve method reference: " + methodReference);
                }
                else
                {
                    return null;
                }
            }
            // search through each method
            if (methodReference.Name == MethodDefinition.Ctor || methodReference.Name == MethodDefinition.Cctor)
            {
                foreach (MethodDefinition methodDefinition in typeDefinition.Constructors)
                {
                    if (ReferenceComparer.MethodReferenceEquals(methodReference, methodDefinition))
                    {
                        return methodDefinition;
                    }
                }
            }
            else
            {
                foreach (MethodDefinition methodDefinition in typeDefinition.Methods)
                {
                    if (ReferenceComparer.MethodReferenceEquals(methodReference, methodDefinition))
                    {
                        return methodDefinition;
                    }
                }
            }

            // now search through properties
            foreach (PropertyDefinition propertyDefinition in typeDefinition.Properties)
            {
                if (propertyDefinition.GetMethod != null)
                {
                    if (ReferenceComparer.MethodReferenceEquals(methodReference, propertyDefinition.GetMethod))
                    {
                        return propertyDefinition.GetMethod;
                    }
                }
                if (propertyDefinition.SetMethod != null)
                {
                    if (ReferenceComparer.MethodReferenceEquals(methodReference, propertyDefinition.SetMethod))
                    {
                        return propertyDefinition.SetMethod;
                    }
                }
            }

            if (throwIfNotResolved)
            {
                throw new CompilerException("Unable to resolve method reference: " + methodReference);
            }
            else
            {
                return null;
            }
        }

        public static bool TryResolveMethodReference(MethodReference methodReference, IAssemblyResolver defaultResolver, out MethodDefinition methodDefinition)
        {
            methodDefinition = ResolveMethodReference(methodReference, defaultResolver, false);
            return methodDefinition != null;
        }

        public static FieldDefinition ResolveFieldReference(FieldReference fieldReference)
        {
            return ResolveFieldReference(fieldReference, _defaultAssemblyResolver, true);
        }
        public static FieldDefinition ResolveFieldReference(FieldReference fieldReference, IAssemblyResolver assemblyResolver)
        {
            return ResolveFieldReference(fieldReference, assemblyResolver, true);
        }
        public static FieldDefinition ResolveFieldReference(FieldReference fieldReference, IAssemblyResolver assemblyResolver, bool throwIfNotResolved)
        {
            FieldDefinition definition = fieldReference as FieldDefinition;
            if (definition != null)
            {
                return definition;
            }

            TypeDefinition typeDefinition = ResolveTypeReference(fieldReference.DeclaringType, assemblyResolver);
            if (typeDefinition == null)
            {
                if (throwIfNotResolved)
                {
                    throw new CompilerException("Unable to resolve field reference: " + fieldReference);
                }
                else
                {
                    return null;
                }
            }
            foreach (FieldDefinition fieldDefinition in typeDefinition.Fields)
            {
                if (fieldDefinition.Name == fieldReference.Name)
                {
                    return fieldDefinition;
                }
            }

            if (throwIfNotResolved)
            {
                throw new CompilerException("Unable to resolve field reference: " + fieldReference);
            }
            else
            {
                return null;
            }
        }
    }
}
