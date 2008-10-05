using System;
using System.Runtime.CompilerServices;

namespace XaeiOS.Kernel
{
    /// <summary>
    /// Manages task priority in order to select the next task to be scheduled.
    /// </summary>
    public static class TaskPriorityQueue
    {
        private static NativeArray<Task> _heap;
        private static int _count;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Initialize()
        {
            _heap = new NativeArray<Task>();
            _count = 0;
        }

        /// <summary>
        /// Enqueues a task to the task priority queue.
        /// </summary>
        /// <param name="typeVtable">The task to enqueue</param>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Add(Task t)
        {
            _count++;
            BubbleUp(_count - 1, t);
        }

        /// <summary>
        /// Gets the next task in the queue.
        /// </summary>
        /// <remarks>
        /// It is the caller's responsibility to check if IsEmpty
        /// </remarks>
        /// <returns>The next task in the queue</returns>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static Task Remove()
        {
            Task task = _heap[0];
            _count--;
            TrickleDown(0, _heap[_count]);
            return task;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void TrickleDown(int index, Task t)
        {
            int child = (index * 2) + 1;
            while (child < _count)
            {
                if (((child + 1) < _count) &&
                    (_heap[child].Priority < _heap[child + 1].Priority))
                {
                    child++;
                }
                _heap[index] = _heap[child];
                index = child;
                child = (index * 2) + 1;
            }
            BubbleUp(index, t);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void BubbleUp(int index, Task t)
        {
            int parent = (int)Math.Floor((index - 1) / 2);
            // note: index > 0 means there is a parent
            while ((index > 0) && (_heap[parent].Priority < t.Priority))
            {
                _heap[index] = _heap[parent];
                index = parent;
                parent = (int)Math.Floor((index - 1) / 2);
            }
            _heap[index] = t;
        }

        /// <summary>
        /// Checks whether the task priority queue is empty.
        /// </summary>
        /// <returns>True if there are no tasks queued, false otherwise.</returns>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static bool IsEmpty()
        {
            return _count == 0;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Cleanup()
        {
            _count = 0;
            _heap = null;
        }
    }
}