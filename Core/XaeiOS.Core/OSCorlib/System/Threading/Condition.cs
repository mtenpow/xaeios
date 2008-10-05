using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

using XaeiOS;

// TODO: stop using unsafe native data structures.  use queue in condition and lock.

namespace System.Threading
{
	public class Condition
	{
        private Lock _lock;
        private NativeArray<TaskHandle> _waitingList;
        
        public Condition(Lock l)
        {
            _lock = l;
            _waitingList = new NativeArray<TaskHandle>();
        }

        public void Signal()
        {
            _lock.Acquire();
            if (_waitingList.Length > 0)
            {
                XaeiOS.SystemCalls.ScheduleTask(_waitingList.Shift());
            }
            _lock.Release();
        }

        public void Await()
        {
            _lock.Release();
            TaskHandle task = XaeiOS.SystemCalls.GetCurrentTask();
            _waitingList.Push(task);
            XaeiOS.SystemCalls.BlockTask(task);
            XaeiOS.SystemCalls.Yield();
            _lock.Acquire();
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public bool Await(int timeoutMs)
        {
            TimedUnblocker unblocker = new TimedUnblocker
            {
                Task = SystemCalls.GetCurrentTask(),
                TimedOut = false
            };
            unblocker.ScheduleUnblock(timeoutMs);
            try
            {
                Await();
            }
            finally
            {
                unblocker.Cancel();
            }
            return !unblocker.TimedOut;
        }

        private class TimedUnblocker
        {
            public TaskHandle Task;
            public var TimeoutId;
            public bool TimedOut;

            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public void Unblock()
            {
                if (TimeoutId != null)
                {
                    TimedOut = true;
                    XaeiOS.SystemCalls.ScheduleTask(Task);
                }
            }

            public void ScheduleUnblock(int timeoutMs)
            {
                TimeoutId = Global.SetTimeout((NativeFunction)new NativeVoidDelegate(Unblock), timeoutMs);
            }

            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            public void Cancel()
            {
                Global.ClearTimeout(TimeoutId);
            }
        }
	}

    public class ConditionTimedOutException : Exception
    {
        public ConditionTimedOutException()
        {
        }
    }
}
