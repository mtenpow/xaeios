using System;

namespace XaeiOS.TestSuite.Tests
{
    public class ExceptionHandlingTestSuite : TestSuite
    {
        [Test]
        public void TestExceptionTypeHandlers()
        {
            try
            {
                Log("Throwing exception");
                throw new Exception("Purposefully thrown exception");
                Fail("Exception not thrown");
            }
            catch (NullReferenceException e)
            {
                Fail("Did not expect a NullReferenceException: " + e);
            }
            catch (Exception e)
            {
                Log("Expected exception caught: " + e);
            }
            Log("Test passed");
        }

        [Test]
        public void TestExceptionTypeHandlers2()
        {
            try
            {
                Log("Throwing exception");
                throw new Exception("Purposefully thrown exception");
                Fail("Exception not thrown");
            }
            catch (NullReferenceException e)
            {
                Fail("Did not expect a NullReferenceException: " + e);
            }
            catch (SystemException e)
            {
                Fail("Did not expect a SystemException: " + e);
            }
            catch (Exception e)
            {
                Log("Expected exception caught: " + e);
            }
            Log("Test passed");
        }

        [Test]
        public void FirstTest()
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

        [Test]
        public void SecondTest()
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

        [Test]
        public void TestBasicTryCatchFinally()
        {
            try
            {
                Log("In try block");
            }
            catch (Exception)
            {
                Log("In catch block");
            }
            finally
            {
                Log("In finally block");
            }
            Log("Outside of try-catch-finally");
        }

        [Test]
        public void TestBasicTryCatchFinallyThrowException()
        {
            try
            {
                Log("In try block");
                throw new Exception("Purposefully thrown");
            }
            catch (Exception)
            {
                Log("In catch block");
            }
            finally
            {
                Log("In finally block");
            }
            Log("Outside of try-catch-finally");
        }

        [Test]
        public void TestBasicNestedTryCatchFinally()
        {
            bool enteredInnerFinally = false;
            bool enteredOuterFinally = false;
            try
            {
                Log("In outer try block");
                try
                {
                    Log("In inner try block");
                    throw new Exception();
                    Fail("This line should never be executed");
                }
                catch (Exception)
                {
                    Log("In inner catch block");
                }
                finally
                {
                    enteredInnerFinally = true;
                    Log("In inner finally block");
                }
                throw new Exception();
                Fail("This line should never be executed");
            }
            catch (Exception)
            {
                Log("In outer catch block");
            }
            finally
            {
                enteredOuterFinally = true;
                Log("In outer finally block");
            }

            Assert("Did not enter inner finally block", enteredInnerFinally);
            Assert("Did not enter outer finally block", enteredOuterFinally);
        }

        [Test]
        public void TestComplexNestedTryCatchFinally()
        {
            try
            {
                Log("In outer try block");
                try
                {
                    Log("In inner try block");
                    try
                    {
                        Log("In inner most try block");
                        throw new Exception("Thrown from inner most try block");
                        Fail("This inner most line should never be executed");
                    }
                    catch (Exception)
                    {
                        Log("In inner most catch block");
                    }
                    finally
                    {
                        Log("In inner most finally block");
                    }
                    Log("Throwing exception from inner try block");
                    throw new Exception("Thrown from inner try block");
                    Fail("This line should never be executed");
                }
                finally
                {
                    Log("In inner finally block");
                }
                Fail("This line should never be executed");
            }
            catch (Exception)
            {
                Log("In outer catch block");
            }
            finally
            {
                Log("In outer finally block");
            }
        }

        [Test]
        public void TestFinallyExecutesAfterCatchBlockThrows()
        {
            /**
             * This test doesn't actually assert anything.
             * What we should do here is get the test context using a thread local and 
             * set it to false if the finally block hasn't executed.
             * 
             * ThreadLocal variables are not yet implemented though.
             * 
             * TODO: This method breaks CecilFrontEnd
             */
            /*
            try
            {
                Log("In try block");
                throw new Exception("Purposefully thrown");
            }
            catch (Exception)
            {
                Log("In catch block");
                throw new Exception("Purposefully thrown again");
            }
            finally
            {
                Log("In finally block");
            }*/
        }

        [Test]
        public void TestFinallyExecutesAfterCatchBlockThrows2()
        {
            bool finallyExecuted = false;
            try
            {
                try
                {
                    Log("In try block");
                    throw new Exception("Purposefully thrown");
                }
                catch (Exception)
                {
                    Log("In catch block");
                    throw new Exception("Purposefully thrown again");
                }
                finally
                {
                    finallyExecuted = true;
                    Log("In finally block");
                }
            }
            catch (Exception) { }
            Assert("Finally block did not execute when catch block threw", finallyExecuted);
        }
    }
}