using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Diagnostics;

using XaeiOS;

// TODO: Make this lock more fine grained

namespace System.Threading
{
    public class Lock
    {
        private TaskHandle _owner;
        private NativeArray<TaskHandle> _waitingOwners;

        public Lock()
        {
            _owner = null;
            _waitingOwners = new NativeArray<TaskHandle>();
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
            //Logging.Trace("Task " + currentTask + " acquired lock " + GetHashCode());
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public bool TryAcquire()
        {
            TaskHandle currentTask = SystemCalls.GetCurrentTask();
            if (_owner == null)
            {
                _owner = currentTask;
                return true;
            }
            else if (_owner == currentTask)
            {
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
                _owner = null;
                if (_waitingOwners.Length > 0)
                {
                    // here we call ScheduleTask instead of Unblock because we Yielded the task
                    SystemCalls.ScheduleTask(_owner = _waitingOwners.Shift());
                }
            }
            else
            {
                throw new Exception("Cannot release lock.  Current thread is not owner");
            }
        }
    }
}
