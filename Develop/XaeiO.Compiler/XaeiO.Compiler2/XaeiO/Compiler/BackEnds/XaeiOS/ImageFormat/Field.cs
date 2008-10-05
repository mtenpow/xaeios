using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class Field
    {
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private int _type;

        public int Type
        {
            get { return _type; }
            set { _type = value; }
        }

        private int _offset;

        public int Offset
        {
            get { return _offset; }
            set { _offset = value; }
        }

        public Field(string name)
        {
            _name = name;
        }

        public Field()
        {
        }
    }
}
