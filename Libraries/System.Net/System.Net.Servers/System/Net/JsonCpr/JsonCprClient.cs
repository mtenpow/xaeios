using System;
using System.Collections.Generic;
using System.Threading;

using System.Net.Comet;
using System.Net.JsonRpc;

namespace System.Net.JsonRpc
{
	public class JsonCprServer
	{
		public CometServer CometServer
		{
			get {
				return _cometServer;
			}
		}
		private CometServer _cometServer;
		
		public JsonRpcServer JsonRpcServer
		{
			get {
				return _jsonRpcServer;
			}
		}
		private JsonRpcServer _jsonRpcServer;
		
		private Set<string> _clientPaths;
		private Dictionary<string, JsonCprCallback> _pendingCalls;
		
		private Thread _jsonRpcServerThread;
		private Thread _cometServerThread;
		
		public JsonCprServer()
		{
			_cometServer = new CometServer();
			_cometServer.AddRequestPath("/");
			_jsonRpcServer = new JsonRpcServer();
			_jsonRpcServer.RegisterMethods(this, "/");
			_clientPaths = new Set<string>();
			_pendingCalls = new Dictionary<string, JsonCprCallback>();
		}
		
		public void Listen(int cometPort, int jsonRpcPort)
		{
			_jsonRpcServerThread = new Thread(ListenJsonRpc);
			_jsonRpcServerThread.Start((object)jsonRpcPort);
			_cometServerThread = new Thread(ListenComet);
			_cometServerThread.Start((object)cometPort);
		}
		
		private void ListenJsonRpc(object port)
		{
			_jsonRpcServer.Listen((int)port);
		}
		
		private void ListenComet(object port)
		{
			_cometServer.Listen((int)port);
		}
		
		public void StopListening()
		{
			_cometServer.StopListening();
			_jsonRpcServer.StopListening();
		}
		
		public void Call(string clientPath, string methodName, JsonCprCallback callback, params object[] args)
		{
			lock (this)
			{
				if (!_clientPaths.Contains(clientPath))
				{
					throw new Exception("Client path " + clientPath + " does not exist");
				}
				string callId = GenerateCallId();
				JsonCprCall call = new JsonCprCall(callId, methodName, args);
				_cometServer.EnqueueByRequestPath(clientPath, JsonUtils.JsonSerialize(call) + "\r\n\r\n");
				if (callback != null)
				{
					_pendingCalls.Add(callId, callback);
				}
			}
		}
		
		private string GenerateCallId()
		{
			lock (this)
			{
				return (_callIdCounter++).ToString();
			}
		}
		private int _callIdCounter = 1;
		
		[JsonRpcMethod]
		public void RegisterClientPath(string serverPath)
		{
			// TODO: verify format of client path
			lock (this)
			{
				Console.WriteLine("Registering client path: {0}", serverPath);
				if (!_clientPaths.Contains(serverPath))
				{
					Console.WriteLine("Client path {0} registered!", serverPath);
					_clientPaths.Add(serverPath);
				}
			}
		}
		
		[JsonRpcMethod]
		public void Callback(string callId, [JsonRpcMarshal("T")]object returnValue)
		{
			JsonCprCallback callback;
			lock(this)
			{
				if(!_pendingCalls.TryGetValue(callId, out callback))
				{
					throw new Exception("Invalid call id");
				}
				_pendingCalls.Remove(callId);
			}
			callback(returnValue);
		}
	}
	
	public delegate void JsonCprCallback(object returnValue);
}

