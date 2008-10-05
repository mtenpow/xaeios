using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace XaeiOS.Kernel
{
    public class Task
    {
        private static NativeObject IdMap;
        private static NativeObject NameMap;
        private static int _idCounter;

        public static int TaskCount
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return _taskCount;
            }
        }
        private static int _taskCount;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static Task GetTaskById(int id)
        {
            if (!IdMap.ContainsKey(id))
            {
                return null;
            }
            return IdMap[id].Cast<Task>();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Initialize()
        {
            _idCounter = 1;
            _taskCount = 0;
            IdMap = new NativeObject();
            NameMap = new NativeObject();
        }

        public Continuation Continuation;
        public object This;
        public TaskFunction Function;
        public int Id;
        public TaskCallback Callback;
        public int Priority;
        public XaeiOSException InjectedException;
        public long MaxTimeSlice;

        public String Name
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return NameMap[Id].Cast<string>();
            }
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private Task(object self, TaskFunction function, TaskCallback callback, TaskPriority priority, string name, int id)
        {
            Continuation = Continuation.Create(self, var.Cast<TaskFunction>(function).Cast<NativeFunction>());
            This = self;
            Function = function;
            Callback = callback;
            Priority = Scheduler.DynamicPriority(priority);
            Id = id;
            InjectedException = null;
            MaxTimeSlice = Scheduler.StartingMaxTimeSlice;
            NameMap[id] = var.Cast<string>(name);
            IdMap[id] = var.Cast<Task>(this);
            _taskCount++;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Task(object self, TaskFunction function, TaskCallback callback, TaskPriority priority, string name)
            : this(self, function, callback, priority, name, _idCounter++)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Task(object self, TaskFunction function, TaskCallback callback, TaskPriority priority)
            : this(self, function, callback, priority, "anonymous" + _idCounter.ToString(), _idCounter++)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Task(object self, TaskFunction function, TaskCallback callback)
            : this(self, function, callback, TaskPriority.Normal)
        {
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public Task(object self, TaskFunction function)
            : this(self, function, null)
        {
        }

        public override int GetHashCode()
        {
            return Id;
        }

        public override string ToString()
        {
            return Name;
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void RemoveTask(Task t)
        {
            _taskCount--;
            NameMap.RemoveKey(t.Id);
            IdMap.RemoveKey(t.Id);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Cleanup()
        {
            NameMap = null;
            IdMap = null;
            _taskCount = 0;
        }
    }

    [NativeDelegate]
    public delegate void TaskCallback(int taskId, string taskName, var returnValue, TaskExitStatus exitStatus);

    [NativeDelegate]
    public delegate void TaskFunction();

    public enum TaskExitStatus
    {
        Normal = 0,
        UnhandledException = 1,
        Killed = 2,
        CriticalError = 3
    }

    public enum TaskPriority
    {
        Background = 1,
        Low = 2,
        Normal = 3,
        High = 4,
        Realtime = 5
    }
}