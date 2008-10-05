using System;
using System.Threading;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class SynchronizationTest : TestBase
    {
        Lock _mainLock;

        public override void PerformTest()
        {
            _mainLock = new Lock();

            Thread controllerThread = new Thread(ControllerThreadStart, ThreadPriority.Normal);
            controllerThread.Name = "Controller Thread";

            controllerThread.Start();
            Thread.Sleep(2000);

            Log("Main thread is trying to acquire the main lock...");
            _mainLock.Acquire();
            Log("Main thread got the main lock...");
        }

        private void ControllerThreadStart()
        {
            Log("Controller thread has begun");
            _mainLock.Acquire();
            Log("Controller thread has acquired the main lock");
            Thread.Sleep(3000);
            Log("Controller thread is now releasing the main lock");
            _mainLock.Release();
            Log("Controller thread is now exiting");
        }

        public SynchronizationTest()
            : base("Synchronization test")
        {
        }
    }
}