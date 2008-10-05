using System;

namespace XaeiOS.TestSuite
{
    public abstract class TestBase : ITest
    {
        #region ITest Members

        public string Name
        {
            get
            {
                return _name;
            }
        }
        private string _name;

        public bool Passed
        {
            get
            {
                return _passed;
            }
        }
        private bool _passed; // TODO: What are bools initialized to by the compiler? should be false.  i think it's doing 0 or something else

        public Exception Exception
        {
            get
            {
                return _exception;
            }
        }
        private Exception _exception;

        public void Test()
        {
            _passed = true;
            try
            {
                PerformTest();
            }
            catch (Exception e)
            {
               TestFailed(e);
            }
        }

        #endregion

        protected TestBase(string name)
        {
            _name = name;
        }

        public abstract void PerformTest();

        protected void TestFailed(Exception e)
        {
            _passed = false;
            _exception = e;
        }

        public void Log(string s)
        {
            TestRunner.Log(_name, s);
        }

        #region Assertions
        protected void Assert(string message, bool condition)
        {
            XaeiOS.TestSuite.Assert.AssertTrue(message, condition);
        }
        protected void Fail(string message)
        {
            XaeiOS.TestSuite.Assert.Fail(message);
        }
        protected void AssertEquals(long expected, long actual)
        {
            XaeiOS.TestSuite.Assert.AssertEquals(expected, actual);
        }
        protected void AssertEquals(int expected, int actual)
        {
            XaeiOS.TestSuite.Assert.AssertEquals(expected, actual);
        }
        protected void AssertEquals(string expected, string actual)
        {
            XaeiOS.TestSuite.Assert.AssertEquals(expected, actual);
        }
        protected void AssertEquals(object expected, object actual)
        {
            XaeiOS.TestSuite.Assert.AssertEquals(expected, actual);
        }
        #endregion
    }
}