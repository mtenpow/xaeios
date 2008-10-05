using System;
using System.Collections.Generic;

namespace System.Net.Comet
{
    public class CometConnection
    {
        public string ServerUrl
        {
            get;
            private set;
        }

        public CometConnectionState State
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

        private Socket _socket;

        public CometConnection(string serverUrl, string username, string password)
        {
            ServerUrl = serverUrl;
            State = CometConnectionState.Ready;
            Username = username;
            Password = password;
        }

        #region Connection state transition events
        public event EventHandler Established;
        public event EventHandler Restablishing;
        public event EventHandler Reestablished;
        public event EventHandler Failed;
        #endregion

        public event EventHandler MessageReceived;

        public CometConnection(string serverUrl) : this(serverUrl, null, null)
        {
        }

        public void Open()
        {
            if (State != CometConnectionState.Ready)
            {
                throw new InvalidOperationException("Connection must be in state: " + CometConnectionState.Ready);
            }

            // TODO: Create new Socket
            throw new NotImplementedException();

            _socket.Connect();
            //_socket.WriteLine(RequestPath);
            //_socket.WriteLine(Username);
            //_socket.WriteLine(Password);

            //_socket.BeginReceive
        }

        private void DataReceived(object sender, EventArgs e)
        {
            string message = null; // TODO: Parse message
            if (MessageReceived != null)
            {
                MessageReceived(this, new CometMessageEventArgs(message));
            }
            throw new NotImplementedException();
        }
    }
}
