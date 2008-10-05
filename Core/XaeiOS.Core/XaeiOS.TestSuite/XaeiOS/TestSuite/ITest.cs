using System;

namespace XaeiOS.TestSuite
{
    public interface ITest
    {
        string Name
        {
            get;
        }
        bool Passed
        {
            get;
        }
        Exception Exception
        {
            get;
        }
        void Test();
    }
}