using System;

namespace XaeiOS.TestSuite
{
    public static class Assert
    {
        public static void AssertTrue(string message, bool condition)
        {
            if (!condition)
            {
                throw new AssertException(message);
            }
        }
        public static void Fail(string message)
        {
            throw new AssertException(message);
        }
        public static void AssertEquals(long expected, long actual)
        {
            if (expected != actual)
            {
                throw new AssertException("Expected: <" + expected + ">, Received: <" + actual + ">");
            }
        }
        public static void AssertEquals(int expected, int actual)
        {
            if (expected != actual)
            {
                throw new AssertException("Expected: <" + expected + ">, Received: <" + actual + ">");
            }
        }
        public static void AssertEquals(string expected, string actual)
        {
            if (expected != actual)
            {
                throw new AssertException("Expected: <" + expected + ">, Received: <" + actual + ">");
            }
        }
        public static void AssertEquals(object expected, object actual)
        {
            if (expected == null)
            {
                if (actual == null)
                {
                    return;
                }
                else
                {
                    throw new AssertException("Expected: <" + expected + ">, Received: <" + actual + ">");
                }
            }
            if (!expected.Equals(actual))
            {
                throw new AssertException("Expected: <" + expected + ">, Received: <" + actual + ">");
            }
        }
        public static void AssertNotNull(string message, object value)
        {
            AssertTrue(message, value != null);
        }
    }
}