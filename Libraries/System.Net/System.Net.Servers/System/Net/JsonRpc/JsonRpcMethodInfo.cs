using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;


namespace System.Net.JsonRpc
{
    internal class JsonRpcMethodInfo
    {
        public object Target;
        public MethodInfo Method;
        public JsonRpcMarshalInfo ReturnMarshalInfo;
        public List<JsonRpcMarshalInfo> ParameterMarshalInfos = new List<JsonRpcMarshalInfo>();

        public JsonRpcMethodInfo(object target, MethodInfo method)
        {
            Target = target;
            Method = method;
        }
    }
}