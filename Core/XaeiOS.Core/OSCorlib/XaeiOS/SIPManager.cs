using System;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Resources;
using System.Diagnostics;

using XaeiOS;

namespace XaeiOS
{
    internal static class SIPManager
    {
        private static Dictionary<int, SIP> _sips;
        private static int _pidCounter;

        public static void Initialize()
        {
            _sips = new Dictionary<int,SIP>();
            _pidCounter = 0;
        }

        /// <summary>
        /// Registers a SIP with the SIPManager.
        /// Sets the PID of the SIP.
        /// </summary>
        /// <param name="sip">The SIP to register</param>
        public static void RegisterSIP(SIP sip)
        {
            if (sip.PID != -1)
            {
                throw new ArgumentException("SIP is already registered.");
            }
            int pid = GetPID();
            sip.PID = pid;
            _sips[pid] = sip;
        }

        public static void UnregisterSIP(SIP sip)
        {
            _sips.Remove(sip.PID);
        }

        public static SIP[] GetSIPs()
        {
            return _sips.GetValues();
        }

        public static SIP GetSIP(int id)
        {
            return _sips[id];
        }

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.CriticalSection)]
        internal static int GetPID()
        {
            return _pidCounter++;
        }

    }
}
