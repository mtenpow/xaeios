using System;
using System.Collections.Generic;
using System.Text;

using System.Net.Sockets;
using System.IO;


namespace System.Net.Comet
{
    internal class CometRequestHandler
    {
        public CometServer CometServer;
        private TcpClient _context;
        private Stream _stream;

        private string _cometId;

        public CometClientPrincipal User
        {
            get
            {
                return _user;
            }
        }
        private CometClientPrincipal _user;

        public string Path
        {
            get
            {
                return _path;
            }
        }
        private string _path;

        public string CometId
        {
            get
            {
                return _cometId;
            }
        }

        public CometRequestHandler(CometServer cometServer, TcpClient context)
        {
            CometServer = cometServer;
            _context = context;
            _stream = context.GetStream();
        }

        public void HandleRequest()
        {
            try
            {
                StreamReader streamReader = new StreamReader(_context.GetStream());

                _path = streamReader.ReadLine();
                if (String.IsNullOrEmpty(_path))
                {
                    throw new Exception("Invalid request path");
                }
                Console.WriteLine("Request path is {0}", _path);
                string username = streamReader.ReadLine();
                if (String.IsNullOrEmpty(username))
                {
                    Console.WriteLine("No username");
                    throw new Exception("Authentication failed");
                }
                string password = streamReader.ReadLine();
                if (String.IsNullOrEmpty(password))
                {
                    Console.WriteLine("No password");
                    throw new Exception("Authentication failed");
                }

                Console.WriteLine("Comet username and password are: {0}:{1}", username, password);
                CometClientIdentity identity = new CometClientIdentity(username);
                identity.Password = password;
                CometClientPrincipal principal = new CometClientPrincipal(identity);
                _user = principal;
                if (CometServer.Authenticate != null && !CometServer.Authenticate(_user))
                {
                    throw new Exception("Authentication failed");
                }

                Console.WriteLine("HashSetting up comet connection");

                // setup comet client
                //WriteOKResponse();

                _cometId = CometServer.GenerateCometId();
                Console.WriteLine("HashSetting comet id to: {0}", _cometId);
                CometServer.AcceptClient(this);
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception was thrown: {0}", e);
                _context.Close();
                throw e;
            }
        }

        public void Flush()
        {
            _stream.Flush();
        }

        public void Write(string s)
        {
            ushort length = (ushort)System.Text.Encoding.UTF8.GetByteCount(s);
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(s);
            _stream.WriteByte((byte)(length >> 8));
            _stream.WriteByte((byte)(length & 0xFF));
            _stream.Write(bytes, 0, bytes.Length);
            _stream.Flush();
        }
    }
}