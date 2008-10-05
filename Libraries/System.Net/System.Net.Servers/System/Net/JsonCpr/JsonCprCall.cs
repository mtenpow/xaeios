using System;

namespace System.Net.JsonRpc
{
	public class JsonCprCall
	{
		private string _id;
		private string _methodName;
		private object[] _arguments;
		
		public JsonCprCall(string id, string methodName, object[] args)
		{
			_id = id;
			_methodName = methodName;
			_arguments = args;
		}
		
		public string Id
		{
			set {
				_id = value;
			}
			
			get {
				return _id;
			}
		}
		
		public string MethodName
		{
			set {
				_methodName = value;
			}
			
			get {
				return _methodName;
			}
		}
		
		public object[] Arguments
		{
			set {
				_arguments = value;
			}
			
			get {
				return _arguments;
			}
		}
	}
}
