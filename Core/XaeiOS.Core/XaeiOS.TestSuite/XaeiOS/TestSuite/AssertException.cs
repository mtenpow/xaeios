using System;

namespace XaeiOS.TestSuite
{
    public class AssertException : Exception
    {
        public AssertException(string message) : base(message)
        {
        }
    }
}