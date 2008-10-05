using XaeiOS;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace System
{
	/// <summary>
	/// Represents errors that occur during application execution.
    /// </summary>
    [CorlibCLRConjugate]
	public class Exception
    {
        // TODO: Use explicit field layout here to set _throwContext to field slot 0
        private var _throwContext;

		public string Message
		{
			get
			{
				return _message;
			}
		}
		private string _message;

		public Exception InnerException
		{
			get
			{
				return _innerException;
			}
		}
		private Exception _innerException;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public Exception() : this(String.Empty,null)
		{
		}

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public Exception(string message) : this(message,null)
		{
		}

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
		public Exception(string message, Exception innerException)
		{
			_message = message;
			_innerException = innerException;
		}

		public virtual Exception GetBaseException()
		{
			Exception exception1;
			Exception exception2;
			exception1 = InnerException;
			exception2 = this;
			while ((exception1 != null))
			{
				exception2 = exception1;
				exception1 = exception1.InnerException;
			}
			return exception2;
		}

		public virtual string HelpLink 
		{
			get
			{
				throw new NotImplementedException();
			}
			set
			{
				throw new NotImplementedException();
			}
		}
		public virtual string Source 
		{
			get
			{
				throw new NotImplementedException();
			}
			set
			{
				throw new NotImplementedException();
			}
		}
		public virtual string StackTrace 
		{
			get
			{
                if (_stackTrace == null)
                {
                    _stackTrace = SystemCalls.GetStackTrace(this);
                }
                return _stackTrace;
			}
		}
        private string _stackTrace;

        public override string ToString()
        {
            return GetType() + ": " + Message;
        }
	}
}
