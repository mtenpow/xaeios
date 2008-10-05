using System;
using System.Threading;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class MultiThreadingTest : TestBase
    {
        private bool _threadTwoCompleteCondition;
        private bool _testCompleteCondition;

        public override void PerformTest()
        {
            _threadTwoCompleteCondition = false;
            _testCompleteCondition = false;
            Thread thread1 = new Thread(ThreadOneStart, ThreadPriority.Normal);
            thread1.Name = "Thread One";
            Thread thread2 = new Thread(ThreadTwoStart, ThreadPriority.Normal);
            thread2.Name = "Thread Two";
            thread1.Start();
            Thread.Sleep(10000);
            thread2.Start();
            Log("Main thread has begun polling for the test complete condition...");
            while (!_testCompleteCondition)
            {
                Thread.Sleep(100);
            }
            Assert("Thread two complete condition was not set", _threadTwoCompleteCondition);
            Assert("Test complete condition was not set", _testCompleteCondition);
        }

        private void ThreadOneStart()
        {
            Log("Thread one has started");
            Log("Thread one has begun polling for the thread two complete condition...");
            while (!_threadTwoCompleteCondition)
            {
                Thread.Sleep(100);
            }
            Log("Thread one is now setting the test complete condition");
            _testCompleteCondition = true;
        }

        private void ThreadTwoStart()
        {
            Log("Thread two has started");
            Thread.Sleep(3000);
            Log("Thread two is now setting the thread two complete condition");
            _threadTwoCompleteCondition = true;
        }

        public MultiThreadingTest()
            : base("Multi-threading test")
        {
        }
    }
}