using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    public class JsonRpcCallException : JsonRpcException
    {
        public int StatusCode
        {
            get;
            private set;
        }

        public JsonRpcCallException(int statusCode, JsonRpcClient client, string method, object[] args, string message)
            : base(client, method, args, message)
        {
            StatusCode = statusCode;
        }
    }
}
