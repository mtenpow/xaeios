using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    public class JsonRpcException : Exception
    {
        public JsonRpcClient Client
        {
            get;
            private set;
        }

        public string Method
        {
            get;
            private set;
        }

        public object[] Arguments
        {
            get;
            private set;
        }

        public JsonRpcException(JsonRpcClient client, string method, object[] args, string message) : base(message)
        {
            Client = client;
            Method = method;
            Arguments = args;
        }
    }
}
