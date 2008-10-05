using System;
using System.Collections.Generic;
using System.Text;
using Mono.Cecil;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class Metadata
    {
        private AssemblyName _name;

        public AssemblyName Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private int _entryPoint;

        public int EntryPoint
        {
            get { return _entryPoint; }
            set { _entryPoint = value; }
        }

        public int BootMethod
        {
            get;
            set;
        }

        private Types _types;

        public Types Types
        {
            get { return _types; }
            set { _types = value; }
        }

        private AssemblyReferences _assemblyReferences;

        public AssemblyReferences AssemblyReferences
        {
            get
            {
                if (_assemblyReferences == null)
                {
                    _assemblyReferences = new AssemblyReferences();
                }
                return _assemblyReferences;
            }
            set { _assemblyReferences = value; }
        }

        private TypeReferences _typeReferences;

        public TypeReferences TypeReferences
        {
            get
            {
                if (_typeReferences == null)
                {
                    _typeReferences = new TypeReferences();
                }
                return _typeReferences;
            }
            set { _typeReferences = value; }
        }

        public MethodReferences MethodReferences
        {
            get;
            set;
        }

        private ParameterReferences _parameterReferences;

        public ParameterReferences ParameterReferences
        {
            get { return _parameterReferences; }
            set { _parameterReferences = value; }
        }

        private FieldReferences _fieldReferences;

        public FieldReferences FieldReferences
        {
            get { return _fieldReferences; }
            set { _fieldReferences = value; }
        }

        public StaticConstructors StaticConstructors
        {
            get;
            set;
        }
    }
}
