using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

namespace TestCLRApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello world");

            int x = 10;
            int y = 100;
            int z = 0;
            for (int i = 0; i < x; i++)
            {
                z += x + y * i;
            }
            Console.WriteLine(z);

            new MultiThreadingStressTest(10).PerformTest();
            new QuickSortTestSuite().TestQuickSort();
            new ClassStructureTestSuite().TestOverrideInterfaceMethodOfAbstractBaseClass();
        }

        private static void Log(string s)
        {
            Console.WriteLine(s);
        }

        private static void Assert(string message, bool condition)
        {
            if (!condition)
            {
                throw new Exception("Assertion failed: " + message);
            }
        }
        private static void AssertEquals(int expected, int actual)
        {
            if (expected != actual)
            {
                throw new Exception("Assertion failed.  Expected <" + expected + "> but got <" + actual + ">");
            }
        }

        public class MultiThreadingStressTest
        {
            private int _numberOfThreads;
            private int _failedThreads;
            private int _startedThreads;
            private int _finishedThreads;

            public void PerformTest()
            {
                Log("Creating " + _numberOfThreads + " threads");
                Thread[] threads = new Thread[_numberOfThreads];
                for (int i = 0; i < _numberOfThreads; i++)
                {
                    threads[i] = new Thread(Work);
                }

                _startedThreads = 0;
                _finishedThreads = 0;

                Log("Starting " + _numberOfThreads + " threads");
                for (int i = 0; i < _numberOfThreads; i++)
                {
                    threads[i].Start();
                }

                Log("Waiting for all threads to finish");

                while (true)
                {
                    if (AllThreadsFinished())
                    {
                        break;
                    }
                    else
                    {
                        Thread.Sleep(1);
                    }
                }

                Assert(_failedThreads + " threads failed the calculation", _failedThreads == 0);
                Log("All " + _numberOfThreads + " threads finished");

            }

            void ThreadStarted()
            {
                Monitor.Enter(this);
                if (++_startedThreads == _numberOfThreads)
                {
                    Log("All threads have started!");
                }
                Log("Current thread count = " + _startedThreads);
                Monitor.Exit(this);
            }

            void Work()
            {
                ThreadStarted();
                Log("Thread started");
                const long n = 10000;
                long sum = 0;
                for (int i = 0; i <= n; i++)
                {
                    sum += i;
                }
                Log("Thread finished. Result: " + sum + "");
                ThreadFinished(sum != ((n / 2) * (n + 1)));
            }

            void ThreadFinished(bool failed)
            {
                Monitor.Enter(this);
                if (failed)
                {
                    _failedThreads++;
                }
                _finishedThreads++;
                Monitor.Exit(this);
            }

            bool AllThreadsFinished()
            {
                Monitor.Enter(this);
                bool finished = _finishedThreads == _numberOfThreads;
                Monitor.Exit(this);
                return finished;
            }

            public MultiThreadingStressTest(int numberOfThreads)
            {
                if (numberOfThreads < 2)
                {
                    throw new ArgumentException("numberOfThreads should be greater than 1");
                }
                _numberOfThreads = numberOfThreads;
                _failedThreads = 0;
            }
        }

        public class QuickSortTestSuite
        {
            public void TestQuickSort()
            {
                List<int> data = new List<int>();
                data.Add(5);
                data.Add(53);
                data.Add(25);
                data.Add(2);
                data.Add(32131);
                data.Add(142);
                for (int i = 0; i < data.Count; i++)
                {
                    Console.WriteLine("Added " + data[i] + ".");
                }
                Console.WriteLine("Sorting " + data.Count + " elements.");
                Sort<int>(data, CompareInts);
                Console.WriteLine("Done sorting " + data.Count + " elements.");

                int[] expectedValues = new int[] {
                    2,5,25,53,142,32131
                };

                for (int i = 0; i < data.Count; i++)
                {
                    Console.WriteLine("Checking index " + i + ".  Expecting " + expectedValues[i]);
                    AssertEquals(expectedValues[i], data[i]);
                }

                data = new List<int>();
                for (int i = 255; i >= 0; i--)
                {
                    data.Add(i);
                }
                Console.WriteLine("Sorting " + data.Count + " elements.");
                Sort<int>(data, CompareInts);
                Console.WriteLine("Done sorting " + data.Count + " elements.");

                for (int i = 0; i < data.Count; i++)
                {
                    AssertEquals(i, data[i]);
                }
            }

            private static int CompareInts(int a, int b)
            {
                return a - b;
            }
            private static void Sort<T>(List<T> data, Comparison<T> comparison)
            {
                Sorting<T>(0, data.Count - 1, data, comparison);
            }
            private static int GetPivotPoint<T>(int begPoint, int endPoint, List<T> data, Comparison<T> comparison)
            {
                int pivot = begPoint;
                int m = begPoint + 1;
                int n = endPoint;

                while ((m < endPoint) && GreaterThanOrEqualTo<T>(data[pivot], data[m], comparison))
                {
                    m++;
                }

                while ((n > begPoint) && LessThanOrEqualTo<T>(data[pivot], data[n], comparison))
                {
                    n--;
                }

                while (m < n)
                {
                    T temp = data[m];
                    data[m] = data[n];
                    data[n] = temp;

                    while ((m < endPoint) && GreaterThanOrEqualTo<T>(data[pivot], data[m], comparison))
                    {
                        m++;
                    }

                    while ((n > begPoint) && LessThanOrEqualTo<T>(data[pivot], data[n], comparison))
                    {
                        n--;
                    }

                }
                if (pivot != n)
                {
                    T temp2 = data[n];
                    data[n] = data[pivot];
                    data[pivot] = temp2;

                }
                return n;

            }
            private static void Sorting<T>(int beg, int end, List<T> data, Comparison<T> comparison)
            {
                if (end == beg)
                {
                    return;
                }
                else
                {
                    int pivot = GetPivotPoint(beg, end, data, comparison);
                    if (pivot > beg)
                        Sorting<T>(beg, pivot - 1, data, comparison);
                    if (pivot < end)
                        Sorting<T>(pivot + 1, end, data, comparison);
                }
            }
            private static bool GreaterThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
            {
                return comparison(a, b) > -1;
            }
            private static bool LessThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
            {
                return comparison(a, b) < 1;
            }
        }

        public delegate int Comparison<T>(T a, T b);

        public class ClassStructureTestSuite
        {
            public void TestOverrideInterfaceMethodOfAbstractBaseClass()
            {
                IAdder adder = new RegularAdder();
                AssertEquals(16, adder.AddTen(6));
            }

            private interface IAdder
            {
                int AddTen(int x);
            }

            private abstract class AdderBase : IAdder
            {
                #region IInterface Members

                public abstract int AddTen(int x);

                #endregion

                protected AdderBase()
                {
                }
            }

            private class RegularAdder : AdderBase
            {
                public RegularAdder()
                {
                }

                public override int AddTen(int x)
                {
                    for (int i = 0; i < 10; i++)
                    {
                        x++;
                    }
                    return x;
                }
            }
        }
    }


}
