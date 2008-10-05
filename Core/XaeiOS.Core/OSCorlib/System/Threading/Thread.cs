using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Diagnostics;

using XaeiOS;
using XaeiOS.Process;

namespace System.Threading
{
    [CLRConjugate("XaeiOS.System.Threading.Thread")]
    public sealed class Thread
    {
        private static int _idCounter;

        public TaskHandle Task
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get;
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            private set;
        }

        public SIP SIP
        {
            get
            {
                return _sip;
            }
        }
        private SIP _sip;

        private ThreadStart _threadStart;
        private ParametizedThreadStart _parametizedThreadStart;

        public ThreadPriority Priority
        {
            get
            {
                return _priority;
            }
        }
        private ThreadPriority _priority;

        private bool _running;
        private var _unblockTimeoutId;
        private object _parameter;

        public Exception UnhandledException
        {
            get
            {
                return _unhandledException;
            }
        }
        private Exception _unhandledException;

        public ThreadCallback Callback
        {
            get;
            set;
        }

        public string Name
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get { return _name; }
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            set
            {
                // TODO: Update task name if thread is already started
                _name = value;
            }
        }
        private string _name;

        public bool IsBackground
        {
            get
            {
                return _isBackground;
            }
            set
            {
                _isBackground = value;
                // TODO: change task priority
            }
        }
        private bool _isBackground;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal static Thread CreateSystemThread(ThreadPriority priority, SIP sip, TaskHandle kernelTask, string name)
        {
            Thread kernelThread = new Thread();
            kernelThread.Task = kernelTask;
            kernelThread._priority = priority;
            kernelThread._sip = sip;
            kernelThread._name = name;
            return kernelThread;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private Thread()
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Thread(ThreadStart threadStart)
            : this(threadStart, ThreadPriority.Normal)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Thread(ThreadStart threadStart, ThreadPriority priority)
            : this(threadStart, priority, null)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal Thread(ThreadStart threadStart, ThreadPriority priority, SIP sip)
            : this(threadStart, priority, sip, null)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        internal Thread(ThreadStart threadStart, ThreadPriority priority, SIP sip, TaskHandle task)
        {
            Task = task;
            _threadStart = threadStart;
            _priority = priority;
            _sip = sip;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Thread(ParametizedThreadStart threadStart, ThreadPriority priority)
        {
            Task = null;
            _parametizedThreadStart = threadStart;
            _priority = priority;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public void Start()
        {
            if (_threadStart == null)
            {
                throw new NotSupportedException("The thread start delegate was parametized.  Cannot start this thread without a parameter.");
            }
            if (_name == null)
            {
                _name = "[anonymous " + (_idCounter++) + "]";
            }
            if (_sip == null)
            {
                _sip = SIP.CurrentSIP;
            }
            // TODO: No code should be run with an infinite time slice, a critical section should mean that only the kernel can interrupt
            Task = SystemCalls.CreateTask(null, new TaskFunction(_threadStart), new TaskCallback(this.InternalCallback), (TaskPriority)_priority, _name);
            //Logging.Debug("Thread " + _name + " is a child of " + _sip + ".  Task: " + Task.ToString());
            ThreadManager.RegisterThread(this);
            _sip.InitializeThread(this);
            _running = true;
            SystemCalls.StartTask(Task);
        }

        public void Start(object parameter)
        {
            if (_parametizedThreadStart == null)
            {
                throw new NotSupportedException("The thread start delegate was not parametized.  Cannot start this thread with a parameter.");
            }
            if (_name == null)
            {
                _name = "Thread: anonymous";
            }
            if (_sip == null)
            {
                _sip = SIP.CurrentSIP;
            }
            _parameter = parameter;
            Task = SystemCalls.CreateTask(null, ParametizedTaskFunction, new TaskCallback(this.InternalCallback), (TaskPriority)_priority, _name);
            //Logging.Trace("Creating thread " + _name + " with task id: " + Task);
            ThreadManager.RegisterThread(this);
            _sip.InitializeThread(this);
            _running = true;
            SystemCalls.StartTask(Task);
        }

        public void Abort()
        {
            Abort(null);
        }

        public void Abort(object exceptionState)
        {
            //Logging.Trace("Trying to abort task: " + Name);
            if (!_running)
            {
                throw new NotSupportedException("Cannot abort a thread that is not running.");
            }
            Logging.Trace("Aborting task: " + Task);
            SystemCalls.InjectException(Task, new ThreadAbortException(exceptionState));

            // even though we have no idea whether the task is blocked or not, ScheduleTask is safe to call
            // it ensures that the same task is not scheduled twice
            SystemCalls.ScheduleTask(Task);
        }

        private void ParametizedTaskFunction()
        {
            _parametizedThreadStart(_parameter);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void InternalCallback(TaskHandle task, string taskName, var returnValue, TaskExitStatus exitStatus)
        {
            //Logging.Trace("Thread internal callback: " + this + ":" + this.Name);
            _running = false;
            //Logging.Trace("Unregistering thread: " + this + ":" + this.Name);
            ThreadManager.UnregisterThread(this);

            if (exitStatus == TaskExitStatus.UnhandledException)
            {
                _unhandledException = returnValue.Cast<Object>() as Exception;
            }
            else if (exitStatus == TaskExitStatus.CriticalError)
            {
                _unhandledException = new ExecutionEngineException(returnValue.NativeToString());
            }

            if (Callback != null)
            {
                // TODO: Use the SIP thread pool to run this callback
                Callback();
            }
            else
            {
                if (_unhandledException != null)
                {
                    Console.WriteLine("An unhandled exception occurred in thread: " + this + ": " + _unhandledException + "\n" + _unhandledException.StackTrace);
                }
            }
        }

        private void InternalSleep(int milliseconds)
        {
            CancelUnblock();
            SystemCalls.BlockTask(Task);
            _unblockTimeoutId = Global.SetTimeout((NativeFunction)new NativeVoidDelegate(WakeUp), milliseconds);
            SystemCalls.Yield();
        }

        private void InternalSleep()
        {
            CancelUnblock();
            SystemCalls.BlockTask(Task);
            SystemCalls.Yield();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void CancelUnblock()
        {
            Global.ClearTimeout(_unblockTimeoutId);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void WakeUp()
        {
            CancelUnblock();
            SystemCalls.ScheduleTask(Task);
        }

        // TODO: In xaeios backend, nonpreemptive methods may not override preemptive ones and vice-versa
        // TODO: in xaeios backend, non-preemptive methods may call preemptive methods by using a critical section-like mechanism
        public override string ToString()
        {
            return Task + ": " + _name;
        }

        #region Static methods
        public static Thread CurrentThread
        {
            get
            {
                return ThreadManager.CurrentThread;
            }
        }
        public static void Sleep(int milliseconds)
        {
            Thread thread = ThreadManager.CurrentThread;
            try
            {
                thread.InternalSleep(milliseconds);
            }
            finally
            {
                thread.CancelUnblock();
            }
        }
        public static void Sleep()
        {
            Thread thread = ThreadManager.CurrentThread;
            try
            {
                thread.InternalSleep();
            }
            finally
            {
                thread.CancelUnblock();
            }
        }
        public static Thread[] GetThreads()
        {
            return ThreadManager.GetThreads();
        }
        internal static void Initialize()
        {
            _idCounter = 1;
        }
        #endregion
    }

    // TODO: ThreadCallback should pass an exception
    public delegate void ThreadCallback();
    public delegate void ThreadStart();
    public delegate void ParametizedThreadStart(object arg);
    public enum ThreadPriority
    {
        Background = 1,
        Low = 2,
        Normal = 3,
        High = 4,
        Realtime = 5
    }
}
