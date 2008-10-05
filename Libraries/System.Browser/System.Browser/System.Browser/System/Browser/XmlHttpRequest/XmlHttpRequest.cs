using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace System.Browser.XmlHttpRequest
{
    public sealed class XmlHttpRequest
    {
        #region IXmlHttpRequest Members

        public void Abort()
        {
            _xhr.Abort();
        }

        public string GetAllResponseHeaders()
        {
            return _xhr.GetAllResponseHeaders();
        }

        public string GetResponseHeader(string header)
        {
            return _xhr.GetResponseHeader(header);
        }

        public void Open(string method, string url)
        {
            _xhr.Open(method, url);
        }

        public void Open(string method, string url, bool async)
        {
            _xhr.Open(method, url, async);
        }

        public void Open(string method, string url, bool async, string username)
        {
            _xhr.Open(method, url, async, username);
        }

        public void Open(string method, string url, bool async, string username, string password)
        {
            _xhr.Open(method, url, async, username, password);
        }

        public void Send(string postData)
        {
            _xhr.Send(postData);
        }

        public void SetRequestHeader(string label, string value)
        {
            _xhr.SetRequestHeader(label, value);
        }

        public string ResponseText
        {
            get { return _xhr.ResponseText; }
        }

        public int Status
        {
            get { return _xhr.Status; }
        }

        public string StatusText
        {
            get { return _xhr.StatusText; }
        }

        public ReadyState ReadyState
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _xhr.ReadyState; }
        }

        public NativeFunction OnReadyStateChange
        {
            get
            {
                return _xhr.OnReadyStateChange;
            }
            set
            {
                _xhr.OnReadyStateChange = value;
            }
        }

        #endregion

        private IXmlHttpRequest _xhr;

        internal XmlHttpRequest(IXmlHttpRequest xhr)
        {
            _xhr = xhr;
        }

        public override string ToString()
        {
            return "XmlHttpRequest(ReadyState=" + _xhr.ReadyState + ", Status=" + _xhr.Status + " " + _xhr.StatusText + ")";
        }
    }
}
