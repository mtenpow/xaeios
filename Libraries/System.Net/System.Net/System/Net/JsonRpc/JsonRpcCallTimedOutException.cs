using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    public class JsonRpcCallTimedOutException : JsonRpcException
    {
        public JsonRpcCallTimedOutException(JsonRpcClient client, string method, object[] args, int timeout)
            : base(client, method, args, "The request timed out after " + timeout + " milliseconds.")
        {
        }
    }
}
