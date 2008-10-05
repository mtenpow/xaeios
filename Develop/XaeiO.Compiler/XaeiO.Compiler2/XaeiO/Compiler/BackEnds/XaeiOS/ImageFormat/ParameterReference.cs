using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class ParameterReference
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

        private int _sequence;

        public int Sequence
        {
            get { return _sequence; }
            set { _sequence = value; }
        }

        public ParameterReference(int type, string name, int sequence)
        {
            _type = type;
            _name = name;
            _sequence = sequence;
        }

        public ParameterReference()
        {
        }
    }
}
