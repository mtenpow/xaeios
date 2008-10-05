using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class StaticField
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

        private int _dataIndex;

        public int DataIndex
        {
            get { return _dataIndex; }
            set { _dataIndex = value; }
        }

        public StaticField(string name)
        {
            _name = name;
        }

        public StaticField()
        {
        }
    }
}
