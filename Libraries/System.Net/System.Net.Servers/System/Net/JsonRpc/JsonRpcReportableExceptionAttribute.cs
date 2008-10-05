using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    public class JsonRpcReportableExceptionAttribute : Attribute
    {
        public string ErrorCode
        {
            get;
            private set;
        }

        public int StatusCode
        {
            get;
            private set;
        }

        public JsonRpcReportableExceptionAttribute(int statusCode, string errorCode)
        {
            StatusCode = statusCode;
            ErrorCode = errorCode;
        }
    }
}
