using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.IO;
using System.Resources;
using System.Security;
using System.Security.Principal;

using XaeiOS;
using XaeiOS.DataStructures;
using XaeiOS.Process;

namespace XaeiOS
{
    public sealed class SIP
    {
        private Thread _startThread;
        private DoublyLinkedList<Thread> _threads = new DoublyLinkedList<Thread>();
        private SIP _parent;
        private DoublyLinkedList<SIP> _children = new DoublyLinkedList<SIP>();
        private SIPState _state = SIPState.NotStarted;
        private List<IPrincipal> _principals = new List<IPrincipal>();

        public int PID
        {
            get
            {
                return _pid;
            }
            internal set
            {
                _pid = value;
            }
        }
        private int _pid = -1;

        public string Name
        {
            get
            {
                return _name;
            }
        }
        private string _name;

        public bool IsDaemon
        {
            get;
            private set;
        }

        public event SignalHandler QuitSignal
        {
            add
            {
                lock (SyncRoot)
                {
                    _quitSignal += value;
                }
            }
            remove
            {
                lock (SyncRoot)
                {
                    _quitSignal -= value;
                }
            }
        }
        private event SignalHandler _quitSignal;

        public event CustomSignalHandler CustomSignal
        {
            add
            {
                lock (SyncRoot)
                {
                    _customSignal += value;
                }
            }
            remove
            {
                lock (SyncRoot)
                {
                    _customSignal -= value;
                }
            }
        }
        private event CustomSignalHandler _customSignal;
        public event EventHandler Exiting
        {
            add
            {
                lock (SyncRoot)
                {
                    _exiting += value;
                }
            }
            remove
            {
                lock (SyncRoot)
                {
                    _exiting -= value;
                }
            }
        }
        private event EventHandler _exiting;

        public event EventHandler Exited
        {
            add
            {
                lock (SyncRoot)
                {
                    _exited += value;
                }
            }
            remove
            {
                lock (SyncRoot)
                {
                    _exited -= value;
                }
            }
        }
        private event EventHandler _exited;

        // TODO: Synchronized Output and Error getters and setters
        internal TextWriter Output
        {
            get;
            set;
        }

        internal TextWriter Error
        {
            get;
            set;
        }

        public object SyncRoot
        {
            get;
            private set;
        }

        private SIP(string name, bool isDaemon)
        {
            SyncRoot = new Object();
            _name = name;
            IsDaemon = isDaemon;
        }

        public SIP(ThreadStart threadStart, ThreadPriority priority, string name)
            : this(threadStart, priority, name, false)
        {
        }

        // TODO: This method should be internal, all processes should be loaded from an image
        // for now, allow anybody to create a SIP
        public SIP(ThreadStart threadStart, ThreadPriority priority, string name, bool isDaemon)
            : this(name, isDaemon)
        {
            if (threadStart == null)
            {
                throw new ArgumentException("threadStart cannot be null");
            }
            Thread thread = new Thread(threadStart, priority, this);
            thread.Name = name;
            _startThread = thread;
        }

        public void Start()
        {
            Start(false);
        }

        internal void Start(bool makeChildOfCurrentSIP)
        {
            // TODO: Nothing here is synchronized!!! Need C# lock construct!!!
            if (_state != SIPState.NotStarted)
            {
                throw new NotSupportedException("SIP already started");
            }

            SIPManager.RegisterSIP(this);

            // the init process has no parent
            if (!makeChildOfCurrentSIP)
            {
                CurrentSIP.AddChild(this);
            }

            // setup input/output/error
            if (Output == null)
            {
                Output = new ConsoleTextWriter();
            }
            if (Error == null)
            {
                Error = new ConsoleTextWriter();
            }

            ResourceManager.RegisterSIP(this);
            _startThread.Start();
            _state = SIPState.Running;
        }

        internal void HandleSignal(Signal signal, int data)
        {
            lock (SyncRoot)
            {
                if (signal == Signal.Kill)
                {
                    Kill();
                }
                else if (signal == Signal.Quit)
                {
                    if (_quitSignal != null)
                    {
                        _quitSignal(signal, data);
                    }
                    else
                    {
                        Quit();
                    }
                }
                else if (signal == Signal.Custom)
                {
                    if (_customSignal != null)
                    {
                        _customSignal(data);
                    }
                }
            }
        }

        internal void AddPrincipal(IPrincipal principal)
        {
            lock (SyncRoot)
            {
                _principals.Add(principal);
            }
        }

        internal List<IPrincipal> GetPrincipals()
        {
            // TODO: make this thread safe
            return _principals;
        }

        public override int GetHashCode()
        {
            return _pid;
        }

        public override string ToString()
        {
            return _pid + ": " + _name;
        }

        public override bool Equals(object o)
        {
            SIP sip = o as SIP;
            if (sip == null)
            {
                return false;
            }
            else
            {
                return sip._pid == _pid;
            }
        }

        private void AddChild(SIP child)
        {
            if (child._parent != null)
            {
                throw new ExecutionEngineException("SIP already had a parent");
            }
            Logging.Debug("Process " + child + " is a child of process " + this);
            _children.Add(child);
            child._parent = this;
        }

        internal void InitializeThread(Thread thread)
        {
            _threads.Add(thread);
            thread.Callback = delegate()
            {
                ThreadExited(thread);
            };
        }

        private void ThreadExited(Thread thread)
        {
            if (thread.UnhandledException != null)
            {
                Console.WriteLine("An unhandled exception occurred in thread: " + thread + ": " + thread.UnhandledException + "\n" + thread.UnhandledException.StackTrace);
                // TODO: What happens in the case of an unhandled exception should be configurable
            }
            //Logging.Debug("Thread " + thread.Name + " exited");
            //Logging.Debug("Removing thread " + thread.Name + " from thread list");
            _threads.Remove(thread);
            //Logging.Debug("Thread " + thread.Name + " removed from thread list");
            TryExit();
        }

        private void ChildExited(SIP child)
        {
            Logging.Debug("Child process " + child + " exited");
            _children.Remove(child);
            TryExit();
        }

        /// <summary>
        /// Tries to exit the process.
        /// This can only happen if all non-daemon threads and all child SIPs have exited.
        /// </summary>
        private void TryExit()
        {
            lock (SyncRoot)
            {
                Logging.Debug("Process " + this + " trying to exit");

                if (!IsDaemon)
                {
                    // check whether we have any processes
                    if (_children.Count == 0)
                    {
                        if (_threads.Count == 0)
                        {
                            // no threads at all, OK to exit
                            Exit();
                        }
                        else
                        {
                            // check whether we have any non-background threads running
                            DoublyLinkedListItem<Thread> current = _threads.Head;
                            while (current != null)
                            {
                                if (!current.Data.IsBackground)
                                {
                                    // found a non-background thread, cannot exit
                                    Logging.Trace("Process " + this + " cannot exit because it " + _threads.Count + " has running, non-background threads.  One is: " + current.Data);
                                    return;
                                }
                                current = current.Next;
                            }

                            // all threads are background threads, OK to exit
                            Exit();
                        }
                    }
                    else
                    {
                        Logging.Trace("Process " + this + " cannot exit because it has " + _children.Count + " child processes running");
                    }
                }
                else
                {
                    Logging.Trace("Process " + this + " cannot exit because it is a daemon process");
                }
            }
        }

        // TODO: Turn this into a unit test in XaeiOS.TestSuite
        private void TryExit3()
        {
            lock (SyncRoot)
            {
                if (_children.Count == 0)
                {
                    Logging.Debug("1");
                }
                else
                {
                    Logging.Debug("2");
                }
            }
        }

        private void Exit()
        {
            lock (SyncRoot)
            {
                Logging.Debug("Process " + this + " exiting");
                _state = SIPState.Exiting;

                if (_exiting != null)
                {
                    Logging.Debug("Firing SIP exiting event: " + this);
                    _exiting(this, new EventArgs());
                }

                ResourceManager.CleanupAndUnregisterSIP(this);
                SIPManager.UnregisterSIP(this);

                _state = SIPState.Exited;

                if (_exited != null)
                {
                    Logging.Debug("Firing SIP exited event: " + this);
                    _exited(this, new EventArgs());
                }

                if (_parent != null)
                {
                    _parent.ChildExited(this);
                }
            }
        }

        private void Quit()
        {
            // TODO: Gracefully quit all tasks and cleanup all threads
            Exit();
        }

        private void Kill()
        {
            // TODO: Kill all tasks and cleanup all threads
            Exit();
        }

        #region Static methods

        // TODO: InvokeSIP
        public static SIP InvokeSIP(string directoryPath)
        {
            throw new NotImplementedException();
        }

        internal static SIP CreateSystemSIP(string name)
        {
            SIP sip = new SIP(name, true);
            sip.SyncRoot = new object();
            sip.Output = new ConsoleTextWriter();
            sip.Error = new ConsoleTextWriter();
            sip._state = SIPState.Running;
            return sip;
        }

        public static SIP CurrentSIP
        {
            [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
            get
            {
                return ThreadManager.CurrentThread.SIP;
            }
        }

        public static SIP[] GetSIPs()
        {
            return SIPManager.GetSIPs();
        }
        #endregion

        private class ConsoleTextWriter : TextWriter
        {
            public override void Write(string s)
            {
                ConsoleWrite(s);
            }

            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "ConsoleWrite({0})")]
            private static extern void ConsoleWrite(string s);
        }
    }
}