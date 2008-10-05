using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public static class ReferenceComparer
    {

        public static bool MethodReferenceEquals(MethodReference a, MethodReference b)
        {
            if (a.Name == b.Name)
            {
                if (a.HasThis == b.HasThis)
                {
                    if (MethodReturnTypeEquals(a.ReturnType, b.ReturnType))
                    {
                        if (a.Parameters.Count == b.Parameters.Count)
                        {
                            for (int i = 0; i < a.Parameters.Count; i++)
                            {
                                if (!ParameterReferenceEquals(a.Parameters[i], b.Parameters[i]))
                                {
                                    return false;
                                }
                            }
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        public static bool MethodReturnTypeEquals(MethodReturnType a, MethodReturnType b)
        {
            return a.HasConstant == b.HasConstant && TypeReferenceEquals(a.ReturnType, b.ReturnType);
        }
        public static bool ParameterReferenceEquals(ParameterReference a, ParameterReference b)
        {
            // TODO: Should we check names?  Generic methods make up parameter names
            // TODO: Sequence? They seem to be off by one sometimes..
            return TypeReferenceEquals(a.ParameterType, b.ParameterType);
        }
        private static bool GenericParametersCanMatch(TypeReference a, TypeReference b)
        {
            GenericParameter genericParameterA = a as GenericParameter;
            if (genericParameterA != null)
            {
                GenericParameter genericParameterB = b as GenericParameter;
                if (genericParameterB != null)
                {
                    // TODO: check that parameters are the same.  how? need to check context (contexts can be nested?)
                    return CheckGenericConstraints(genericParameterA, genericParameterB);
                }

                GenericInstanceType genericInstanceTypeB = b as GenericInstanceType;
                if (genericInstanceTypeB != null)
                {
                    return CheckGenericConstraints(genericParameterA, genericInstanceTypeB);
                }

                return CheckGenericConstraints(genericParameterA, b);
            }
            return false;
        }
        private static bool CheckGenericConstraints(GenericParameter a, GenericParameter b)
        {
            // TODO: implement this properly
            return a.Position == b.Position;
        }
        private static bool CheckGenericConstraints(GenericParameter a, TypeReference b)
        {
            // TODO: check a.Attributes
            foreach (TypeReference typeReference in a.Constraints)
            {
                throw new NotImplementedException();
            }
            return true;
        }
        private static bool CheckGenericConstraints(GenericParameter a, GenericInstanceType b)
        {
            throw new NotImplementedException();
        }
        public static bool TypeReferenceEquals(TypeReference a, TypeReference b)
        {
            return TypeReferenceEquals(a, b, true);
        }
        public static bool TypeReferenceEquals(TypeReference a, TypeReference b, bool checkGenericParameters)
        {
            if (checkGenericParameters && (GenericParametersCanMatch(a, b) || GenericParametersCanMatch(b,a)))
            {
                return true;
            }

            // TODO: Don't just use fullname here, maybe resolve them both?
            if (a.FullName != b.FullName)
            {
                return false;
            }
            return true;
        }

        public static bool GenericParameterEquals(GenericParameter genericParameter, GenericParameter genericParameter2)
        {
            if (genericParameter.Position != genericParameter.Position)
            {
                return false;
            }
            if (!TypeReferenceEquals(genericParameter, genericParameter2, false))
            {
                return false;
            }
            return true; // TODO: Implement this properly
        }

        public static bool AssemblyNameReferenceEquals(AssemblyNameReference a, AssemblyNameReference b)
        {
            if (a.Name != b.Name)
            {
                return false;
            }

            // TODO: Compare Version

            if (a.Culture != b.Culture)
            {
                return false;
            }

            return true;
        }
    }
}
