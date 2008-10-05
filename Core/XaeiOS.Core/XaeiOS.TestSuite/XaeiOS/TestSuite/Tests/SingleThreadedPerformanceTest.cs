using System;

namespace XaeiOS.TestSuite.Tests
{
    public class SingleThreadedPerformanceTest : TestBase
    {
        public override void PerformTest()
        {
            long startTime = new NativeDate().GetTime();
            long sum = 0;
            const long n = 2000000;
            for (int i = 0; i <= n; i++)
            {
                sum += i;
            }
            long deltaTime = new NativeDate().GetTime() - startTime;
            AssertEquals(((n / 2) * (n + 1)), sum);
            Log("Result is " + sum + ".  Took " + deltaTime.ToString() + "ms");
        }

        public SingleThreadedPerformanceTest()
            : base("Single threaded performance test")
        {
        }
    }
}