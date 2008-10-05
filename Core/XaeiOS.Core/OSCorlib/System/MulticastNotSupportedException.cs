using System;

namespace System
{
	/// <summary>
	/// Summary description for MulticastNotSupportedException.
	/// </summary>
	public class MulticastNotSupportedException : Exception
	{
		public MulticastNotSupportedException(string message) : base(message)
		{
		}

        public MulticastNotSupportedException() : this("Multicast not supported")
        {
        }
	}
}
