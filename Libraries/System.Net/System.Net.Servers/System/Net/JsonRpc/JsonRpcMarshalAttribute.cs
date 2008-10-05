using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    [AttributeUsage(AttributeTargets.ReturnValue | AttributeTargets.Parameter)]
    public class JsonRpcMarshalAttribute : Attribute
    {
        private string _genericParameterName;

        public string GenericParameterName
        {
            get
            {
                return _genericParameterName;
            }
        }

        private Type _marshalType;

        public Type MarshalType
        {
            get
            {
                return _marshalType;
            }
        }

        public JsonRpcMarshalAttribute(string genericParameterName)
        {
            _genericParameterName = genericParameterName;
        }

        public JsonRpcMarshalAttribute(Type marshalType)
        {
            _marshalType = marshalType;
        }
    }
}
