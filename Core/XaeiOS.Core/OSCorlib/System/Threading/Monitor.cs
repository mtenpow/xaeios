using System;
using System.Runtime;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

using XaeiOS;

namespace System.Threading
{
    public static class Monitor
    {

        public static void Enter(object obj)
        {
            GetThreadSync(obj).Acquire();
        }

        public static void Exit(object obj)
        {
            GetThreadSync(obj).Release();
        }

        public static bool TryEnter(object obj)
        {
            return GetThreadSync(obj).TryAcquire();
        }

        public static void Wait(object obj)
        {
            MonitorLock threadSync = GetThreadSync(obj);
            threadSync.Release();
            threadSync.Acquire();
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        private static MonitorLock GetThreadSync(object obj)
        {
            XaeiOSObject xaeiOSObject = XaeiOSObject.ToXaeiOSObject(obj);
            var threadSyncVar = xaeiOSObject.ThreadSync;
            if (!threadSyncVar.IsDefined())
            {
                threadSyncVar = xaeiOSObject.ThreadSync = var.Cast<MonitorLock>(new MonitorLock());
            }
            return threadSyncVar.Cast<MonitorLock>();
        }


        private class MonitorLock
        {
            private TaskHandle _owner;
            private NativeArray<TaskHandle> _waitingOwners;
            private int _count;

            public MonitorLock()
            {
                _owner = null;
                _waitingOwners = new NativeArray<TaskHandle>();
                _count = 0;
            }

            [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
            public void Acquire()
            {
                TaskHandle currentTask = SystemCalls.GetCurrentTask();
                //Logging.Trace("Task " + currentTask + " acquiring lock " + GetHashCode());
                while (_owner != null && _owner != currentTask)
                {
                    //Logging.Trace("Task " + currentTask + " failed to acquire lock " + GetHashCode());
                    _waitingOwners.Push(currentTask);
                    SystemCalls.BlockTask(currentTask);
                    SystemCalls.Yield();
                }
                _owner = currentTask;
                _count++;
                //Logging.Trace("Task " + currentTask + " acquired monitor lock " + GetHashCode() + " - count: " + _count);
            }

            [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
            public bool TryAcquire()
            {
                TaskHandle currentTask = SystemCalls.GetCurrentTask();
                if (_owner == null)
                {
                    _owner = currentTask;
                    _count++;
                    //Logging.Trace("Task " + currentTask + " acquired monitor lock " + GetHashCode() + " - count: " + _count);
                    return true;
                }
                else if (_owner == currentTask)
                {
                    _count++;
                    //Logging.Trace("Task " + currentTask + " acquired monitor lock " + GetHashCode() + " - count: " + _count);
                    return true;
                }
                return false;
            }

            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public void Release()
            {
                TaskHandle currentTask = SystemCalls.GetCurrentTask();
                if (_owner == currentTask)
                {
                    if (--_count == 0)
                    {
                        _owner = null;
                        if (_waitingOwners.Length > 0)
                        {
                            // here we call ScheduleTask instead of Unblock because we Yielded the task
                            SystemCalls.ScheduleTask(_owner = _waitingOwners.Shift());
                        }
                    }
                }
                else
                {
                    throw new Exception("Cannot release lock.  Current thread is not owner");
                }
            }
        }
    }
}

// TODO: Don't inline critical section methods
// TODO: DO inline non-preemptive methods