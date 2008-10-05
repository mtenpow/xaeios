using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading;

namespace System.Net.JsonRpc
{
    public class JsonRpcServer
    {
        private HttpListener _httpListener;
        private bool _running = false;
        private Dictionary<string, Dictionary<string, JsonRpcMethodInfo>> _registeredMethods;

        private bool _secure = false;
        public bool Secure
        {
            set
            {
                _secure = value;
            }

            get
            {
                return _secure;
            }
        }

        private int _port;
        public int Port
        {
            get
            {
                return _port;
            }
        }

        public JsonRpcServer()
        {
            _registeredMethods = new Dictionary<string, Dictionary<string, JsonRpcMethodInfo>>();
        }

        public void StopListening()
        {
            if (!_running)
            {
                throw new InvalidOperationException("Cannot stop listening.  Not yet listening");
            }
            _running = false;
            _httpListener.Stop();
        }

        public void Listen(int port)
        {
            _httpListener = new HttpListener();
            _httpListener.Start();
            _port = port;
            string hostname = "*";
            string prefix = String.Format("http{0}://{1}:{2}", (_secure ? "s" : ""), hostname, port);
            foreach (string requestPath in _registeredMethods.Keys)
            {
                Console.WriteLine("JsonRpc server handling prefix: {0}", prefix + requestPath);
                _httpListener.Prefixes.Add(prefix + requestPath);
            }
            _httpListener.Start();
            _running = true;
            while (_running)
            {
                IAsyncResult result = _httpListener.BeginGetContext(ListenAsyncCallback, null);
                result.AsyncWaitHandle.WaitOne();
            }
            _httpListener.Stop();
        }

        private void ListenAsyncCallback(IAsyncResult result)
        {
            if (!_running)
            {
                // TODO: Log that request was denied because server was shutdown
                return;
            }
            HttpListenerContext context = _httpListener.EndGetContext(result);
            //context.Response.KeepAlive = true;
            JsonRpcRequestHandler requestHandler = new JsonRpcRequestHandler(this, context);
            requestHandler.HandleRequest();
        }

        internal JsonRpcMethodInfo GetRpcMethod(string path, string methodName)
        {
            Dictionary<string, JsonRpcMethodInfo> methodsAtPath;
            if (!_registeredMethods.TryGetValue(path, out methodsAtPath))
            {
                return null;
            }
            JsonRpcMethodInfo methodInfo;
            if (!methodsAtPath.TryGetValue(methodName, out methodInfo))
            {
                return null;
            }
            return methodInfo;
        }

        public void RegisterMethods(object target, string path)
        {
            RegisterMethods(target, target.GetType(), BindingFlags.Instance | BindingFlags.Public | BindingFlags.DeclaredOnly, path);
        }

        public void RegisterMethods(Type t, string path)
        {
            RegisterMethods(null, t, BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly, path);
        }

        private void RegisterMethods(object target, Type type, BindingFlags bindingFlags, string requestPath)
        {
            Dictionary<string, JsonRpcMethodInfo> rpcMethods;
            if (_running)
            {
                throw new Exception("Cannot add request paths while server is running.");
            }
            if (!requestPath.StartsWith("/"))
            {
                requestPath = "/" + requestPath;
            }
            if (!requestPath.EndsWith("/"))
            {

                requestPath += "/";
            }
            if (!_registeredMethods.TryGetValue(requestPath, out rpcMethods))
            {
                rpcMethods = new Dictionary<string, JsonRpcMethodInfo>();
                _registeredMethods.Add(requestPath, rpcMethods);
            }
            foreach (MethodInfo methodInfo in type.GetMethods(bindingFlags))
            {
                object[] customAttributes = methodInfo.GetCustomAttributes(false);
                foreach (object customAttribute in customAttributes)
                {
                    if (customAttribute.GetType().IsAssignableFrom(typeof(JsonRpcMethodAttribute)))
                    {
                        //JsonRpcMethodAttribute rpcMethodAttribute = (JsonRpcMethodAttribute)customAttribute;
                        string customRpcMethodName = methodInfo.Name;
                        if (rpcMethods.ContainsKey(customRpcMethodName))
                        {
                            throw new Exception("Method with the same name is already registered at that path");
                        }
                        Console.WriteLine("Registering rpc method: {0}::{1}", type, methodInfo);
                        JsonRpcMethodInfo rpcMethodInfo = new JsonRpcMethodInfo(target, methodInfo);
                        rpcMethods.Add(customRpcMethodName, rpcMethodInfo);
                        foreach (ParameterInfo parameterInfo in methodInfo.GetParameters())
                        {
                            // JsonRpcMarshalAttribute?
                            object[] parameterAttributes = parameterInfo.GetCustomAttributes(typeof(JsonRpcMarshalAttribute), false);
                            JsonRpcMarshalInfo parameterMarshalInfo = new JsonRpcMarshalInfo();
                            if (parameterAttributes.Length == 1)
                            {
                                JsonRpcMarshalAttribute jsonRpcMarshalAttribute = (JsonRpcMarshalAttribute)parameterAttributes[0];
                                if (jsonRpcMarshalAttribute.GenericParameterName != null)
                                {
                                    parameterMarshalInfo.GenericParameterName = jsonRpcMarshalAttribute.GenericParameterName;
                                }
                                else
                                {
                                    parameterMarshalInfo.MarshalType = jsonRpcMarshalAttribute.MarshalType;
                                }
                            }
                            else
                            {
                                parameterMarshalInfo.MarshalType = parameterInfo.ParameterType;
                            }
                            rpcMethodInfo.ParameterMarshalInfos.Add(parameterMarshalInfo);
                        }

                        // JsonRpcMarshalAttribute?
                        object[] returnTypeAttributes = methodInfo.ReturnTypeCustomAttributes.GetCustomAttributes(typeof(JsonRpcMarshalAttribute), false);
                        JsonRpcMarshalInfo returnMarshalInfo = new JsonRpcMarshalInfo();
                        if (returnTypeAttributes.Length == 1)
                        {
                            JsonRpcMarshalAttribute jsonRpcMarshalAttribute = (JsonRpcMarshalAttribute)returnTypeAttributes[0];
                            if (jsonRpcMarshalAttribute.GenericParameterName != null)
                            {
                                returnMarshalInfo.GenericParameterName = jsonRpcMarshalAttribute.GenericParameterName;
                            }
                            else
                            {
                                returnMarshalInfo.MarshalType = jsonRpcMarshalAttribute.MarshalType;
                            }
                        }
                        else
                        {
                            returnMarshalInfo.MarshalType = methodInfo.ReturnType;
                        }
                        rpcMethodInfo.ReturnMarshalInfo = returnMarshalInfo;
                        break;
                    }
                }
            }
        }
    }
}