using System;
using System.Collections.Generic;

namespace System.Net.Comet
{
    public class CometMessageEventArgs : EventArgs
    {
        public string Message
        {
            get;
            private set;
        }
        public CometMessageEventArgs(string message) : base()
        {
            Message = message;
        }
    }
}
