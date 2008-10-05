using System;
using System.Text;
using System.Threading;
using System.Browser.XmlHttpRequest;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;

namespace System.Net.JsonRpc
{
    public class JsonRpcClient
    {
        public const string RpcMethodRequestHeader = "Rpc-Method";

        public string ServerUrl
        {
            get;
            private set;
        }

        public string Username
        {
            get;
            private set;
        }

        public string Password
        {
            get;
            private set;
        }

        public JsonRpcClient(string serverUrl)
            : this(serverUrl, null, null)
        {
        }

        public JsonRpcClient(string serverUrl, string username, string password)
        {
            ServerUrl = serverUrl;
            Username = username;
            Password = password;
        }

        public object Call(string method)
        {
            return Call(method, new object[0]);
        }

        public object Call(string method, object[] args)
        {
            return Call(method, args, -1);
        }

        public object Call(string method, object[] args, int timeout)
        {
            XmlHttpRequest xhr = XmlHttpRequestManager.GetXmlHttpRequest();
            Lock l = new Lock();
            l.Acquire();
            TimedCondition condition = new TimedCondition(l);
            OnReadyStateChangeHandler handler = new OnReadyStateChangeHandler(xhr, condition);
            xhr.OnReadyStateChange = (NativeFunction)new VoidDelegate(handler.OnReadyStateChange);
            xhr.Open("POST", ServerUrl, true, Username, Password);
            xhr.SetRequestHeader(RpcMethodRequestHeader, method);
            xhr.Send(Serialize(args));
            if (timeout > 0)
            {
                try
                {
                    // wait for timeout milliseconds
                    condition.Await(timeout);
                }
                catch (ConditionTimedOutException)
                {
                    Logging.Debug("Request timed out!!!");
                    throw new JsonRpcCallTimedOutException(this, method, args, timeout);
                }
            }
            else
            {
                // wait indefinitely
                condition.Await();
            }


            // we have a response from the server, or we couldn't connect
            Logging.Debug("Status code is: " + xhr.Status);
            if (xhr.Status == 200)
            {
                Logging.Debug("Got 200! Response text is " + xhr.ResponseText);
                return Deserialize(xhr.ResponseText);
            }
            else if (xhr.Status == 0)
            {
                Logging.Debug("Request timed out!!!");
                throw new JsonRpcCallTimedOutException(this, method, args, 1000); // TODO: Extract into constant of 1000 ms.  Also this should be some sort of connection refused exception instead
            }
            else
            {
                throw GenerateException(xhr.Status, method, args, xhr.ResponseText);
            }
        }

        // TODO: This method does NOT get compiled correctly by XaeiO.Compiler2:
        /*
        private static string Serialize(object obj)
        {
            if (obj == null)
            {
                return "null";
            }

            string str = obj as string;
            if (str != null)
            {
                // TODO: Escape backslashes are not being escaped in XaeiO.Compiler2
                return "\"" + str + "\"";
            }

            if (obj is int || // TODO: More number types
                obj is float ||
                obj is double ||
                obj is byte ||
                obj is short ||
                obj is bool)
            {
                return "\"" + obj.ToString() + "\"";
            }

            // TODO: Don't use native array here, use reflection to determine type of array
            NativeArray<object> array = obj as NativeArray<object>;
            if (array != null)
            {
                StringBuilder buffer = new StringBuilder();
                buffer.Append("[");
                if (array.Length > 0)
                {
                    for (int i = 0; i < array.Length - 1; i++)
                    {
                        buffer.Append(Serialize(array[i]));
                        buffer.Append(",");
                    }
                    buffer.Append(Serialize(array[array.Length - 1]));
                }
                buffer.Append("]");
                return buffer.ToString();
            }

            // dictionary?
            // TODO: Dictionary

            // TODO: Use reflection to get public property names, for now hackily assume it is a NativeObjects
            NativeObject nativeObj = obj as NativeObject;
            if (nativeObj != null)
            {
                StringBuilder buffer = new StringBuilder();
                buffer.Append("{");
                string[] keys = nativeObj.GetKeys();
                for (int i = 0; i < keys.Length; i++)
                {
                    string key = keys[i];
                    if (key == "$" || key == "prototype")
                    {
                        continue;
                    }
                    buffer.Append(Serialize(nativeObj[key]));
                    buffer.Append(",");
                    if (i < keys.Length - 1)
                    {
                        buffer.Append(",");
                    }
                }
                buffer.Append("}");
                return buffer.ToString();
            }

            throw new NotSupportedException("Could not serialize: " + obj);
        }
         * */

        // TODO: Arrays should carry information about their type and dimensions
        private static string Serialize(object obj)
        {
            if (obj == null)
            {
                return SerializeNull();
            }

            string str = obj as string;
            if (str != null)
            {
                return SerializeString(str);
            }

            if (CanSerializeWithToString(obj))
            {
                return SerializeWithToString(obj);
            }

            // TODO: Don't use typeof here, use reflection to determine type of array
            var objVar = var.Cast<object>(obj);
            if (objVar.InstanceOf("Array"))
            {
                return SerializeArray(objVar.Cast<NativeArray<object>>());
            }

            // dictionary?
            // TODO: Dictionary

            // TODO: Use reflection to get public property names, for now hackily assume it is a NativeObjects
            NativeObject nativeObj = obj as NativeObject;
            if (nativeObj != null)
            {
                SerializeNativeObject(nativeObj);
            }

            throw new NotSupportedException("Could not serialize: " + obj);
        }

        private static string SerializeNull()
        {
            return "null";
        }

        private static string SerializeString(string str)
        {
            // TODO: Escape backslashes are not being escaped in XaeiO.Compiler2
            return "\"" + str + "\"";
        }

        private static bool CanSerializeWithToString(object obj)
        {
            return
                obj is int || // TODO: More number types
                obj is float ||
                obj is double ||
                obj is byte ||
                obj is short ||
                obj is bool;
        }

        private static string SerializeWithToString(object obj)
        {
            return "\"" + obj.ToString() + "\"";
        }

        // TODO: This code is an infinite loop when compiled by XaeiO.Compiler2!!!!
        /*
        private static string SerializeArray(NativeArray<object> array)
        {
            StringBuilder buffer = new StringBuilder();
            buffer.Append("[");
            if (array.Length > 0)
            {
                for (int i = 0; i < array.Length - 1; i++)
                {
                    buffer.Append(Serialize(array[i]));
                    buffer.Append(",");
                }
                buffer.Append(Serialize(array[array.Length - 1]));
            }
            buffer.Append("]");
            return buffer.ToString();
        }
         */

        private static string SerializeArray(NativeArray<object> array)
        {
            StringBuilder buffer = new StringBuilder();
            buffer.Append("[");
            for (int i = 0; i < array.Length; i++)
            {
                buffer.Append(Serialize(array[i]));
                if (i < array.Length - 1)
                {
                    buffer.Append(",");
                }
            }
            buffer.Append("]");
            return buffer.ToString();
        }

        private static string SerializeNativeObject(NativeObject nativeObj)
        {
            StringBuilder buffer = new StringBuilder();
            buffer.Append("{");
            string[] keys = nativeObj.GetKeys();
            for (int i = 0; i < keys.Length; i++)
            {
                string key = keys[i];
                if (key == "$" || key == "prototype")
                {
                    continue;
                }
                buffer.Append(Serialize(nativeObj[key]));
                buffer.Append(",");
                if (i < keys.Length - 1)
                {
                    buffer.Append(",");
                }
            }
            buffer.Append("}");
            return buffer.ToString();
        }

        private Exception GenerateException(int statusCode, string method, object[] args, string responseText)
        {
            try
            {
                return (Exception)Deserialize(responseText);
            }
            catch (Exception) {}

            return new JsonRpcCallException(statusCode, this, method, args, responseText);
        }

        private static object Deserialize(string json)
        {
            return Deserialize(json, true);
        }

        // TODO: Don't use eval here!!!!!!!
        private static object Deserialize(string json, bool deserializeByJsonRpcType)
        {
            Logging.Debug("Deserializing: " + json);
            NativeObject jsonObject = Eval("[" + json + "]").Cast<NativeArray<NativeObject>>()[0];
            if (deserializeByJsonRpcType)
            {
                return Deserialize(jsonObject);
            }
            else
            {
                return jsonObject;
            }
        }

        private static object Deserialize(NativeObject json)
        {
            Logging.Debug("Trying to deserialize into managed object");
            if (!json.ContainsKey("__JsonRpcType__"))
            {
                Logging.Debug("No __JsonRpcType__ found");
                return json;
            }
            string jsonRpcTypeString = json["__JsonRpcType__"].Cast<string>();
            Type type = Type.GetType(jsonRpcTypeString);
            if (type == null)
            {
                throw new Exception("Unable to find type: " + jsonRpcTypeString);
            }
            // TODO: if type is interface, get implementing Type from JsonRpcImplementationAttribute
            
            object obj = Activator.CreateInstance(type);
            PropertyInfo[] properties = type.GetProperties();
            object[] args = new object[1];
            foreach (PropertyInfo property in properties)
            {
                if (property.SetMethod != null && json.ContainsKey(property.Name))
                {
                    Console.WriteLine("Setting property " + property.Name + " through reflection");
                    args[0] = json[property.Name];
                    property.SetMethod.Invoke(obj, args);
                }
            }
            return obj;
        }

        [Intrinsic("eval", UseGlobalNamespace = true)]
        private static extern var Eval(string code);

        private class OnReadyStateChangeHandler
        {
            private XmlHttpRequest XmlHttpRequest;
            private Condition Condition;

            public OnReadyStateChangeHandler(XmlHttpRequest xhr, Condition condition)
            {
                XmlHttpRequest = xhr;
                Condition = condition;
            }

            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public void OnReadyStateChange()
            {
                if (XmlHttpRequest.ReadyState == ReadyState.Loaded)
                {
                    Logging.Debug("XmlHttpRequest.ReadyState = Loaded");
                    Thread.ExecuteAsync(Condition.Signal);
                }
            }
        }
    }
}