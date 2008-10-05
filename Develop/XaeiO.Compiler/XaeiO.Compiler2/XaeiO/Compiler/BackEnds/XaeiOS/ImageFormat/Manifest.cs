using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public sealed class Manifest
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

        private byte[] _hash;
        public byte[] Hash
        {
            get { return _hash; }
            set { _hash = value; }
        }

        public Manifest()
        {
        }
    }
}
