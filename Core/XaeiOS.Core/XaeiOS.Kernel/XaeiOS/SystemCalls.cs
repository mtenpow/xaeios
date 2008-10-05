using System;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Diagnostics;
using System.Reflection;

using XaeiOS.Kernel;

namespace XaeiOS
{
    public static class SystemCalls
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static Task GetTask(TaskHandle task)
        {
            Task t = Task.GetTaskById(var.Cast<TaskHandle, int>(task));
            if (t == null)
            {
                throw new Exception("Task with " + task + " does not exist.");
            }
            return t;
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void InitializeKernel()
        {
            Task.Initialize();
            Continuation.Initialize();
            TaskPriorityQueue.Initialize();
            Scheduler.Initialize();
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void StartKernel()
        {
            Scheduler.StartCpu();
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void StartTask(TaskHandle task)
        {
            Scheduler.StartTask(GetTask(task));
        }

        // TODO: Compiler should ensure that calling convention of a SystemCall as exposed in OSCorlib matches the calling convention defined in Kernel
        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void ScheduleTask(TaskHandle task)
        {
            Scheduler.ScheduleTaskChecked(GetTask(task));
        }

        /// <summary>
        /// Blocks the specified task.
        /// If a task becomes, the kernel will not schedule that task the next time ScheduleTask(t) is called.
        /// After this scheduling is bypasses, the task becomes unblocked.  It is up to caller of BlockTask(...)
        /// to schedule the task at a later time.
        /// </summary>
        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void BlockTask(TaskHandle task)
        {
            Scheduler.BlockTask(GetTask(task));
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.CompilerImpl)]
        public static extern void Yield();

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void KillTask(TaskHandle task)
        {
            Scheduler.KillTask(GetTask(task));
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static TaskHandle GetCurrentTask()
        {
            return var.Cast<int>(Scheduler.CurrentTask.Id).Cast<TaskHandle>();
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static TaskHandle GetExternalTask()
        {
            return var.Cast<int>(Scheduler.ExternalTask.Id).Cast<TaskHandle>();
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static TaskHandle CreateTask(object self, TaskFunction fn, TaskCallback Callback, TaskPriority priority, string name)
        {
            Task t = new Task(self, fn, Callback, priority, name);
            return var.Cast<int, TaskHandle>(t.Id);
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.CriticalSection)]
        public static string GetStackTrace(Exception exception)
        {
            XaeiOSException xaeiosException = (XaeiOSException)exception;
            Continuation continuation = xaeiosException.ThrowContext;
            // TODO: Create StackWalker framework
            NativeArray<string> buffer = new NativeArray<string>();
            while (continuation != null)
            {
                buffer.Push("at ");
                string methodName = RuntimeHelpers.GetMethodNameForStackTrace(continuation.Frame.Function);
                if (methodName == null)
                {
                    methodName = "[External Code]"; // TODO: Provide something more descriptive.  Maybe a code pointer?
                }
                buffer.Push(methodName);
                // TODO: Debug symbols should put C# line numbers here, rather than xaeios execution pointers
                // TODO: These execution pointers are wrong!!!, the execution pointer is set to the next execution pointer at the BEGINNING of the current execution block
                buffer.Push(":");
                buffer.Push((continuation.ExecutionPointer).ToString());
                buffer.Push("\n");
                continuation = continuation.ParentContinuation;
            }
            return buffer.Join("");
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void InjectException(TaskHandle task, Exception exception)
        {
            GetTask(task).InjectedException = (XaeiOSException)exception;
        }

        [SystemCall]
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void InvalidExecutionPointer()
        {
            throw new NativeError("Invalid execution pointer");
        }
    }
}