//#define PERFORMANCE_TESTS_ONLY
#define RUN_PROCESS_VIEWER

using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;
using System.Diagnostics;

using XaeiOS.Boot;
using XaeiOS.TestSuite.Tests;
using XaeiOS.Process;
using XaeiOS.ProcessViewer;
using System.Browser.XmlHttpRequest;

namespace XaeiOS.TestSuite
{
    public static class TestRunner
    {
        private static Type[] _testSuites = new Type[] {
#if !PERFORMANCE_TESTS_ONLY
            typeof(ThreadingTestSuite),
            typeof(ClassStructureTestSuite),
            typeof(ReflectionTestSuite),
            typeof(CompilerBugsTestSuite),
            typeof(ExceptionHandlingTestSuite),
#endif
            typeof(QuickSortTestSuite)
        };

        private static int _passCount;
        private static List<ITest> _failures;

        private static void Main(string[] args)
        {
            SignalDaemon.Start();
            XmlHttpRequestManager.StartDriver();
#if RUN_PROCESS_VIEWER
            RunProcessViewer();
#endif
            RunTestSuite();
        }

        private static void RunProcessViewer()
        {
            SIP processViewerSIP = new SIP(delegate()
            {
                Logging.Info("Starting Process Viewer");
                ProcessViewer.ProcessViewer processViewer = new ProcessViewer.ProcessViewer();
                processViewer.UpdateInterval = 2000;
                processViewer.Start();
            }, ThreadPriority.Normal, "Process Viewer");
            processViewerSIP.Exited += delegate(object sender, EventArgs e)
            {
                Logging.Info("Process Viewer exited");
            };
            processViewerSIP.Start();
        }

        private static void RunTestSuite()
        {
            SIP testSuiteSIP = new SIP(delegate()
            {
                Logging.Info("Starting XaeiOS.TestSuite");
                RunTests();
            }, ThreadPriority.Normal, "XaeiOS.TestSuite");
            testSuiteSIP.Exited += delegate(object sender, EventArgs e)
            {
                Logging.Info("XaeiOS.TestSuite process exited");
            };
            testSuiteSIP.Start();
        }

        private static List<ITest> GetTestCases()
        {
            List<ITest> tests = new List<ITest>();

            for (int i = 0; i < _testSuites.Length; i++)
            {
                Type testSuite = _testSuites[i];
                TestSuite testSuiteInstance = Activator.CreateInstance<TestSuite>(testSuite);
                IList<ITest> testCases = testSuiteInstance.GetTestCases();
                for (int j = 0; j < testCases.Count; j++)
                {
                    tests.Add(testCases[j]);
                }
            }

            // add single test cases
            ITest[] testArray = new ITest[] {
#if !PERFORMANCE_TESTS_ONLY
                new NullReferenceExceptionTest(),
                new ThreadSleepTest(4,3),
                new ResourceTest(),
                new SynchronizationTest(),
                new DictionaryRemoveSSABugTest(),
                new EventTest(),
                new XmlHttpRequestTest(),
#endif
                new DomTest(8),
                new MultiThreadingStressTest(100),
                new SingleThreadedPerformanceTest()
            };

            for (int i = 0; i < testArray.Length; i++)
            {
                tests.Add(testArray[i]);
            }

            return tests;
        }

        private static void RunTests()
        {
            _passCount = 0;
            _failures = new List<ITest>();
            List<ITest> tests = GetTestCases();
            Log("Performing " + tests.Count + " tests");
            for (int i = 0; i < tests.Count; i++)
            {
                PerformTest(tests[i]);
            }
            Console.WriteLine();
            Log("Passed " + _passCount + " of " + tests.Count + " tests.");
            Console.WriteLine("=================================================");
            Console.WriteLine();

            for (int i = 0; i < _failures.Count; i++)
            {
                Console.WriteLine();
                Console.Write("Failure ");
                Console.Write((i + 1).ToString());
                Console.Write(": ");
                Console.Write(_failures[i].Name);
                Console.Write(" - ");
                Console.WriteLine(_failures[i].Exception.ToString());
                Console.WriteLine(_failures[i].Exception.StackTrace);
                Console.WriteLine();
            }

        }

        private static void PerformTest(ITest test)
        {
            Log("Performing test: " + test.Name);
            long startTime = new NativeDate().GetTime();
            test.Test();
            long deltaTime = new NativeDate().GetTime() - startTime;
            if (test.Passed)
            {
                _passCount++;
                Log("Test: " + test.Name + " [PASSED]: " + deltaTime + " ms");
            }
            else
            {
                Log("Test: " + test.Name + " [FAILED]: " + deltaTime + " ms => " + test.Exception + " - " + test.Exception.StackTrace);
                _failures.Add(test);
            }
            // TODO: ConditionalExpression "test.Passsed?'PASSED':'FAILED'" was producing either "undefined" or "'FAILED'" need regression test for it
        }

        private static void Log(string s)
        {
            Log("TestRunner", s);
        }

        public static void Log(string context, string s)
        {
            Console.WriteLine("[" + context + "] @ " + new NativeDate().ToString() + " : " + s);
        }
    }
}
