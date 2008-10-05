using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Threading;
using System.Collections.Generic;

using XaeiOS;
using XaeiOS.Process;


namespace System.Browser.XmlHttpRequest
{
    public static class XmlHttpRequestManager
    {
        private static SIP _driverProcess;
        private static ManualResetEvent _driverExit;
        private static int _customSignalIdCounter = 0;
        private static Dictionary<int, OnReadyStateChangeSignalHandler> _onReadyStateChangeSignalHandlers = new Dictionary<int, OnReadyStateChangeSignalHandler>();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void StartDriver()
        {
            string processName = typeof(XmlHttpRequestManager).Name + ".Driver";
            if (_driverProcess != null)
            {
                throw new InvalidOperationException(processName + " is already started. Only one signal daemon is allowed.");
            }
            _driverExit = new ManualResetEvent();
            _driverProcess = new SIP(delegate() { }, ThreadPriority.High, processName, true);
            _driverProcess.CustomSignal += HandleCustomSignal;
            _driverProcess.Start();
        }

        private static void HandleCustomSignal(int data)
        {
            lock (_onReadyStateChangeSignalHandlers)
            {
                if (!_onReadyStateChangeSignalHandlers.ContainsKey(data))
                {
                    // TODO: Log somewhere that we received a random signal
                }
                else
                {
                    OnReadyStateChangeSignalHandler handler = _onReadyStateChangeSignalHandlers[data];
                    handler.OnReadyStateChange();
                }
            }
        }

        private static OnReadyStateChangeSignalSender CreateOnReadyStateChangeSignalSender(OnReadyStateChangeSignalHandler handler)
        {
            OnReadyStateChangeSignalSender signalSender;
            lock (_onReadyStateChangeSignalHandlers)
            {
                int signalId = ++_customSignalIdCounter;
                _onReadyStateChangeSignalHandlers[signalId] = handler;
                signalSender = new OnReadyStateChangeSignalSender
                {
                    SignalId = signalId
                };
            }
            return signalSender;
        }

        private static void DestroyOnReadyStateChangeSignalSender(OnReadyStateChangeSignalSender sender)
        {
            lock (_onReadyStateChangeSignalHandlers)
            {
                _onReadyStateChangeSignalHandlers.Remove(sender.SignalId);
            }
        }

        public static XmlHttpRequest GetXmlHttpRequest()
        {
            return new XmlHttpRequest(NativeGetXmlHttpRequest());
        }

        public static XmlHttpRequest DoSimpleXmlHttpRequest(string url)
        {
            return DoSimpleXmlHttpRequest(url, RequestMethod.Get);
        }

        public static XmlHttpRequest DoSimpleXmlHttpRequest(string url, RequestMethod method)
        {
            return DoSimpleXmlHttpRequest(url, RequestMethod.Get, null, null, null);
        }

        public static XmlHttpRequest DoSimpleXmlHttpRequest(string url, RequestMethod method, string postData, string username, string password, int timeoutMs)
        {
            if (timeoutMs <= 0)
            {
                throw new ArgumentOutOfRangeException("timeoutMs must be greater than 0");
            }
            return _doSimpleXmlHttpRequest(url, method, postData, username, password, timeoutMs);
        }

        public static XmlHttpRequest DoSimpleXmlHttpRequest(string url, RequestMethod method, string postData, string username, string password)
        {
            return _doSimpleXmlHttpRequest(url, method, postData, username, password, -1);
        }

        private static XmlHttpRequest _doSimpleXmlHttpRequest(string url, RequestMethod method, string postData, string username, string password, int timeoutMs)
        {
            XmlHttpRequest xhr = GetXmlHttpRequest();
            Lock l = new Lock();
            l.Acquire();
            Condition condition = new Condition(l);
            if (_driverProcess == null)
            {
                throw new SystemException("XmlHttpRequestManager.Driver was not started.");
            }
            OnReadyStateChangeSignalHandler handler = new OnReadyStateChangeSignalHandler
            {
                XmlHttpRequest = xhr,
                Condition = condition
            };

            // TODO: Use resource manager to ensure these signal senders and handlers get cleaned up
            OnReadyStateChangeSignalSender signalSender = CreateOnReadyStateChangeSignalSender(handler);
            try
            {
                xhr.OnReadyStateChange = (NativeFunction)new NativeVoidDelegate(signalSender.SendSignal);
                string methodString;
                if (method == RequestMethod.Get)
                {
                    methodString = "GET";
                }
                else
                {
                    methodString = "POST";
                }
                xhr.Open(methodString, url, true, username, password);
                xhr.Send(postData);
                if (timeoutMs > 0)
                {
                    if (!condition.Await(timeoutMs))
                    {
                        xhr.OnReadyStateChange = null;
                        throw new XmlHttpRequestTimeoutException("Timed out waiting for " + url, xhr);
                    }
                }
                else
                {
                    condition.Await();
                }
                // TODO: finally blocks are not executed if there is a return statement in the try block.  fix that
            }
            finally
            {
                DestroyOnReadyStateChangeSignalSender(signalSender);
            }
            return xhr;
        }

        private class OnReadyStateChangeSignalSender
        {
            public int SignalId;

            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public void SendSignal()
            {
                SignalDaemon.SendSignal(_driverProcess.PID, Signal.Custom, SignalId);
            }
        }

        private class OnReadyStateChangeSignalHandler
        {
            public Condition Condition;
            public XmlHttpRequest XmlHttpRequest;

            public void OnReadyStateChange()
            {
                if (XmlHttpRequest.ReadyState == ReadyState.Loaded)
                {
                    Condition.Signal();
                }
            }
        }

#if IE && !IE7
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "new ActiveXObject(\"Microsoft.XMLHTTP\")")]
#else
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "new XMLHttpRequest()")]
#endif
        private static extern IXmlHttpRequest NativeGetXmlHttpRequest();
    }

    public enum RequestMethod
    {
        Get,
        Post
    }

    public class XmlHttpRequestTimeoutException : Exception
    {
        public XmlHttpRequest XmlHttpRequest
        {
            get;
            private set;
        }

        public XmlHttpRequestTimeoutException(string message, XmlHttpRequest xmlHttpRequest)
            : base(message)
        {
            XmlHttpRequest = xmlHttpRequest;
        }
    }
}
