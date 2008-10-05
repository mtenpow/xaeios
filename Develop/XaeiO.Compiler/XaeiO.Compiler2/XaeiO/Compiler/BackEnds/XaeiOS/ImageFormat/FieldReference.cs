using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class FieldReference
    {
        private int _type;
        public int Type
        {
            get { return _type; }
            set { _type = value; }
        }
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private bool _isStatic;

        public bool IsStatic
        {
            get { return _isStatic; }
            set { _isStatic = value; }
        }

        public FieldReference(int type, string name, bool isStatic)
        {
            _type = type;
            _name = name;
            _isStatic = isStatic;
        }

        public FieldReference()
        {
        }
    }
}
