using System;

// TODO: Finally support!

namespace XaeiOS.TestSuite.Tests
{
    public class ExceptionHandlingTest : TestBase
    {
        public override void PerformTest()
        {
            FirstTest();
            SecondTest();
        }

        private void FirstTest()
        {
            try
            {
                Log("Throwing exception");
                throw new Exception("Purposefully thrown exception");
                Fail("Exception not thrown");
            }
            catch (Exception e)
            {
                Log("Expected exception caught: " + e.ToString());
            }
        }

        private void SecondTest()
        {
            try
            {
                SecondTestHelper();
                Fail("NullReferenceException not thrown!");
            }
            catch (NullReferenceException e)
            {
                if (e is NullReferenceException && e.Message == "YES")
                {
                    Log("Expected NullReferenceException caught: " + e);
                }
                else
                {
                    Fail("Expected a NullReferenceException.  Instead got: " + e);
                }
            }
        }

        private void SecondTestHelper()
        {
            try
            {
                Log("Throwing NullReferenceException");
                throw new NullReferenceException("YES");
            }
            catch (NotSupportedException)
            {
                Fail("We should not catch a NullReferenceException in this catch(NotSupportedException e) handler!");
            }
        }


        public ExceptionHandlingTest() : base("Exception handling test")
        {
        }
    }
}