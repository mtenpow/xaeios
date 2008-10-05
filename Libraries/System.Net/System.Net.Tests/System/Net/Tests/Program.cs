using System;
using System.Text;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Net.JsonRpc;
using System.Diagnostics;
using System.Threading;
using System.Reflection;

using XaeiOS.Boot;
using XaeiOS.Process;

using System.Net.Tests.Shared;

namespace System.Net.Tests
{
    class Program
    {
        static void Main(string[] args)
        {
            StartProcessViewer();
            StartTests();
        }

        static void StartProcessViewer()
        {
            SIP processViewerSIP = new SIP(new ThreadStart(delegate()
            {
                Logging.Info("Starting Process Viewer");
                new ProcessViewer().Start();
            }), ThreadPriority.Normal, "Process Viewer");
            processViewerSIP.Exited += delegate(object sender, EventArgs e)
            {
                Logging.Info("Process Viewer exited");
            };
            processViewerSIP.Start();
        }

        static void StartTests()
        {
            SIP testsSIP = new SIP(new ThreadStart(delegate()
            {
                Logging.Info("Starting System.Net.Tests");
                RunTests();
            }), ThreadPriority.Normal, "System.Net.Tests");
            testsSIP.Exited += delegate(object sender, EventArgs e)
            {
                Logging.Info("System.Net.Tests exited");
            };
            testsSIP.Start();
        }

        static void RunTests()
        {
            Authenticate(true);
            try
            {
                Authenticate(false);
            }
            catch (InvalidUsernameAndPasswordException e)
            {
                Console.WriteLine("Got expected exception " + e);
            }
            Console.WriteLine("Done");
        }

        static void Authenticate(bool validEmail)
        {
            string emailAddress;
            if (validEmail)
            {
                emailAddress = "m.public@tenpow.com";
            }
            else
            {
                emailAddress = "nobody@tenpow.com";
            }
            string passwordHash = "ABCDEFG";

            Console.WriteLine("Authenticating as " + emailAddress);

            JsonRpcClient client = new JsonRpcClient("http://localhost:7777/");
                
            object returnValue = client.Call("Authenticate", new object[] {
                emailAddress,
                passwordHash
            });

            Console.WriteLine("Authentication succeeded: " + returnValue);
        }
    }
}