#region Using directives

using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization;

#endregion

namespace XaeiO.Compiler
{
    [Serializable]
	public class CompilerException : Exception
	{
        public CompilerException()
        {
        }
        public CompilerException(string message) : base(message)
		{
        }
        public CompilerException(string message, Exception innerException) : base(message, innerException)
        {
        }
        public CompilerException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}
