using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class MethodReference
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
        private List<int> _parameters;

        private bool _hasThis;

        public bool HasThis
        {
            get { return _hasThis; }
            set { _hasThis = value; }
        }

        public List<int> Parameters
        {
            get
            {
                if (_parameters == null)
                {
                    _parameters = new List<int>();
                }
                return _parameters;
            }
            set { _parameters = value; }
        }

        public MethodReference(int type, string name)
        {
            _type = type;
            _name = name;
        }

        public MethodReference()
        {
        }
    }
}
