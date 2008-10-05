using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Principal;
using System.IO;
using System.Reflection;

using Newtonsoft.Json;

namespace System.Net.JsonRpc
{
    internal class JsonRpcRequestHandler
    {
        private JsonRpcServer _jsonRpcServer;
        private HttpListenerContext _context;
        private StreamWriter _streamWriter;

        public IPrincipal User
        {
            get
            {
                return _context.User;
            }
        }

        public string Path
        {
            get
            {
                return _context.Request.Url.AbsolutePath;
            }
        }

        public JsonRpcRequestHandler(JsonRpcServer jsonRpcServer, HttpListenerContext context)
        {
            _jsonRpcServer = jsonRpcServer;
            _context = context;
            _streamWriter = new StreamWriter(_context.Response.OutputStream);
        }

        public const string RpcGenericParameterRequestHeaderKeyPrefix = "RpcGenericParameter-";
        public const string RpcMethodRequestHeaderKey = "Rpc-Method";

        public void HandleRequest()
        {
            try
            {
                Console.WriteLine("Handling JsonRpc request");
                object[] rpcArgs;
                JsonRpcMethodInfo rpcMethodInfo;
                using (StreamReader streamReader = new StreamReader(_context.Request.InputStream))
                {
                    try
                    {
                        // TODO: authenticate user
                        Console.WriteLine("Authenticating user...");

                        string rpcMethod;
                        if (!TryGetRequestHeader(RpcMethodRequestHeaderKey, out rpcMethod))
                        {
                            Console.WriteLine("Malformed request");
                            // TODO: throw new NoRpcMethodSpecifiedError()
                            return;
                        }

                        rpcMethodInfo = _jsonRpcServer.GetRpcMethod(Path, rpcMethod);
                        if (rpcMethodInfo == null)
                        {
                            Console.WriteLine("Method does not exist: {0} at path: {1}", rpcMethod, Path);
                            // TODO: return error message (method does not exist)
                            return;
                        }
                        Console.WriteLine("Retrieved rpc method info ...");

                        string body = null;
                        string contentLengthString;
                        if (TryGetRequestHeader("Content-Length", out contentLengthString))
                        {
                            int contentLength;
                            if (!Int32.TryParse(contentLengthString, out contentLength))
                            {
                                // TODO: error
                                Console.WriteLine("Invalid content-length");
                                return;
                            }

                            Console.WriteLine("Content length is: {0}", contentLength);

                            char[] buffer = new char[contentLength]; // TODO: check that content length is not obscenely large
                            if (streamReader.Read(buffer, 0, contentLength) != contentLength)
                            {
                                // TODO: error
                                Console.WriteLine("Reached end of stream unexpectedly");
                                return;
                            }
                            // TODO: check for variable text encoding or at least have a convention
                            body = new String(buffer);
                            Console.WriteLine("Body is: {0}", body);
                            try
                            {
                                rpcArgs = ((JavaScriptArray)JavaScriptConvert.DeserializeObject(body)).ToArray();
                                ParameterInfo[] parameters = rpcMethodInfo.Method.GetParameters();
                                if (rpcArgs.Length != parameters.Length)
                                {
                                    // TODO: invalid number of rpc args
                                    Console.WriteLine("Invalid number of rpc args for method {0}.  Expected {1} but got {2}.  Body was {3}", rpcMethodInfo.Method, parameters.Length, rpcArgs.Length, body);
                                    return;
                                }

                                // deserialize into proper types
                                for (int i = 0; i < parameters.Length; i++)
                                {
                                    Type parameterMarshalType;
                                    string genericParameterName = rpcMethodInfo.ParameterMarshalInfos[i].GenericParameterName;
                                    if (genericParameterName != null)
                                    {
                                        string genericParameterTypeString;
                                        if (!TryGetRequestHeader(RpcGenericParameterRequestHeaderKeyPrefix + genericParameterName, out genericParameterTypeString))
                                        {
                                            throw new Exception("Expected generic parameter " + genericParameterName + ".");
                                        }
                                        else
                                        {
                                            parameterMarshalType = Type.GetType(genericParameterTypeString, true, true);
                                        }
                                    }
                                    else
                                    {
                                        parameterMarshalType = rpcMethodInfo.ParameterMarshalInfos[i].MarshalType;
                                    }
                                    //Console.WriteLine("Argument {0} is {1} :: {2} - marshalling as type {3}", i, rpcArgs[i], JsonUtils.JsonSerialize(rpcArgs[i]), parameterMarshalType);
                                    rpcArgs[i] = JavaScriptConvert.DeserializeObject(JsonUtils.JsonSerialize(rpcArgs[i]), parameterMarshalType);
                                }
                            }
                            catch (Exception e)
                            {
                                // TODO: error for invalid rpc args
                                Console.WriteLine("Invalid JSON rpc args: {0}", e);
                                return;
                            }
                        }
                        else
                        {
                            rpcArgs = new object[0];
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("An exception occurred while handling the request: {0}", e);
                        int statusCode;
                        string errorCode;
                        Exception reportableException = GetReportableException(e, out statusCode, out errorCode);
                        SetResponseStatusCode(statusCode);
                        string serializedException = JsonUtils.JsonSerializeException(reportableException, errorCode);
                        SetContentLength(serializedException.Length);
                        _streamWriter.Write(serializedException);
                        _streamWriter.Flush();
                        return;
                    }


                    object returnValue;

                    try
                    {
                        StringBuilder formattedRpcArgs = new StringBuilder();
                        if (rpcArgs.Length > 0)
                        {
                            for (int i = 0; i < rpcArgs.Length - 1; i++)
                            {
                                formattedRpcArgs.Append(rpcArgs[i].ToString());
                                formattedRpcArgs.Append(",");
                            }
                            formattedRpcArgs.Append(rpcArgs[rpcArgs.Length - 1].ToString());
                        }
                        Console.WriteLine("Invoking rpc method: {0} - ({1})", rpcMethodInfo.Method, formattedRpcArgs);

                        //lock(rpcMethodInfo.Target){
                        returnValue = rpcMethodInfo.Method.Invoke(rpcMethodInfo.Target, rpcArgs);
                        //}
                    }
                    catch (TargetInvocationException tie)
                    {
                        Console.WriteLine("There was an error during method invocation: {0}", tie.InnerException);
                        int statusCode;
                        string errorCode;
                        Exception reportableException = GetReportableException(tie.InnerException, out statusCode, out errorCode);
                        SetResponseStatusCode(statusCode);
                        string serializedException = JsonUtils.JsonSerializeException(reportableException, errorCode);
                        SetContentLength(serializedException.Length);
                        _streamWriter.Write(serializedException);
                        _streamWriter.Flush();
                        return;
                    }

                    try
                    {
                        Console.WriteLine("Method {0} successfully invoked", rpcMethodInfo.Method);
                        if (rpcMethodInfo.Method.ReturnType != null && !rpcMethodInfo.Method.ReturnType.IsAssignableFrom(typeof(void)))
                        {
                            Console.WriteLine("Marshalling return value");
                            Type returnMarshalType;
                            string genericParameterName = rpcMethodInfo.ReturnMarshalInfo.GenericParameterName;
                            if (genericParameterName != null)
                            {
                                string genericParameterTypeString;
                                if (!TryGetRequestHeader(RpcGenericParameterRequestHeaderKeyPrefix + genericParameterName, out genericParameterTypeString))
                                {
                                    throw new Exception("Expected generic parameter " + genericParameterName + ".");
                                }
                                else
                                {
                                    returnMarshalType = Type.GetType(genericParameterTypeString, true, true);
                                }
                            }
                            else
                            {
                                returnMarshalType = rpcMethodInfo.ReturnMarshalInfo.MarshalType;
                            }
                            Console.WriteLine("Return value is: {0} of type {1}", returnValue, returnMarshalType);
                            string serializedRet = JsonUtils.JsonSerialize(returnValue, returnMarshalType);
                            //Console.WriteLine("Serialized value is: {0}", serializedRet);
                            SetContentLength(serializedRet.Length);
                            _streamWriter.Write(serializedRet);
                            Console.WriteLine("Returning: {0}", serializedRet);
                        }
                        else
                        {
                            //Console.WriteLine("Method had void return type");
                            SetContentLength(_streamWriter.Encoding.GetByteCount(" "));
                            _streamWriter.Write(" ");
                        }
                        _streamWriter.Flush();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("There was an error during serialization: {0}", e);
                        int statusCode;
                        string errorCode;
                        Exception reportableException = GetReportableException(e, out statusCode, out errorCode);
                        SetResponseStatusCode(statusCode);
                        string serializedException = JsonUtils.JsonSerializeException(reportableException, errorCode);
                        SetContentLength(serializedException.Length);
                        _streamWriter.Write(serializedException);
                        _streamWriter.Flush();
                    }
                }
            }
            finally
            {
                _context.Response.Close();
                Console.WriteLine("JsonRpc request handled\n\n");
            }
        }

        private static Exception GetReportableException(Exception thrownException, out int statusCode, out string errorCode)
        {
            object[] customAttributes = thrownException.GetType().GetCustomAttributes(typeof(JsonRpcReportableExceptionAttribute), true);
            if (customAttributes.Length == 0)
            {
                thrownException = new JsonRpcInternalServerException(thrownException);
                customAttributes = typeof(JsonRpcInternalServerException).GetCustomAttributes(typeof(JsonRpcReportableExceptionAttribute), true);
            }
                
            JsonRpcReportableExceptionAttribute attribute = (JsonRpcReportableExceptionAttribute)customAttributes[0];
            statusCode = attribute.StatusCode;
            errorCode = attribute.ErrorCode;
            return thrownException;
        }

        public void Flush()
        {
            _streamWriter.Flush();
        }

        public void Write(string s)
        {
            _streamWriter.Write(s);
        }

        public void SetContentLength(long length)
        {
            _context.Response.ContentLength64 = length;
        }

        public void SetResponseStatusCode(int statusCode)
        {
            _context.Response.StatusCode = statusCode;
        }

        public void WriteHeader(string name, string value)
        {
            _context.Response.AddHeader(name, value);
        }

        public bool TryGetRequestHeader(string key, out string value)
        {
            value = GetRequestHeader(key);
            return value != null;
        }

        public string GetRequestHeader(string key)
        {
            return _context.Request.Headers.Get(key);
        }
    }
}