using System;
using System.Threading;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    // TODO: XaeiO.Compiler should Array Bounds Check
    public class MultiThreadingStressTest : TestBase
    {
        private object _startedThreadsLock;
        private int _numberOfThreads;
        private int _failedThreads;
        private Lock _threadFinishedLock;
        private Lock _allThreadsStartedLock;
        private Condition _allThreadsStartedCondition;
        private Semaphore _semaphore;
        private int _startedThreads;

        public override void PerformTest()
        {
            Log("Creating " + _numberOfThreads + " threads");
            Thread[] threads = new Thread[_numberOfThreads];
            for (int i = 0; i < _numberOfThreads; i++)
            {
                threads[i] = new Thread(Work, ThreadPriority.Normal);
            }

            _startedThreads = 0;
            _startedThreadsLock = new object();
            _allThreadsStartedLock = new Lock();
            _allThreadsStartedCondition = new Condition(_allThreadsStartedLock);
            _allThreadsStartedLock.Acquire();

            Log("Starting " + _numberOfThreads + " threads"); // TODO: ParametizedThreadStart doesn't work properly
            for (int i = 0; i < _numberOfThreads; i++)
            {
                threads[i].Start();
            }

            // wait for all threads to be running
            _allThreadsStartedCondition.Await();
            _allThreadsStartedLock.Release();

            Log("Waiting for all threads to finish");

            _semaphore.Acquire(_numberOfThreads); // wait for all threads to finish

            Assert(_failedThreads + " threads failed the calculation", _failedThreads == 0);
            Log("All " + _numberOfThreads + " threads finished");

        }

        void ThreadStarted()
        {
            lock (_startedThreadsLock)
            {
                if (++_startedThreads == _numberOfThreads)
                {
                    Log("All threads have started!");
                    _allThreadsStartedLock.Acquire();
                    try
                    {
                        _allThreadsStartedCondition.Signal();
                    }
                    finally
                    {
                        _allThreadsStartedLock.Release();
                    }
                }
                Log("Current thread count = " + _startedThreads);
            }
        }

        void Work()
        {
            ThreadStarted();
            //Log("Thread " + threadNumber + " started");
            _semaphore.Acquire();
            const long n = 100000;
            long sum = 0;
            for (int i = 0; i <= n; i++)
            {
                sum += i;
            }
            //Log("Thread finished. Result: " + sum + "");
            ThreadFinished(sum != ((n / 2) * (n + 1)));
            _semaphore.Release();
        }

        void ThreadFinished(bool failed)
        {
            _threadFinishedLock.Acquire();
            if (failed)
            {
                _failedThreads++;
            }
            _threadFinishedLock.Release();
        }

        public MultiThreadingStressTest(int numberOfThreads)
            : base("Multi-threading stress test")
        {
            if (numberOfThreads < 2)
            {
                throw new ArgumentException("numberOfThreads should be greater than 1");
            }
            _threadFinishedLock = new Lock();
            _semaphore = new Semaphore(numberOfThreads);
            _numberOfThreads = numberOfThreads;
            _failedThreads = 0;
        }
    }
}