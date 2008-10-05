using System;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

using XaeiOS.Boot;

namespace XaeiO.Compiler2.Tests
{
    public class Program
    {
        [XaeiOSMethodImpl(MethodImplOptions.NonPreemptive)]
        public static void Main(string[] args)
        {
            BootManager.Boot(Start);
        }

        public static void Start()
        {
            List<int> data = new List<int>();
            data.Add(5);
            data.Add(53);
            data.Add(25);
            data.Add(2);
            data.Add(32131);
            data.Add(142);
            for (int i = 0; i < data.Count; i++)
            {
                Console.WriteLine("Added " + data[i] + ".");
            }
            Console.WriteLine("Sorting " + data.Count + " elements.");
            Logging.Debug("Start sort...");
            QuickSort.Sort<int>(data, CompareInts);
            Logging.Debug("Sort done.");
            Console.WriteLine("Done sorting " + data.Count + " elements.");
            for (int i = 0; i < data.Count; i++)
            {
                Console.WriteLine(data[i].ToString());
            }
        }

        public static int CompareInts(int a, int b)
        {
            if (a == b)
            {
                Console.WriteLine(a + " == " + b);
                return 0;
            }
            else if (a > b)
            {
                Console.WriteLine(a + " > " + b);
                return 1;
            }
            else
            {
                Console.WriteLine(a + " < " + b);
                return -1;
            }
        }
    }
}
