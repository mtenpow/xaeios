using System;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

using XaeiOS;
using XaeiOS.Process;

namespace System.Threading
{
    internal static class ThreadManager
    {
        private static ThreadsByTask _threadsByTask;

        public static Thread CurrentThread
        {
            get
            {
                // TODO: This breaks XaeiO.Compiler
                /*lock (_threadsByTask)
                {
                    return _threadsByTask[SystemCalls.GetCurrentTask()];
                }
                */
                return _threadsByTask[SystemCalls.GetCurrentTask()];
            }
        }

        internal static void RegisterThread(Thread thread)
        {
            //lock (_threadsByTask)
            //{
                _threadsByTask[thread.Task] = thread;
            //}
        }

        internal static void UnregisterThread(Thread thread)
        {
            //lock (_threadsByTask)
            //{
                _threadsByTask.Remove(thread.Task);
            //}
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Initialize()
        {
            _threadsByTask = new ThreadsByTask();
            /*
            // kernel thread
            TaskHandle kernelTask = SystemCalls.GetCurrentTask();
            ManualResetEvent exitLoop = new ManualResetEvent();
            Thread kernelThread = new Thread(delegate()
            {
                while (true)
                {
                    // TODO: Use an auto reset event here
                    exitLoop.WaitOne();
                    Logging.Warn("Kernel thread exit event was set!");
                    exitLoop.Reset();
                }
            }, ThreadPriority.Realtime, SIPManager.KernelSIP, kernelTask);
            kernelThread.Name = "XaeiOS.Kernel";
            kernelThread.RegisterAndSetRunning();*/
        }

        // TODO: Need locking around threadsByTaskId!

        public static Thread[] GetThreads()
        {
            // TODO: Locking breaks compiler
            //lock (_threadsByTask)
            //{
                string[] keys = _threadsByTask.GetKeys();
                Thread[] threads = new Thread[keys.Length];
                for (int i = 0; i < keys.Length; i++)
                {
                    threads[i] = _threadsByTask[keys[i]].Cast<Thread>();
                }
                return threads;
            //}
        }

        private class ThreadsByTask : NativeObject
        {
            public extern Thread this[TaskHandle task]
            {
                [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}]")]
                get;
                [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{this}[{0}] = {1}")]
                set;
            }

            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "delete {this}[{0}]")]
            public extern void Remove(TaskHandle task);
        }
    }
}