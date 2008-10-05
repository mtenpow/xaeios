using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Resources;
using System.Diagnostics;

using XaeiOS;

namespace XaeiOS.Process
{
    public static class SignalDaemon
    {
        private static SIP _signalDaemonProcess;
        private static ManualResetEvent _exitLoop;

        // TODO: Need permissions for signals
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Start()
        {
            string processName = typeof(SignalDaemon).FullName;
            if (_signalDaemonProcess != null)
            {
                throw new InvalidOperationException(processName + " is already started. Only one signal daemon is allowed.");
            }
            _signalDaemonProcess = new SIP(delegate(){}, ThreadPriority.High, processName, true);
            _exitLoop = new ManualResetEvent();
            _signalDaemonProcess.Start();
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void ExternalSendSignal(int pid, Signal signal, int data)
        {
            new SignalPermission(signal, data).Demand();
            // TODO: Use a thread pool here
            Thread thread = new Thread(delegate()
            {
                // send a signal on behalf of the external process
                SendSignal(pid, signal, data);
            }, ThreadPriority.High, _signalDaemonProcess);
            thread.IsBackground = true;
            thread.Name = "External signal sender";
            thread.Start();
        }

        public static void SendSignal(int pid, Signal signal, int data)
        {
            // TODO: Check that the current process has permissions to send this signal
            SIP sip = SIPManager.GetSIP(pid);
            if (sip == null)
            {
                throw new ArgumentException("Could not find process: " + pid);
            }

            Thread thread = new Thread(delegate()
            {
                sip.HandleSignal(signal, data);
            }, ThreadPriority.High, sip);
            thread.Name = "Signal dispatcher";
            thread.IsBackground = true;
            thread.Start();
        }
    }
}
