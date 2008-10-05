using System;
using System.Runtime.InteropServices;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class AlertHelloWorldTest : TestBase
    {
        public override void PerformTest()
        {
            Alert("HelloWorld!");
        }

        public AlertHelloWorldTest() : base("Alert hello world test")
        {
        }

        [Intrinsic("alert", UseGlobalNamespace = true)]
        private static extern void Alert(string s);
    }
}