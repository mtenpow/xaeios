using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class NullType : TypeReference
    {
        #region TypeReference Members

        public string FullName
        {
            get { return ""; }
        }

        public bool IsValueType
        {
            get
            {
                return false;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        public ModuleDefinition Module
        {
            get { return null; }
        }

        public string Namespace
        {
            get
            {
                return "";
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        public IMetadataScope Scope
        {
            get { return null; }
        }

        #endregion

        #region IReflectionVisitable Members

        public void Accept(IReflectionVisitor visitor)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region IMemberReference Members

        public TypeReference DeclaringType
        {
            get { return null; }
        }

        public string Name
        {
            get
            {
                return "";
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        #endregion

        #region IMetadataTokenProvider Members

        public Mono.Cecil.Metadata.MetadataToken MetadataToken
        {
            get
            {
                return default(Mono.Cecil.Metadata.MetadataToken);
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        #region IGenericParameterProvider Members

        public GenericParameterCollection GenericParameters
        {
            get { return null; }
        }

        #endregion

        #region ICustomAttributeProvider Members

        public CustomAttributeCollection CustomAttributes
        {
            get { return null; }
        }

        #endregion

        private NullType() : base("","")
        {
        }

        public static NullType Instance
        {
            get
            {
                return _instance;
            }
        }

        private static NullType _instance = new NullType();
    }
}
