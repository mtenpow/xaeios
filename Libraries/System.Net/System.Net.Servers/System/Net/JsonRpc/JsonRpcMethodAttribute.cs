using System;
using System.Collections.Generic;
using System.Text;

namespace System.Net.JsonRpc
{
    [AttributeUsage(AttributeTargets.Method)]
    public class JsonRpcMethodAttribute : Attribute
    {
    }
}