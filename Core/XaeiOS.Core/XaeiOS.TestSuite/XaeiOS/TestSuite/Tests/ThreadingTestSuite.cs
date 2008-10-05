using System;
using System.Reflection;
using System.Threading;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiOS.TestSuite.Tests
{
    public class ThreadingTestSuite : TestSuite
    {
        // TODO: These timed conditions are not used properly
        // Use a ManualResetEvent instead
        [Test]
        public void TestAbortThread()
        {
            Lock sync = new Lock();
            Condition aborted = new Condition(sync);
            Thread testThread = new Thread(delegate()
            {
                try
                {
                    Log("Test thread sleeping for 8 seconds..");
                    Thread.Sleep(8000);
                    Fail("This line should never be executed");
                }
                catch (ThreadAbortException)
                {
                    Log("Test thread aborted..");
                    aborted.Signal();
                }
            });
            testThread.Start();
            sync.Acquire();
            Log("Aborting test thread in 2 seconds.  Sleeping...");
            Thread.Sleep(2000);
            Log("...awake!  Going to abort the test thread.");
            testThread.Abort();
            Log("Called testThread.Abort()");
            Assert("Thread was not aborted as expected!", aborted.Await(12000));
        }

        [Test]
        public void TestAbortThreadWithState()
        {
            Lock sync = new Lock();
            Condition aborted = new Condition(sync);
            Thread testThread = new Thread(delegate()
            {
                try
                {
                    Log("Test thread sleeping for 8 seconds..");
                    Thread.Sleep(8000);
                    Fail("This line should never be executed");
                }
                catch (ThreadAbortException e)
                {
                    if (e.ExceptionState != null && e.ExceptionState.ToString() == "Exception state")
                    {
                        Log("Test thread aborted with state: " + e.ExceptionState);
                        aborted.Signal();
                    }
                    else
                    {
                        Log("Test thread aborted with unknown state: " + e.ExceptionState);
                    }
                }
            });
            testThread.Start();
            sync.Acquire();
            Log("Aborting test thread in 2 seconds");
            Thread.Sleep(2000);
            testThread.Abort("Exception state");
            Assert("Thread was not aborted as expected!", aborted.Await(12000));
        }

        [Test]
        public void TestLockIdiom()
        {
            object sync = new object();
            lock (sync)
            {
                Log("In locked section");
            }
            Log("Outside of locked section");
        }


        private class PurposefullyThrownException : Exception
        {
            public PurposefullyThrownException() : base("PurposefullyThrownException")
            {
            }
        }

        // TODO: The anonymous delegate in this method break XaeiO.Compiler
        // TODO: Move this into compiler bugs test suite
        [Test]
        public void BrokenTestLockIdiomUnlocksWhenExceptionsAreThrown()
        {
            object sync = new object();
            try
            {
                lock (sync)
                {
                    Log("In locked section.  Throwing exception");
                    throw new PurposefullyThrownException();
                }
            }
            catch (PurposefullyThrownException e)
            {
                Log("Caught exception as expected: " + e);
            }

            bool secondThreadAcquiredLock = false;
            ManualResetEvent secondThreadDone = new ManualResetEvent();
            Thread secondThread = new Thread(delegate()
            {
                secondThreadAcquiredLock = Monitor.TryEnter(sync);
                secondThreadDone.Set();
            });
            secondThread.Start();
            if (!secondThreadDone.WaitOne(10 * 1000))
            {
                secondThread.Abort();
            }
            Assert("Finally block of lock idiom should have unlocked sync obj", secondThreadAcquiredLock);
        }

        private object _sync;
        private ManualResetEvent _secondThreadDone;

        [Test]
        public void TestLockIdiomUnlocksWhenExceptionsAreThrown()
        {
            object sync = new object();
            try
            {
                lock (sync)
                {
                    Log("In locked section.  Throwing exception");
                    throw new PurposefullyThrownException();
                }
            }
            catch (PurposefullyThrownException e)
            {
                Log("Caught exception as expected: " + e);
            }

            _sync = sync;

            
            _secondThreadDone = new ManualResetEvent();
            Thread secondThread = new Thread(delegate()
            {
                Log("Starting second thread.  Trying to acquire the lock");
                if (Monitor.TryEnter(_sync))
                {
                    Log("Second acquired the lock!");
                    _secondThreadDone.Set();
                }
                else
                {
                    Log("Second thread did not acquire the lock...");
                }
            });
            secondThread.Name = "Second thread";
            Log("Starting second thread");
            secondThread.Start();
            if (!_secondThreadDone.WaitOne(5 * 1000))
            {
                Log("Test failed.  Aborting second thread");
                secondThread.Abort();
                Fail("Finally block of lock idiom should have unlocked sync obj");
            }
        }

        // TODO: test reset event with timeout
        [Test]
        public void TestManualResetEvent()
        {
            ManualResetEvent firstEvent = new ManualResetEvent();
            ManualResetEvent secondEvent = new ManualResetEvent();
            bool firstEventWorked = false;
            Thread testThread = new Thread(delegate()
            {
                Log("Test thread waiting on first event..");
                firstEvent.WaitOne();
                Log("....test thread awake!");
                firstEventWorked = true;
                Log("Test thread setting the second event");
                secondEvent.Set();
                Log("Test thread set the second event");
            });
            testThread.Start();
            Log("Main thread sleeping for 2 seconds.  Sleeping...");
            Thread.Sleep(2000);
            Log("...main thread awake!  Going to set the first event.");
            firstEvent.Set();
            Log("Main thread set the first event.  Going to wait for the test thread to set the second event");
            secondEvent.WaitOne();
            Log("...main thread awake!");

            Assert("Test thread didn't wake up when the first event was signalled", firstEventWorked);
        }
    }
}