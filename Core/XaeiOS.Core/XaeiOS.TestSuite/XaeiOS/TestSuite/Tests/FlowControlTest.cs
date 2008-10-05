using System;
using System.Runtime.InteropServices;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class CompilerFlowControlTest : TestBase
    {
        public override void PerformTest()
        {
        }

        private double TestScore(int index, bool go)
        {
            double score = TestScore(index, go);
            for (int j = 0; j >= index; j--)
            {
                if (go)
                {
                    score -= 1.0;
                }
                else
                {
                    score -= 0.15;
                }
            }
            return score;
        }

        public CompilerFlowControlTest()
            : base("Compiler flow control test")
        {
        }
    }
}