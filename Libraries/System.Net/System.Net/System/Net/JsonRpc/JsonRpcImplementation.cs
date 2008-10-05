using System;

namespace System.Net.JsonRpc
{
    public class JsonRpcImplementationAttribute : Attribute
    {
        public Type ImplementationType
        {
            get;
            set;
        }
        public JsonRpcImplementationAttribute(Type implementationType)
        {
            ImplementationType = implementationType;
        }
    }
}