using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class Type
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

        private int _baseType;
        public int BaseType
        {
            get { return _baseType; }
            set { _baseType = value; }
        }

        private int _declaringType;

        public int DeclaringType
        {
            get { return _declaringType; }
            set { _declaringType = value; }
        }

        private bool _isInterface;

        public bool IsInterface
        {
            get { return _isInterface; }
            set { _isInterface = value; }
        }

        private bool _isAbstract;

        public bool IsAbstract
        {
            get { return _isAbstract; }
            set { _isAbstract = value; }
        }
        
        private Methods _methods;

        public Methods Methods
        {
            get { return _methods; }
            set { _methods = value; }
        }

        private Fields _fields;

        public Fields Fields
        {
            get { return _fields; }
            set { _fields = value; }
        }
        private StaticFields _staticFields;

        public StaticFields StaticFields
        {
            get { return _staticFields; }
            set { _staticFields = value; }
        }

        private int _vtableIndex;

        public int VTableIndex
        {
            get { return _vtableIndex; }
            set { _vtableIndex = value; }
        }

        public Type(string ns, string name)
        {
            _namespace = ns;
            _name = name;
        }

        public Type()
        {
        }
    }
}
