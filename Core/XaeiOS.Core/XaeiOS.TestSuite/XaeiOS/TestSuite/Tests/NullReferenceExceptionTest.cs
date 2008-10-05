using System;
using System.Runtime.InteropServices;

namespace XaeiOS.TestSuite.Tests
{
    public class NullReferenceExceptionTest : TestBase
    {
        public override void PerformTest()
        {
            try
            {
                object x = null;
                Log(x.ToString());
                Fail("Expected NullReferenceException to be thrown");
            }
            catch (NullReferenceException e)
            {
                Log("Caught NullReferenceException as expected: " + e);
            }
            catch (Exception e)
            {
                Fail("Expected NullReferenceException to be thrown.  Instead got: " + e);
            }
        }

        public NullReferenceExceptionTest()
            : base("Null reference exception test")
        {
        }
    }
}