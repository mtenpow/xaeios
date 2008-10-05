using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace XaeiOS
{
    [Dummy]
	internal static class SystemCalls
    {
        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void InitializeKernel();

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void StartKernel();

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void StartTask(TaskHandle task);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void ScheduleTask(TaskHandle task);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall)]
        public static extern void Yield();

        /// <summary>
        /// Blocks the specified task.
        /// If a task becomes, the kernel will not schedule that task the next time ScheduleTask(t) is called.
        /// After this scheduling is bypasses, the task becomes unblocked.  It is up to caller of BlockTask(...)
        /// to schedule the task at a later time.
        /// </summary>
        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void BlockTask(TaskHandle task);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void KillTask(TaskHandle task);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern TaskHandle GetCurrentTask();

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern TaskHandle GetExternalTask();

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern TaskHandle CreateTask(object self, TaskFunction fn, TaskCallback Callback, TaskPriority priority, string name);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern string GetStackTrace(Exception exception);

        [XaeiOSMethodImpl(MethodImplOptions.SystemCall | MethodImplOptions.NonPreemptive)]
        public static extern void InjectException(TaskHandle task, Exception exception);
    }

    [NativeDelegate]
    internal delegate void TaskCallback(TaskHandle task, string taskName, var returnValue, TaskExitStatus exitStatus);

    [NativeDelegate]
    internal delegate void TaskFunction();

    internal enum TaskPriority
    {
        Background = 1,
        Low = 2,
        Normal = 3,
        High = 4,
        Realtime = 5
    }

    internal enum TaskExitStatus
    {
        Normal = 0,
        UnhandledException = 1,
        Killed = 2,
        CriticalError = 3
    }
}
