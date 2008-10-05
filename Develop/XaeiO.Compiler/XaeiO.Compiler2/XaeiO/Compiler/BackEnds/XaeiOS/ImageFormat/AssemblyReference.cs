using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class AssemblyReference
    {
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        private string _version;

        public string Version
        {
            get { return _version; }
            set { _version = value; }
        }

        public AssemblyReference(string name, string version)
        {
            _name = name;
            _version = version;
        }

        public AssemblyReference()
        {
        }
    }
}
