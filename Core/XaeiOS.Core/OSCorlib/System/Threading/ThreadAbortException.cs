namespace System.Threading
{
	/// <summary>
	/// Summary description for ArgumentException.
	/// </summary>
	public sealed class ThreadAbortException : SystemException
	{
        public object ExceptionState
        {
            get
            {
                return _exceptionState;
            }
        }
        private object _exceptionState;

        public ThreadAbortException(object exceptionState) : base()
		{
            _exceptionState = exceptionState;
		}

        public ThreadAbortException()
            : this(null)
        {
        }
	}
}
