
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Security.Principal;
using System.Text;
using System.Threading;

using Queue = System.Collections.Queue;

namespace System.Net.Comet
{
	public class CometServer
	{
		private Dictionary<string, CometClient> _clients;
		private Dictionary<string, List<CometClient>> _pathIndex;
		private Dictionary<string, List<CometClient>> _usernameIndex;
		private Set<string> _requestPaths;
		private CometAuthenticationDelegate _authenticate;
		private object _lock = new object();
        private TcpListener _listener;
        private TcpListener _policyListener;
		
		public CometAuthenticationDelegate Authenticate
		{
			get
			{
				return _authenticate;
			}
			set
			{
				_authenticate = value;
			}
		}
		
		private bool _running = false;
		
		public const int DefaultPolicyPort = 7088;
		private int _policyPort = DefaultPolicyPort;
		public int PolicyPort
		{
			get
			{
				return _policyPort;
			}
			set
			{
				_policyPort = value;
			}
		}
		
		private bool _secure = false;
		public bool Secure
		{
			set
			{
				if (value)
				{
					throw new NotSupportedException("Secure comet connections are not yet supported.");
				}
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
		
		public CometServer()
		{
			_clients = new Dictionary<string, CometClient>();
			_pathIndex = new Dictionary<string, List<CometClient>>();
			_usernameIndex = new Dictionary<string, List<CometClient>>();
			_requestPaths = new Set<string>();
		}
		
		public void StopListening()
		{
			if (!_running)
			{
				throw new InvalidOperationException("Cannot stop listening.  Not yet listening");
			}
			_running = false;
            
            try
            {
                _listener.Stop();
            }
            catch (SocketException e)
            {
                Console.Error.WriteLine(e);
            }

            try
            {
                _policyListener.Stop();
            }
            catch (SocketException e)
            {
                Console.Error.WriteLine(e);
            }

		}
		
		public void AddRequestPath(string requestPath)
		{
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
			_requestPaths.Add(requestPath);
		}
		
		public void Listen(int port)
		{
			Console.WriteLine("Accepting comet requests on port {0}", port);
			foreach (string requestPath in _requestPaths)
			{
				Console.WriteLine("Request path: {0}", requestPath);
			}
			_listener = new TcpListener(IPAddress.Any, port);
			_port = port;
			_running = true;
			Thread policyThread = new Thread(ListenPolicy);
			policyThread.Start();
			_listener.Start();
			while (_running)
			{
				IAsyncResult result = _listener.BeginAcceptTcpClient(ListenAsyncCallback, null);
				result.AsyncWaitHandle.WaitOne();
			}
		}
		
		private void ListenPolicy()
		{
			Console.WriteLine("Listening for policy request");
			_policyListener = new TcpListener(IPAddress.Any, _policyPort);
			_policyListener.Start();
			while (_running)
			{
				TcpClient client = _policyListener.AcceptTcpClient();
				Console.WriteLine("Serving policy request");
				StreamWriter writer = new StreamWriter(client.GetStream());
				writer.Write("<cross-domain-policy><allow-access-from domain='*' to-ports='*' /></cross-domain-policy>");
				writer.Flush();
				client.Close();
			}
		}
		
		private void ListenAsyncCallback(IAsyncResult result)
		{
			if (!_running)
			{
				// TODO: Log that request was denied because server was shutdown
				Console.WriteLine("Cannot handle comet request.  Server is already shutdown.");
				return;
			}
			Console.WriteLine("Got comet request!");
			TcpClient context = _listener.EndAcceptTcpClient(result);
			Console.WriteLine("Handling request");
			CometRequestHandler requestHandler = new CometRequestHandler(this, context);
			requestHandler.HandleRequest();
		}
		
		private int _cometIdCounter = 1;
		public string GenerateCometId()
		{
			lock (_lock)
			{
				return _cometIdCounter++.ToString();
			}
		}
		
		public void EnqueueByRequestPath(string requestPath, string message)
		{
			// TODO: Use more fine-grained locks throughout
			List<CometClient> removedClients = new List<CometClient>();
			List<CometClient> clients;
			Console.WriteLine("Enqueue by request path: {0}, {1}", requestPath, message);
			lock (_lock)
			{
				Console.WriteLine("CometServer: Global lock acquired...");
				if (!_pathIndex.TryGetValue(requestPath, out clients))
				{
					Console.WriteLine("Did not find any clients connected to that path");
					return;
				}
				Console.WriteLine("{0} clients are at that path", clients.Count);
				foreach (CometClient client in clients)
				{
					if (client == null)
					{
						Console.WriteLine("Client was null for message: " + message);
						continue;
					}
					if (message == null)
					{
						Console.WriteLine("Message was null for client:" + client);
						continue;
					}
					try
					{
						client.Enqueue(message);
					}
					catch (Exception e)
					{
						// TODO: Log e
						removedClients.Add(client);
					}
				}
			}
			foreach (CometClient client in removedClients)
			{
				CloseConnection(client);
			}
		}
		public void EnqueueByUsername(string username, string message)
		{
			// TODO: Use more fine-grained locks throughout
			List<CometClient> removedClients = new List<CometClient>();
			List<CometClient> clients;
			lock (_lock)
			{
				if (!_usernameIndex.TryGetValue(username, out clients))
				{
					return;
				}
				foreach (CometClient client in clients)
				{
					try
					{
						client.Enqueue(message);
					}
					catch (Exception e)
					{
						// TODO: Log e
						removedClients.Add(client);
					}
				}
			}
			foreach (CometClient client in removedClients)
			{
				CloseConnection(client);
			}
		}
		public void EnqueueByUsernameAndRequestPath(string username, string requestPath, string message)
		{
			// TODO: Use more fine-grained locks throughout
			List<CometClient> removedClients = new List<CometClient>();
			List<CometClient> clients;
			lock (_lock)
			{
				if (!_usernameIndex.TryGetValue(username, out clients))
				{
					Console.WriteLine("Could not find username {0} in username index", username);
					return;
				}
				Console.WriteLine("Found {0} clients matching username {1}", clients.Count, username);
				foreach (CometClient client in clients)
				{
					if (client.Path == requestPath)
					{
						try
						{
							client.Enqueue(message);
						}
						catch (Exception e)
						{
							// TODO: Log e
							removedClients.Add(client);
						}
					}
				}
			}
			foreach (CometClient client in removedClients)
			{
				CloseConnection(client);
			}
		}
		
		internal void CloseConnection(CometClient cometClient)
		{
			Console.WriteLine("Closing comet connection {0}", cometClient);
			lock (_lock)
			{
				_clients.Remove(cometClient.CometId);
				string path = cometClient.Path;
				List<CometClient> clients = _pathIndex[path];
				clients.Remove(cometClient);
				if (clients.Count == 0)
				{
					_pathIndex.Remove(path);
				}
				if (cometClient.User != null)
				{
					string name = cometClient.User.Identity.Name;
					clients = _usernameIndex[name];
					clients.Remove(cometClient);
					if (clients.Count == 0)
					{
						_usernameIndex.Remove(name);
					}
				}
			}
		}
		
		internal CometClient AcceptClient(CometRequestHandler requestHandler)
		{
			Console.WriteLine("AcceptClient");
			CometClient cometClient;
			lock (_lock)
			{
				Console.WriteLine("Got lock");
				if (_clients.ContainsKey(requestHandler.CometId))
				{
					Console.WriteLine("Client already exists");
					throw new Exception("Client already exists!");
				}
				else
				{
					/*
					 if (!_requestPaths.Contains(requestHandler.Path))
					 {
					 Console.WriteLine("Invalid request path: \"{0}\"", requestHandler.Path);
					 throw new Exception("Invalid request path");
					 }
					 */
					cometClient = new CometClient(requestHandler);
					_clients.Add(requestHandler.CometId, cometClient);
					Console.WriteLine("Client created!");
				}
			}
			List<CometClient> clients;
			lock (_lock)
			{
				Console.WriteLine("Adding client to path index");
				if (!_pathIndex.TryGetValue(requestHandler.Path, out clients))
				{
					clients = new List<CometClient>();
					_pathIndex.Add(requestHandler.Path, clients);
				}
				clients.Add(cometClient);
				if (requestHandler.User != null)
				{
					Console.WriteLine("Adding client to username index: {0}", requestHandler.User.Identity.Name);
					if (!_usernameIndex.TryGetValue(requestHandler.User.Identity.Name, out clients))
					{
						clients = new List<CometClient>();
						_usernameIndex.Add(requestHandler.User.Identity.Name, clients);
					}
					clients.Add(cometClient);
				}
			}
			//requestHandler.WriteConnectionEstablished();
			//Console.WriteLine("Connection established for comet id: {0}", cometClient.CometId);
			return cometClient;
		}
	}
}
