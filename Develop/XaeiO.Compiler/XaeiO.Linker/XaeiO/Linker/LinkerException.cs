using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Linker
{
    public class LinkerException : Exception
    {
        public LinkerException()
        {
        }

        public LinkerException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
