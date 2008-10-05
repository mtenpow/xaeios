using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class Method
    {
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private int _returnType;

        public int ReturnType
        {
            get { return _returnType; }
            set { _returnType = value; }
        }

        private int _vtableSlot;

        public int VTableSlot
        {
            get { return _vtableSlot; }
            set { _vtableSlot = value; }
        }

        private int _codeIndex;

        public int CodeIndex
        {
            get { return _codeIndex; }
            set { _codeIndex = value; }
        }

        private bool _hasThis;

        public bool HasThis
        {
            get { return _hasThis; }
            set { _hasThis = value; }
        }

        private Parameters _parameters;

        public Parameters Parameters
        {
            get { return _parameters; }
            set { _parameters = value; }
        }

        public Method(string name)
        {
            _name = name;
        }

        public Method()
        {
        }
    }
}
