using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Diagnostics;

using XaeiOS;

namespace System.Threading
{
    // TODO: Refactor some of these methods into System.Threading.WaitHandle and EventWaitHandle

    public class ManualResetEvent
    {
        private bool _set;
        private NativeArray<TaskHandle> _waitingList;

        public ManualResetEvent()
        {
            _waitingList = new NativeArray<TaskHandle>();
            _set = false;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public void Set()
        {
            _set = true;
            Signal();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public void Reset()
        {
            _set = false;
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public void WaitOne()
        {
            if (!_set)
            {
                TaskHandle currentTask = SystemCalls.GetCurrentTask();
                _waitingList.Push(currentTask);
                //Logging.Trace("Added task " + currentTask.ID + " to the waiting list for wait handle " + GetHashCode());
                SystemCalls.BlockTask(currentTask);
                SystemCalls.Yield();
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void Signal()
        {
            for (int i = 0; i < _waitingList.Length; i++)
            {
                SystemCalls.ScheduleTask(_waitingList[i]);
                //Logging.Trace("Scheduled task " + _waitingList[i].ID + " that was on thewaiting list for wait handle " + GetHashCode());
            }
            _waitingList.Length = 0;
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public bool WaitOne(int timeoutMs)
        {
            TimedUnblocker unblocker = new TimedUnblocker
            {
                Task = SystemCalls.GetCurrentTask(),
                TimedOut = false
            };
            unblocker.ScheduleUnblock(timeoutMs);
            try
            {
                WaitOne();
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
                Logging.Trace("Unblocker::Cancel()");
                Global.ClearTimeout(TimeoutId);
                TimeoutId = null;
                Task = null;
            }
        }
    }
}
