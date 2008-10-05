using System;
using System.Collections.Generic;
using System.Text;

using Newtonsoft.Json;

namespace System.Net.JsonRpc
{
    public static class JsonUtils
    {

        public static string JsonSerialize(object o)
        {
            if (o == null)
            {
                return "null";
            }
            return JsonSerialize(o, o.GetType());
        }

        public static string JsonSerializeException(Exception e, string errorCode)
        {
            JavaScriptObject jsObject = (JavaScriptObject)JavaScriptConvert.DeserializeObject(JavaScriptConvert.SerializeObject(new SerializableJsonRpcReportableException(errorCode, e.Message)));
            jsObject["__JsonRpcType__"] = e.GetType().FullName;
            return JavaScriptConvert.SerializeObject(jsObject);
        }
        public static string JsonSerialize(object o, Type type)
        {
            if (o == null)
            {
                return "null";
            }
            IShallowCloneable shallowCloneable = o as IShallowCloneable;
            if (shallowCloneable != null)
            {
                o = shallowCloneable.ShallowClone();
                Console.WriteLine("Object was shallow cloneable: {0}", o);
            }
            if (type.Equals(typeof(string)))
            {
                return EscapeJavaScriptString(o.ToString());
            }
            else if (type.Equals(typeof(int)) ||
                     type.Equals(typeof(long)) ||
                     type.Equals(typeof(float)) ||
                     type.Equals(typeof(double)) ||
                     type.Equals(typeof(short)) ||
                     type.Equals(typeof(byte)) ||
                     type.Equals(typeof(sbyte)) ||
                     type.Equals(typeof(uint)) ||
                     type.Equals(typeof(ushort)) ||
                     type.Equals(typeof(ulong))) // TODO: More number types
            {
                return o.ToString();
            }
            else if (type.Equals(typeof(DateTime)))
            {
                DateTime d1 = new DateTime(1970, 1, 1);
                DateTime d2 = DateTime.Now.ToUniversalTime();
                TimeSpan ts = new TimeSpan(d2.Ticks - d1.Ticks);
                return String.Format("new Date({0})", ts.TotalMilliseconds);
            }
            else if (type.Equals(typeof(Boolean)))
            {
                return o.ToString().ToLower();
            }
            else if (type.IsArray)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("[");
                object[] array = (object[])o;
                if (array.Length > 0)
                {
                    for (int i = 0; i < array.Length - 1; i++)
                    {
                        sb.Append(JsonSerialize(array[i], type.GetElementType()));
                        sb.Append(",");
                    }
                    sb.Append(JsonSerialize(array[array.Length - 1], type.GetElementType()));
                }
                sb.Append("]");
                return sb.ToString();
            }
            else
            {
                try
                {
                    //Console.WriteLine("Serializing object {0} using Newtonsoft.Json", o);
                    JavaScriptObject jsObject = (JavaScriptObject)JavaScriptConvert.DeserializeObject(JavaScriptConvert.SerializeObject(o));
                    jsObject["__JsonRpcType__"] = type.FullName;
                    return JavaScriptConvert.SerializeObject(jsObject);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }
            }
        }


        public static string EscapeJavaScriptString(string value)
        {
            return EscapeJavaScriptString(value, '"', true);
        }

        public static string EscapeJavaScriptString(string value, char delimiter, bool appendDelimiters)
        {
            if (string.IsNullOrEmpty(value))
            {
                if (appendDelimiters)
                    return new string(delimiter, 2);
                else
                    return string.Empty;
            }

            StringBuilder sb = null;
            int lastWritePosition = 0;
            int skipped = 0;

            // leading delimiter
            if (appendDelimiters)
            {
                sb = new StringBuilder(value.Length + 5);
                sb.Append(delimiter);
            }

            for (int i = 0; i < value.Length; i++)
            {
                char currentChar = value[i];
                string escapedValue;

                switch (currentChar)
                {
                    case '\t':
                        escapedValue = @"\t";
                        break;
                    case '\n':
                        escapedValue = @"\n";
                        break;
                    case '\r':
                        escapedValue = @"\r";
                        break;
                    case '\f':
                        escapedValue = @"\f";
                        break;
                    case '\b':
                        escapedValue = @"\b";
                        break;
                    case '"':
                        // only escape if this charater is being used as the delimiter
                        escapedValue = (delimiter == '"') ? "\\\"" : null;
                        break;
                    case '\'':
                        // only escape if this charater is being used as the delimiter
                        escapedValue = (delimiter == '\'') ? @"\'" : null;
                        break;
                    case '\\':
                        escapedValue = @"\\";
                        break;
                    default:
                        escapedValue = null;
                        break;
                }

                // test if the char needs to be escaped or whether it can be skipped
                if (escapedValue != null)
                {
                    if (sb == null)
                        sb = new StringBuilder(value.Length + 5);

                    // write skipped text
                    if (skipped > 0)
                    {
                        sb.Append(value, lastWritePosition, skipped);
                        skipped = 0;
                    }

                    // write escaped value and note position
                    sb.Append(escapedValue);
                    lastWritePosition = i + 1;
                }
                else
                {
                    skipped++;
                }
            }

            // nothing was escaped. return initial string
            if (sb == null)
                return value;

            // write any remaining skipped text
            if (skipped > 0)
                sb.Append(value, lastWritePosition, skipped);

            // trailing delimiter
            if (appendDelimiters)
                sb.Append(delimiter);

            return sb.ToString();
        }

        private class SerializableJsonRpcReportableException
        {
            public string ErrorCode
            {
                get;
                private set;
            }
            public string Message
            {
                get;
                private set;
            }
            public SerializableJsonRpcReportableException(string errorCode, string message)
            {
                ErrorCode = errorCode;
                Message = message;
            }
        }
    }
}