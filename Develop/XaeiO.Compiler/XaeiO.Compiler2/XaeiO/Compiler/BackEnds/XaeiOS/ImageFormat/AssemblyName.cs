using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class AssemblyName
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
        private string _culture;

        public string Culture
        {
            get { return _culture; }
            set { _culture = value; }
        }
    }
}
