using System;
using System.Threading;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class ThreadSleepTest : TestBase
    {
        private int _duration1;
        private int _duration2;

        public override void PerformTest()
        {
            Log("Sleeping for " + _duration1 + " seconds");
            Thread.Sleep(_duration1 * 1000);
            Log("Awake again!");
            Log("Sleeping for " + _duration2 + " seconds");
            Thread.Sleep(_duration2 * 1000);
        }

        /// <summary>
        /// A test of the Thread::Sleep method
        /// </summary>
        /// <param name="duration1">How long to sleep for the first time</param>
        /// <param name="duration2">How long to sleep for the second time</param>
        public ThreadSleepTest(int duration1, int duration2)
            : base("Threading test")
        {
            _duration1 = duration1;
            _duration2 = duration2;
        }
    }
}