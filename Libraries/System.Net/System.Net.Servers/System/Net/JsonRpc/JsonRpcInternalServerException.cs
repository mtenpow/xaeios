using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    [JsonRpcReportableException(500, "InternalError")]
    public class JsonRpcInternalServerException : Exception
    {
        public JsonRpcInternalServerException(Exception internalException) : base("An internal server error occurred: " + internalException.ToString())
        {
            // TODO: If debugging is turned off, don't append internal exception to message
        }
    }
}
