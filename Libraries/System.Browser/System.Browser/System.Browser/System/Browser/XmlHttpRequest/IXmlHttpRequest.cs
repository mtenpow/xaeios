using System;
using System.Runtime.InteropServices;

namespace System.Browser.XmlHttpRequest
{
    [Intrinsic]
    internal interface IXmlHttpRequest
    {
        [Intrinsic("abort")]
        void Abort();

        [Intrinsic("getAllResponseHeaders")]
        string GetAllResponseHeaders();

        [Intrinsic("getResponseHeader")]
        string GetResponseHeader(string header);

        [Intrinsic("open")]
        void Open(string method, string url);
        [Intrinsic("open")]
        void Open(string method, string url, bool async);
        [Intrinsic("open")]
        void Open(string method, string url, bool async, string username);
        [Intrinsic("open")]
        void Open(string method, string url, bool async, string username, string password);

        [Intrinsic("send")]
        void Send(string postData);
        [Intrinsic("setRequestHeader")]
        void SetRequestHeader(string label, string value);

        [Intrinsic("responseText")]
        string ResponseText
        {
            get;
        }

        [Intrinsic("status")]
        int Status
        {
            get;
        }

        [Intrinsic("statusText")]
        string StatusText
        {
            get;
        }

        [Intrinsic("readyState")]
        ReadyState ReadyState
        {
            get;
        }

        [Intrinsic("onreadystatechange")]
        NativeFunction OnReadyStateChange
        {
            get;
            set;
        }
    }

    public enum ReadyState
    {
        Uninitialized = 0,
        Open = 1,
        Sent = 2,
        Receiving = 3,
        Loaded = 4
    }
}
