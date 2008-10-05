using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace XaeiOS.Kernel
{
    public static class Scheduler
    {
        private static Task _externalTask;
        private static Task _kernelTask;
        private static Task _currentTask;
        private static bool _awaitingTask;
        private static var _cpuIntervalId;
        private static NativeObject _taskStatusMap;

        public const long MinTimeSlice = 2;
        public const long MaxTimeSlice = 20000;
        public const long StartingMaxTimeSlice = MaxTimeSlice / 16;
        public const long MaxRealTimeSlice = 50;
        private const long CycleAgainThreshold = MaxTimeSlice / 10;
        private const long OptimisticStackRebuildingThreshold = 10;

        public static Task CurrentTask
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _currentTask;
            }
        }

        public static Task ExternalTask
        {
            get
            {
                return _externalTask;
            }
        }

        public static bool InCriticalSection
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _inCriticalSection;
            }
        }
        private static bool _inCriticalSection;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void EnterCriticalSection()
        {
            _inCriticalSection = true;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void LeaveCriticalSection()
        {
            _inCriticalSection = false;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Initialize()
        {
            _taskStatusMap = new NativeObject();
            _inCriticalSection = false;
            _kernelTask = new Task(null, null, null, TaskPriority.Realtime, "XaeiOS.Kernel");

            // this tasks represents the external JavaScript VM
            // we create a special task for it so that we can always have a current task to refer to
            _externalTask = new Task(null, null, null, TaskPriority.Realtime, "External");
            _currentTask = _kernelTask;
        }

        // TODO: While pattern matching is not working here
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void RunCpuTimeSlice()
        {
            _currentTask = _kernelTask;
            long timeSlice = MaxTimeSlice;
            while ((timeSlice = CpuCycle(timeSlice)) > CycleAgainThreshold)
            {
            }
            _currentTask = _externalTask;
        }

        /// <summary>
        /// TODO: This method should really be written by hand.  We really want to minimize the overhead of a context switch.
        /// </summary>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static long CpuCycle(long timeSlice)
        {
            if (TaskPriorityQueue.IsEmpty())
            {
                _awaitingTask = true;
                PauseCpu();
                return 0;
            }
            Task t = TaskPriorityQueue.Remove();
            _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Running);
            if (t.InjectedException != null)
            {
                // Something wants to inject an exception into a task
                // This is used by Thread::Abort to inject a ThreadAbortException
                XaeiOSException injectedException = ((XaeiOSException)t.InjectedException);
                t.InjectedException = null;
                injectedException.ThrowContext = t.Continuation;
                //ScheduleHandleException(t, injectedException);
                HandleException(t, injectedException);
                return timeSlice - 1;
            }
            Continuation continuation = t.Continuation;
            continuation.TimeSlice = Math.Min(timeSlice, t.MaxTimeSlice);

            Frame frame = continuation.Frame;
            _currentTask = t;
            long startTime, realTimeSlice;

            //try {
            {
                GenerateStartTryBlockCode();
                startTime = new NativeDate().GetTime();
                var returnValue = frame.Function.Apply(var.Cast<object>(frame.This), var.Cast<Continuation>(continuation).Cast<var[]>());
                _currentTask = _kernelTask;
                realTimeSlice = new NativeDate() - startTime;
                if (continuation.ParentContinuation == null) // has no parent
                {
                    CleanupTask(t, returnValue, TaskExitStatus.Normal);
                }
                else
                {
                    continuation = continuation.ParentContinuation;
                    t.Continuation = continuation;
                    GenerateIfValueIsDefinedCode(returnValue);
                    continuation.ReturnValue = returnValue;
                    GenerateEndBlockCode();
                    ScheduleTaskChecked(t);
                }
            }
            var e;
            GenerateStartCatchBlockCode(out e);
            { //} catch(e) {
                _currentTask = _kernelTask;
                realTimeSlice = new NativeDate() - startTime;
                if (GenerateCheckNotContinuationCode(e))
                {
                    // an exception (either managed or native) was thrown
                    //ScheduleHandleException(t, ConvertToManagedException(e));
                    HandleException(t, ConvertToManagedException(e));
                }
                else
                {
                    // a continuation was thrown

                    continuation = e.Cast<Continuation>();
                    t.Continuation = continuation;
                    ScheduleTaskChecked(t);
                }

            } //}
            GenerateEndBlockCode();

            AdjustMaxTimeSlice(t, realTimeSlice);
            return Math.Min(continuation.TimeSlice, timeSlice) - 1;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void AdjustMaxTimeSlice(Task task, long realTimeSlice)
        {
            if (realTimeSlice > MaxRealTimeSlice)
            {
                task.MaxTimeSlice = MinTimeSlice;
                Logging.Trace("Task " + task + " ran too long: " + realTimeSlice + ".  Reset max time slice.");
            }
            else if (task.MaxTimeSlice < MaxTimeSlice)
            {
                task.MaxTimeSlice = Math.Min(task.MaxTimeSlice * 2, MaxTimeSlice);
            }
        }

        /// <summary>
        /// Pushes a new continuation onto the stack to call HandleException.
        /// 
        /// We used to walk the stack in the kernel in a preemptive way, but that could slow down all tasks.
        /// Now, each task walks the stack looking for exceptions on it's own time slice.
        /// 
        /// </summary>
        /// <param name="task"></param>
        /// <param name="exception"></param>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void ScheduleHandleException(Task task, XaeiOSException exception)
        {
            // TODO: This doesn't yet work.  Fix it
            //Logging.Trace("Scheduling exception handler for task: " + task + ".  Exception is " + exception);
            Continuation newContinuation = new Continuation();
            newContinuation.ExecutionPointer = 0;
            newContinuation.ParentContinuation = task.Continuation;
            newContinuation.Frame = new Frame(null, (NativeFunction)new HandleExceptionDelegate(BrokenHandleException));
            newContinuation.Frame.Push(var.Cast<Task>(task));
            newContinuation.Frame.Push(var.Cast<XaeiOSException>(exception));
            task.Continuation = newContinuation;
            ScheduleTaskChecked(task);
        }

        private static void BrokenHandleException(Task task, XaeiOSException exception)
        {
            // walk up stack looking for catch block

            Continuation currentContinuation = exception.ThrowContext.ParentContinuation;
            while(currentContinuation != null) {
                if (var.Cast<int>(currentContinuation.Frame.ExceptionCatchPointer).Not())
                {
                    currentContinuation = currentContinuation.ParentContinuation;
                }
                else
                {
                    break;
                }

            }

            if (currentContinuation == null)
            {
                // we didn't catch the exception
                CleanupTask(task, var.Cast<XaeiOSException>(exception), TaskExitStatus.UnhandledException);

                // by cleaning up the task, we will remove the task from the status map
                // this will indicate to ScheduleTaskChecked(...) that it should not re-schedule the task
            }
            else
            {
                // pass exception to the catching continuation
                // set the execution pointer to the exception catch pointer
                task.Continuation = currentContinuation;
                currentContinuation.ExecutionPointer = currentContinuation.Frame.ExceptionCatchPointer;
                currentContinuation.Frame.Exception = (Exception)exception;

                // when this method returns, the scheduler will reschedule this task
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void HandleException(Task task, XaeiOSException exception)
        {
            if (exception.ThrowContext == null)
            {
                // we didn't catch the exception
                CleanupTask(task, var.Cast<XaeiOSException>(exception), TaskExitStatus.CriticalError);
                return;
            }

            // walk up stack looking for catch block

            Continuation currentContinuation = exception.ThrowContext.ParentContinuation;
            GenerateStartWhileNotNullBlockCode(currentContinuation);
            { // while(parentContinuation != null) {
                if (var.Cast<int>(currentContinuation.Frame.ExceptionCatchPointer).Not())
                {
                    currentContinuation = currentContinuation.ParentContinuation;
                }
                else
                {
                    // break
                    GenerateBreakCode();
                }

            } // }
            GenerateEndBlockCode();

            if (currentContinuation == null)
            {
                // we didn't catch the exception
                CleanupTask(task, var.Cast<XaeiOSException>(exception), TaskExitStatus.UnhandledException);
            }
            else
            {
                // pass exception to the catching continuation
                // set the execution pointer to the exception catch pointer
                task.Continuation = currentContinuation;
                currentContinuation.ExecutionPointer = currentContinuation.Frame.ExceptionCatchPointer;
                currentContinuation.Frame.Exception = (Exception)exception;
                ScheduleTaskChecked(task);
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static XaeiOSException ConvertToManagedException(var e)
        {
            Exception unhandledException = e.Cast<object>() as Exception;
            if (unhandledException != null)
            {
                return (XaeiOSException)unhandledException;
            }
            return BuildManagedException(e);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static XaeiOSException BuildManagedException(var thrownObject)
        {
            // TODO: Ensure this method never throws
            Exception exception = null;
            if (thrownObject == null)
            {
                exception = new ExecutionEngineException("Caught null exception");
            }
            else if (thrownObject.InstanceOf("Error"))
            {
                string message = thrownObject.NativeToString();
                // TODO: Parse other types of errors

                // parse error and try to convert to appropriate error
                if (thrownObject.InstanceOf("ReferenceError"))
                {
                    exception = new NullReferenceException(message);
                }
                else if (thrownObject.InstanceOf("TypeError"))
                {
                    if (message.Contains("has no properties"))
                    {
                        exception = new NullReferenceException(message);
                    }
                    else if (message.Contains("Cannot read property") && message.Contains(" of null"))
                    {
                        exception = new NullReferenceException(message);
                    }
                    else
                    {
                        exception = new ExecutionEngineException(message);
                    }
                }
                else
                {
                    exception = new ExecutionEngineException(message);
                }
            }
            else
            {
                exception = new ExecutionEngineException(thrownObject.NativeToString());
            }

            /*
             * Hackily get the throw context:
             * 
             * The runtime sets the throw context as if the thrown object is a managed Exception object.
             * This means that it gets put in some field slot (currently 0 but this could change).
             * Let's hackily cast the thrown object to an Exception and retrieve the throw context
             */

            XaeiOSException xaeiOSException = (XaeiOSException)exception;
            xaeiOSException.ThrowContext = thrownObject.Cast<XaeiOSException>().ThrowContext;
            return xaeiOSException;
        }

        // TODO: The following code returns null! This is a bug in XaeiO.Compiler2:
        /*
        
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static Exception GetUnhandledException(var e)
        {
            Exception unhandledException;
            if (e.Cast<NativeObject>().ContainsKey("$"))
            {
                unhandledException = e.Cast<object>() as Exception;
            }
            else
            {
                unhandledException = null;
            }
            if (unhandledException == null)
            {
                // TODO: try to convert native errors into xaeios exceptions (e.g.: null reference)
                // for now, just wrap in an execution engine exception
                unhandledException = ExecutionEngineException.Create(e);
            }
            return unhandledException;
        }
         */

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void CleanupTask(Task t, var returnValue, TaskExitStatus exitStatus)
        {
            Logging.Trace("Cleaning up task: " + t + ".  Exit status = " + exitStatus);
            // TODO: release locks
            // TODO: release other resources (UI, etc)

            // gather task information that is cleaned up by RemoveTask
            string taskName = t.Name;

            _taskStatusMap.RemoveKey(t.Id);
            Task.RemoveTask(t);
            if (t.Callback != null)
            {
                // TODO: run in separate task so as not to block scheduler
                t.Callback(t.Id, taskName, returnValue, exitStatus);
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void StartCpu()
        {
            ClearInterval(_cpuIntervalId);
            _cpuIntervalId = SetInterval(RunCpuTimeSlice, 1);
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "setInterval({0}, {1})")]
        private static extern var SetInterval(NativeVoidDelegate f, long interval);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "clearInterval({0})")]
        public static extern void ClearInterval(var intervalId);

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void PauseCpu()
        {
            ClearInterval(_cpuIntervalId);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void ResumeCpu()
        {
            StartCpu();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Shutdown()
        {
            // TODO: send terminate signal to all tasks

            // TODO: start a high priority task to monitor when no more tasks (other than itself) are running.  it sleeps for x seconds, and then kills all processes
            // TODO: cleanup and halt
            Cleanup();
            Halt();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Cleanup()
        {
            TaskPriorityQueue.Cleanup();
            Task.Cleanup();
            _currentTask = _kernelTask;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Halt()
        {
            PauseCpu();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static int DynamicPriority(TaskPriority priority)
        {
            return ((int)priority + 1) * 1000;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void StartTask(Task t)
        {
            if (_taskStatusMap.ContainsKey(t.Id))
            {
                throw new ArgumentException("Cannot start task " + t + ".  It has already been started.");
            }
            _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Running);
            ScheduleTask(t);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void ScheduleTask(Task t)
        {
            TaskPriorityQueue.Add(t);
            _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Scheduled);
            if (_awaitingTask)
            {
                _awaitingTask = false;
                ResumeCpu();
            }
        }

        /// <summary>
        /// Schedules a task, first checking to see if the task was blocked, killed, or cleaned up.
        /// </summary>
        /// <param name="typeVtable"></param>
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void ScheduleTaskChecked(Task t)
        {
            if (_taskStatusMap.ContainsKey(t.Id))
            {
                TaskStatus status = _taskStatusMap[t.Id].Cast<TaskStatus>();
                if (status == TaskStatus.Running)
                {
                    ScheduleTask(t);
                }
                else if (status == TaskStatus.Blocked)
                {
                    // we've caught the "block signal" - now set the task as running
                    _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Running);
                    // since we won't automatically re-schedule this task, it is up to whoever blocked this task to re-schedule it
                    //Logging.Trace("Not going to schedule task " + t + " because it was blocked.  It is now running again");
                }
                else if (status == TaskStatus.Killed)
                {
                    // TODO: cleanup the task in a separate task rather than in the kernel
                    CleanupTask(t, null, TaskExitStatus.Killed);
                }
                else if (status == TaskStatus.Scheduled)
                {
                    // do nothing - this task is already scheduled to run
                }
                else
                {
                    throw new ExecutionEngineException("XaeiOS general protection error: Illegal task status - " + status.ToString());
                }
            }
            else
            {
                // do nothing - the task has been cleaned
                // this code path is hit when an unhandled exception occurs in a task and HandleException cleans up the task
                //Logging.Trace("Not going to schedule task " + t + " because it has been cleaned up.");
            }
        }

        [NativeDelegate]
        private delegate void ScheduleTaskDelegate(Task t);

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void BlockTask(Task t)
        {
            _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Blocked);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void KillTask(Task t)
        {
            TaskStatus status = _taskStatusMap[t.Id].Cast<TaskStatus>();
            if (status == TaskStatus.Blocked)
            {
                ScheduleTask(t);
                _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Killed);
            }
            else if (status != TaskStatus.Killed)
            {
                _taskStatusMap[t.Id] = var.Cast<TaskStatus>(TaskStatus.Killed);
            }
        }

        // Native code generation
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "try {")]
        private static extern void GenerateStartTryBlockCode();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "while({0} != null) {")]
        private static extern void GenerateStartWhileNotNullBlockCode(Continuation value);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "break")]
        private static extern void GenerateBreakCode();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "} catch({0}) {")]
        private static extern void GenerateStartCatchBlockCode([XaeiOSOut(false)]out var e);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "}")]
        private static extern void GenerateEndBlockCode();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "if(typeof({0}) != \"undefined\") {")]
        private static extern void GenerateIfValueIsDefinedCode(var value);

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "if({0} > {1}) {")]
        private static extern void GenerateCheckOptimisticStackRebuildingThreshold(long remainingSlice, long threshold);
        
        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "{0} == null || {0}.$")]
        private static extern bool GenerateCheckNotContinuationCode(var thrownObject);

        [NativeDelegate]
        private delegate void HandleExceptionDelegate(Task task, XaeiOSException exception);

    }

    public enum TaskStatus
    {
        Running = 0,
        Blocked = 1,

        /// <summary>
        /// Indicates that the task has been forcefully killed.
        /// The task has NOT been cleaned up at this point.
        /// The scheduler cleans up any task that has been killed.
        /// </summary>
        Killed = 2,
        Scheduled = 3
    }
}
