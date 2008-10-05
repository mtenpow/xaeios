using System;
using System.Reflection;
using System.Collections.Generic;

namespace XaeiOS.TestSuite
{
    // TODO: Use reflection to create new instances of test suite per test case, then we can get rid of reflectiongeneratedtest
    public abstract class TestSuite : ITest
    {
        private MethodInfo _method;

        public TestSuite()
        {
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
        protected void AssertNotNull(string message, object value)
        {
            XaeiOS.TestSuite.Assert.AssertNotNull(message, value);
        }
        #endregion

        #region ITest Members

        public string Name
        {
            get;
            set;
        }

        public bool Passed
        {
            get;
            private set;
        }

        public Exception Exception
        {
            get;
            private set;
        }

        public void Test()
        {
            Passed = true;
            try
            {
                Setup();
                _method.Invoke(this, new object[0]);
            }
            catch (Exception e)
            {
                Passed = false;
                Exception = e;
            }
            finally
            {
                TearDown();
            }
        }

        #endregion

        public IList<ITest> GetTestCases()
        {
            List<ITest> testCases = new List<ITest>();

            // use reflection to get test case
            Type type = GetType();
            MethodInfo[] methods = type.GetMethods();
            foreach (MethodInfo method in methods)
            {
                if (method.IsDefined(typeof(TestAttribute), false))
                {
                    // TODO: allow TestAttribute to define test case name
                    TestSuite testCase = Activator.CreateInstance<TestSuite>(type);
                    testCase._method = method;
                    testCase.Name = type.ToString() + "::" + method.Name;
                    testCases.Add(testCase);
                }
            }

            return testCases;
        }

        protected void Log(string s)
        {
            TestRunner.Log(Name, s);
        }

        public virtual void Setup()
        {
        }

        public virtual void TearDown()
        {
        }
    }

    [AttributeUsage(AttributeTargets.Method)]
    public class TestAttribute : Attribute
    {
    }
}