using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class TypeReference
    {
        private string _namespace;

        public string Namespace
        {
            get { return _namespace; }
            set { _namespace = value; }
        }
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private int _declaringType;

        public int DeclaringType
        {
            get { return _declaringType; }
            set { _declaringType = value; }
        }

        private int _assembly;

        public int Assembly
        {
            get { return _assembly; }
            set { _assembly = value; }
        }

        private bool _isGeneric;

        public bool IsGeneric
        {
            get { return _isGeneric; }
            set { _isGeneric = value; }
        }

        public TypeReference(string ns, string name, int assembly, bool isGeneric)
        {
            _namespace = ns;
            _name = name;
            _assembly = assembly;
            _isGeneric = isGeneric;
        }

        public TypeReference()
        {
        }
    }
}
