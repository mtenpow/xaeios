using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;
using System.Diagnostics;
using System.Resources;

using XaeiOS.Process;
using XaeiOS.Security;

namespace XaeiOS.Boot
{
    public static class BootManager
    {
        private static bool _booting;
        private static bool _booted;
        private static NativeFunction _initFunction;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Boot(NativeFunction initFunction)
        {
            if (_booting)
            {
                throw new NativeError("XaeiOS already booting.");
            }
            if (_booted)
            {
                throw new NativeError("XaeiOS already booted.");
            }
            if (initFunction == null)
            {
                throw new NativeError("Cannot boot with null init function.");
            }
            _booting = true;
            Logging.Trace("Initializing kernel");
            SystemCalls.InitializeKernel();
            Logging.Trace("Initializing OSCorlib");
            OSCorlib.Initialize();

            // create kernel thread and sip
            Logging.Trace("Starting kernel");
            TaskHandle kernelTask = SystemCalls.GetCurrentTask();
            SIP kernelSIP = SIP.CreateSystemSIP("XaeiOS.Kernel");
            Thread kernelThread = Thread.CreateSystemThread(ThreadPriority.Realtime, kernelSIP, kernelTask, "XaeiOS.Kernel");
            kernelSIP.InitializeThread(kernelThread);
            SIPManager.RegisterSIP(kernelSIP);
            ThreadManager.RegisterThread(kernelThread);
            ResourceManager.RegisterSIP(kernelSIP);
            kernelSIP.AddPrincipal(new RootPrincipal(new RootIdentity()));
            SystemCalls.StartKernel();

            // create external thread and sip
            Logging.Trace("Creating the External process");
            TaskHandle externalTask = SystemCalls.GetExternalTask();
            string externalProcessName = "External";
            SIP externalSIP = SIP.CreateSystemSIP(externalProcessName);
            Thread externalThread = Thread.CreateSystemThread(ThreadPriority.Realtime, externalSIP, externalTask, externalProcessName);
            SIPManager.RegisterSIP(externalSIP);
            ResourceManager.RegisterSIP(externalSIP);
            ThreadManager.RegisterThread(externalThread);
            externalSIP.AddPrincipal(new ExternalPrincipal(new ExternalIdentity()));

            Logging.Trace("Starting boot loader");
            _initFunction = initFunction;
            TaskHandle task = SystemCalls.CreateTask(null, new TaskFunction(CreateInitProcess), new TaskCallback(BootCallback), TaskPriority.Normal, "XaeiOS.Boot");
            SystemCalls.StartTask(task);
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void BootModuleEntryPoint()
        {
            // TODO: Pass in string[] args
            Boot(GetModuleEntryPoint());
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        private static void BootCallback(TaskHandle taskId, string taskName, var returnValue, TaskExitStatus exitStatus)
        {
            if (!_booted)
            {
                string reason = "reason unknown";
                if (exitStatus == TaskExitStatus.UnhandledException)
                {
                    if (returnValue != null)
                    {
                        Exception exception = returnValue.Cast<Exception>();
                        reason = exception.ToString() + "\n " + exception.StackTrace;

                    }
                }
                throw new NativeError("XaeiOS.Boot process failed to boot: " + reason);
            }
        }

        private static void CreateInitProcess()
        {
            SIP initProcess = new SIP(new ThreadStart(InvokeStaticConstructorsAndCallInitFunction), ThreadPriority.Normal, "XaeiOS.Init");
            initProcess.Exited += delegate(object sender, EventArgs e)
            {
                // TODO: What to do when init process exits? probably nothing. Maybe there should be a shutdown process that takes care of cleaning everything up
                Logging.Info("Process " + initProcess + " exited");
            };
            initProcess.Start(true);
            _booted = true;
        }

        private static void InvokeStaticConstructorsAndCallInitFunction()
        {
            NativeArray<NativeFunction> staticConstructors = GetModuleStaticConstructors();
            for (int i = 0; i < staticConstructors.Length; i++)
            {
                Delegate.Create(null, staticConstructors[i]).DynamicInvoke(); ;
            }
            Delegate.Create(null, _initFunction).DynamicInvoke();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.Inline, Implementation = "__module__.EntryPoint")]
        private static extern NativeFunction GetModuleEntryPoint();

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.Inline, Implementation = "__module__.StaticConstructors")]
        private static extern NativeArray<NativeFunction> GetModuleStaticConstructors();
    }
}
