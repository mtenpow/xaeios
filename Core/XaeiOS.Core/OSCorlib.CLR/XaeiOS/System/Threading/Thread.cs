/*using System;
using System.Collections.Generic;

namespace XaeiOS.System.Threading
{
    [CLRConjugate("XaeiOS.System.Threading.Thread")]
    public sealed class Thread
    {
        internal int _taskId;
        internal SIP _sip;
        private ThreadStart _threadStart;
        private ParametizedThreadStart _parametizedThreadStart;
        private ThreadPriority _priority;
        private bool _blocked;
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
            get
            {
                return _callback;
            }
            set
            {
                _callback = value;
            }
        }
        private ThreadCallback _callback;

        private string _name;
        public string Name
        {
            get { return _name; }
            set
            {
                // TODO: Update task name if thread is already started
                _name = value;
            }
        }

        public bool IsBackground
        {
            get
            {
                return _isBackground;
            }
            set
            {
                _isBackground = value;
                throw new NotImplementedException();
            }
        }
        private bool _isBackground;

        public Thread(ThreadStart threadStart) : this(threadStart, ThreadPriority.Normal)
        {
        }

        public Thread(ThreadStart threadStart, ThreadPriority priority)
        {
            _threadStart = threadStart;
            _priority = priority;
        }
        public Thread(ParametizedThreadStart threadStart, ThreadPriority priority)
        {
            _parametizedThreadStart = threadStart;
            _priority = priority;
        }

        public void Start()
        {
            if (_threadStart == null)
            {
                throw new NotSupportedException("The thread start delegate was parametized.  Cannot start this thread without a parameter.");
            }
            if (_name == null)
            {
                _name = "Thread: anonymous " + new NativeDate().GetTime().ToString();
            }
            _taskId = SystemCalls.CreateTask(null, new TaskFunction(_threadStart), new TaskCallback(this.InternalCallback), (TaskPriority)_priority, _name);
            Logging.Log("Creating thread " + _name + " with task id: " + _taskId.ToString());
            ThreadManager.RegisterThread(this);
            _running = true;
            SystemCalls.ScheduleTask(_taskId);
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
            _parameter = parameter;
            _taskId = SystemCalls.CreateTask(null, ParametizedTaskFunction, new TaskCallback(this.InternalCallback), (TaskPriority)_priority, _name);
            Logging.Log("Creating thread " + _name + " with task id: " + _taskId.ToString());
            ThreadManager.RegisterThread(this);
            _running = true;
            SystemCalls.ScheduleTask(_taskId);
        }

        public void Abort()
        {
            Abort(null);
        }

        public void Abort(object stateInfo)
        {
            throw new NotImplementedException();
        }

        private void ParametizedTaskFunction()
        {
            _parametizedThreadStart(_parameter);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void InternalCallback(int taskId, string taskName, var returnValue, TaskExitStatus exitStatus)
        {
            Logging.Log("Thread internal callback: " + taskId.ToString() + ":" + taskName);
            _running = false;
            ThreadManager.UnregisterThread(this);
            if (_callback != null)
            {
                // TODO: Start callback in a system background thread from the thread pool

                if (exitStatus == TaskExitStatus.UnhandledException)
                {
                    _unhandledException = returnValue.Cast<Object>() as Exception;
                }
                else if (exitStatus == TaskExitStatus.CriticalError)
                {
                    _unhandledException = new ExecutionEngineException(returnValue.NativeToString());
                }

                // for now, just use a separate task
                Logging.Log("Creating a separate task for thread callback method");
                int callbackTaskId = SystemCalls.CreateTask(null, new TaskFunction(_callback), null, TaskPriority.Background, "Thread callback");
                SystemCalls.ScheduleTask(callbackTaskId);
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void InternalSleep(int milliseconds)
        {
            if (_blocked)
            {
                Global.ClearTimeout(_unblockTimeoutId);
                _unblockTimeoutId = Global.SetTimeout((NativeFunction)new VoidDelegate(WakeUp), milliseconds);
            }
            else
            {
                SystemCalls.BlockTask(_taskId);
                _unblockTimeoutId = Global.SetTimeout((NativeFunction)new VoidDelegate(WakeUp), milliseconds);
                _blocked = true;
                _running = false;
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void InternalSleep()
        {
            if (_blocked)
            {
                Global.ClearTimeout(_unblockTimeoutId);
            }
            else
            {
                SystemCalls.BlockTask(_taskId);
                _blocked = true;
                _running = false;
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private void WakeUp()
        {
            if (!_blocked)
            {
                throw new Exception("Illegal thread state.  Cannot unblock a thread that is not blocked.");
            }
            _blocked = false;
            _running = true;
            SystemCalls.ScheduleTask(_taskId);
        }

        // TODO: In xaeios backend, nonpreemptive methods may not override preemptive ones and vice-versa
        // TODO: in xaeios backend, non-preemptive methods may call preemptive methods by using a critical section-like mechanism
        public override string ToString()
        {
            return _taskId + ": " + _name;
        }

        #region static methods
        public static void Sleep(int milliseconds)
        {
            ThreadManager.CurrentThread.InternalSleep(milliseconds);
            SystemCalls.Yield();
        }
        public static void Sleep()
        {
            ThreadManager.CurrentThread.InternalSleep();
            SystemCalls.Yield();
        }
        #endregion

        #region Thread pool

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void ExecuteAsync(ThreadStart threadStart)
        {
            int task = SystemCalls.CreateTask(null, new TaskFunction(threadStart), null, TaskPriority.Normal, "Thread pool thread");
            SystemCalls.ScheduleTask(task);
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
*/