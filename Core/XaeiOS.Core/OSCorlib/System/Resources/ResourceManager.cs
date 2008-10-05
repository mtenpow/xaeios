using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Diagnostics;

using XaeiOS;
using XaeiOS.Process;

namespace System.Resources
{
    public static class ResourceManager
    {
        private static Dictionary<int, NativeArray<IDisposable>> _resourceMap;

        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive | MethodImplOptions.CriticalSection)]
        public static void Initialize()
        {
            _resourceMap = new Dictionary<int, NativeArray<IDisposable>>();
        }

        internal static void RegisterSIP(SIP sip)
        {
            if (_resourceMap.ContainsKey(sip.PID))
            {
                throw new Exception("SIP " + sip.PID + "is already registered with ResourceManager");
            }
            Logging.Trace("Registering SIP with ResourceManager: " + sip);
            _resourceMap[sip.PID] = new NativeArray<IDisposable>();
        }

        internal static void CleanupAndUnregisterSIP(SIP sip)
        {
            Logging.Info("Cleaning up SIP: " + sip);
            // clean up each resource
            NativeArray<IDisposable> resources = _resourceMap[sip.PID];
            for (int i = 0; i < resources.Length; i++)
            {
                Logging.Info("Freeing resource " + resources[i] + " left by SIP: " + sip);
                //try // TODO: XaeiOS BasicMiddleEnd gets a NonAcyclicGraphException during TransitiveClosuresAndTopologicalSort
                //{
                resources[i].Dispose();
                //}
                //catch (Exception e)
                //{
                //    Logging.Log("Unable to free resource " + resources[i] + ".  Exception was: " + e);
                //}
            }
            _resourceMap.Remove(sip.PID);
        }

        public static void RegisterResource(IDisposable resource)
        {
            //Logging.Log("Registering resource " + resource + " for SIP: " + SIP.CurrentSIP);
            NativeArray<IDisposable> resources = _resourceMap[SIP.CurrentSIP.PID];
            resources.Push(resource);
            //Logging.Log("Resource successfully registered");
        }

        public static void FreeResource(IDisposable resource)
        {
            // TODO: Free resource
            throw new NotImplementedException();
            //Logging.Log("Freeing resource " + resource + " for SIP: " + SIP.CurrentSIP);
            NativeArray<IDisposable> resources = _resourceMap[SIP.CurrentSIP.PID];
            for (int i = 0; i < resources.Length; i++)
            {
                if (resources[i] == resource)
                {
                    resource.Dispose();
                    // TODO: NativeArray.RemoveAt
                    //resources.RemoveAt(i);
                    return;
                }
            }
            throw new Exception("Resource was not registered or does not belong to the current SIP");
        }
    }
}
