using System;

namespace XaeiOS.Runtime
{
    public class AppDomain
    {
        private string _name;
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private uint _runtimeId;
        public uint RuntimeId
        {
            get { return _runtimeId; }
            set { _runtimeId = value; }
        }

        public AppDomain(string name)
        {
            _name = name;
        }

        public NativeFunction GetMethodCode(MethodDefinition method)
        {
            throw new NotImplementedException();
        }
    }
}