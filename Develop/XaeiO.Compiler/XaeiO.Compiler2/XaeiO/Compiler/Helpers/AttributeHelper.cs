using System.Collections.Generic;
using System.Diagnostics;

using XaeiO.Compiler.CodeModel;

using Mono.Cecil;

namespace XaeiO.Compiler.Helpers
{
    public static class AttributeHelper
    {
        public static bool HasCustomAttribute(ICustomAttributeProvider customAttributeProvider, string ns, string name)
        {
            foreach (CustomAttribute customAttribute in customAttributeProvider.CustomAttributes)
            {
                if (customAttribute.Constructor.DeclaringType.Namespace == ns && customAttribute.Constructor.DeclaringType.Name == name)
                {
                    return true;
                }
            }
            return false;
        }
        public static CustomAttribute[] GetCustomAttributes(ICustomAttributeProvider customAttributeProvider, string ns, string name, bool getAllCustomAttributes)
        {
            List<CustomAttribute> customAttributes = new List<CustomAttribute>();
            foreach (CustomAttribute customAttribute in customAttributeProvider.CustomAttributes)
            {
                if (customAttribute.Constructor.DeclaringType.Namespace == ns && customAttribute.Constructor.DeclaringType.Name == name)
                {
                    ((CustomAttribute)customAttribute).Resolve();
                    customAttributes.Add(customAttribute);
                    if (!getAllCustomAttributes)
                    {
                        break;
                    }
                }
            }
            return customAttributes.ToArray();
        }
        public static CustomAttribute GetCustomAttribute(ICustomAttributeProvider customAttributeProvider, string ns, string name)
        {
            CustomAttribute[] customAttributes = GetCustomAttributes(customAttributeProvider, ns, name, false);
            if (customAttributes.Length > 0)
            {
                return customAttributes[0];
            }
            else
            {
                return null;
            }
        }
        public static bool TryGetCustomAttribute(ICustomAttributeProvider customAttributeProvider, string ns, string name, out CustomAttribute customAttribute)
        {
            customAttribute = GetCustomAttribute(customAttributeProvider, ns, name);
            return customAttribute != null;
        }

        public static Stack<KeyValuePair<ICustomAttributeContext, CustomAttribute[]>> GetCustomAttributesFromContext(ICustomAttributeContext context, string ns, string name, IAssemblyResolver resolver)
        {
            Stack<KeyValuePair<ICustomAttributeContext, CustomAttribute[]>> stack = new Stack<KeyValuePair<ICustomAttributeContext, CustomAttribute[]>>();
            FillCustomAttributesFromContext(context, ns, name, stack, resolver);
            return stack;
        }

        private static void FillCustomAttributesFromContext(ICustomAttributeContext context, string ns, string name, Stack<KeyValuePair<ICustomAttributeContext, CustomAttribute[]>> stack, IAssemblyResolver resolver)
        {
            CustomAttribute[] attributes = GetCustomAttributes(context, ns, name, true);
            if (attributes.Length != 0)
            {
                stack.Push(new KeyValuePair<ICustomAttributeContext, CustomAttribute[]>(context, attributes));
            }

            ParameterDefinition parameterDefinition = context as ParameterDefinition;
            if (parameterDefinition != null)
            {
                FillCustomAttributesFromContext(ReferenceResolver.ResolveMethodReference(parameterDefinition.Method, resolver), ns, name, stack, resolver);
                return;
            }

            MethodDefinition methodDefinition = context as MethodDefinition;
            if (methodDefinition != null)
            {
                FillCustomAttributesFromContext(ReferenceResolver.ResolveTypeReference(methodDefinition.DeclaringType, resolver), ns, name, stack, resolver);
                return;
            }

            TypeDefinition typeDefinition = context as TypeDefinition;
            if (typeDefinition != null)
            {
                FillCustomAttributesFromContext(typeDefinition.Module, ns, name, stack, resolver);
                return;
            }

            ModuleDefinition moduleDefinition = context as ModuleDefinition;
            if (moduleDefinition != null)
            {
                FillCustomAttributesFromContext(moduleDefinition.Assembly, ns, name, stack, resolver);
                return;
            }

            Debug.Assert(context is AssemblyDefinition);
        }

        public static object GetLeadingConstructorArgument(CustomAttribute customAttribute)
        {
            if (customAttribute.ConstructorParameters.Count < 1)
            {
                throw new CompilerException("Expected custom attribute to have at least 1 constructor parameter: " + customAttribute);
            }

            return customAttribute.ConstructorParameters[0];
        }

        public static string GetLeadingConstructorArgumentAsString(CustomAttribute customAttribute)
        {

            object leadingArgument = GetLeadingConstructorArgument(customAttribute);

            if (!(leadingArgument is string))
            {
                throw new CompilerException("Exepected leading parameter of custom attribute to be of type System.String: " + customAttribute);
            }

            return (string)leadingArgument;
        }

        public static IExpression GetNamedConstructorArgument(CustomAttribute customAttribute, string namedArgumentName)
        {
            foreach (object argument in customAttribute.ConstructorParameters)
            {
                INamedArgumentExpression namedArgumentExpression = argument as INamedArgumentExpression;
                if (namedArgumentExpression != null &&
                    namedArgumentExpression.Member.Name == namedArgumentName)
                {
                    if (!ReferenceComparer.TypeReferenceEquals(namedArgumentExpression.Type, CoreTypes.String))
                    {
                        throw new CompilerException("Expected " + namedArgumentName + " named argument of custom attribute to be of type System.String: " + customAttribute);
                    }

                    return namedArgumentExpression.Value;
                }
            }
            throw new CompilerException("Couldn't retrieve named argument " + namedArgumentName + " from custom attribute: " + customAttribute);
        }

        public static string GetNamedConstructorArgumentAsString(CustomAttribute customAttribute, string namedArgumentName)
        {
            IExpression expression = GetNamedConstructorArgument(customAttribute, namedArgumentName);

            StringLiteralExpression stringLiteralExpression = expression as StringLiteralExpression;
            if (stringLiteralExpression == null)
            {
                throw new CompilerException("Expected " + namedArgumentName + " named argument of custom attribute to be a literal expression of type System.String: " + customAttribute);
            }

            return (string)stringLiteralExpression.Value;
        }
    }
}
