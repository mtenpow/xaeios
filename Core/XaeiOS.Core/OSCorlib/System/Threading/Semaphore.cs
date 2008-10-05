using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Diagnostics;

using XaeiOS;

namespace System.Threading
{
    // TODO: Write a sempahore test
    // TODO: Maybe locks and semaphores should only deal with threads rather than tasks
    // TODO: Support structs in XaeiOS Compiler.  They just need to be copied during assignments and passed by value.  They also don't need a vtable.  This requires implement box and unbox.
    // TODO: More fine grained
    public class Semaphore
    {
        private int _resources;
        private int _totalResources;
        private NativeArray<WaitingTask> _waitingTasks;

        public Semaphore(int resources)
        {
            if (resources < 1)
            {
                throw new ArgumentException("Must have at least 1 resource for a semaphore");
            }
            _totalResources = _resources = resources;
            _waitingTasks = new NativeArray<WaitingTask>();
        }

        public void Acquire()
        {
            Acquire(1);
        }

        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public void Acquire(int resources)
        {
            //Logging.Debug("Task " + SystemCalls.GetCurrentTaskId() + " acquiring " + resources + " resources");
            if (resources < 0)
            {
                throw new ArgumentException("Cannot acquire a negative number of resources");
            }
            int delta = _resources - resources;
            if (delta < 0)
            {
                _resources = 0;
                TaskHandle currentTask = SystemCalls.GetCurrentTask();
                _waitingTasks.Push(new WaitingTask(currentTask, -delta));
                SystemCalls.BlockTask(currentTask);
                SystemCalls.Yield();

                // as of this point, this thread has successfully acquired all resources it requested
            }
            else
            {
                _resources = delta;
            }
        }

        public void Release()
        {
            Release(1);
        }

        // TODO: What happens if an exception is thrown by a critical section method and then caught by a a non-critical section method? I think __end__ will continue to be infinity. uh oh
        [XaeiOSMethodImpl(MethodImplOptions.CriticalSection)]
        public void Release(int resources)
        {
            //Logging.Debug("Task " + SystemCalls.GetCurrentTaskId() + " releasing " + resources + " resources");
            if (resources < 0)
            {
                throw new ArgumentException("Cannot release a negative number of resources");
            }
            if (resources + _resources > _totalResources)
            {
                throw new ArgumentException("Cannot release more resources this semaphore holds");
            }
            if (_waitingTasks.Length > 0) // anybody waiting for resources?
            {
                // yep, some threads are waiting
                do
                {
                    WaitingTask next = _waitingTasks[0];
                    if (next.Resources <= resources)
                    {
                        // this task can be unblocked because it was waiting for less resources than we just acquired
                        _waitingTasks.Shift();
                        resources -= next.Resources;
                        SystemCalls.ScheduleTask(next.Task); // here we call ScheduleTask instead of Unblock because we Yielded the task
                        continue; // let's try to wake up some more tasks
                    }
                    else
                    {
                        // still not enough resources to wake this thread up
                        // but it has acquired some more of the resources it requested
                        next.Resources -= resources;
                        return; // we can't wake any more tasks up
                    }
                } while (_waitingTasks.Length > 0);
            }
            else
            {
                // nobody waiting for resources, give them back to this semaphore
                _resources += resources;
            }
        }

        private class WaitingTask
        {
            public TaskHandle Task;
            public int Resources;

            public WaitingTask(TaskHandle task, int resources)
            {
                Task = task;
                Resources = resources;
            }
        }
    }
}
