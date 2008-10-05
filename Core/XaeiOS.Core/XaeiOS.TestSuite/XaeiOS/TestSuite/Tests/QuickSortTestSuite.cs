using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiOS.TestSuite
{
    // TODO: Unit test for ArrayInitializer
    public class QuickSortTestSuite : TestSuite
    {
        [Test]
        public void TestQuickSort()
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
            Sort<int>(data, CompareInts);
            Console.WriteLine("Done sorting " + data.Count + " elements.");

            int[] expectedValues = new int[] {
                2,5,25,53,142,32131
            };

            for (int i = 0; i < data.Count; i++)
            {
                Console.WriteLine("Checking index " + i + ".  Expecting " + expectedValues[i]);
                AssertEquals(expectedValues[i], data[i]);
            }

            data = new List<int>();
            for (int i = 127; i >= 0; i--)
            {
                data.Add(i);
            }
            Console.WriteLine("Sorting " + data.Count + " elements.");
            Sort<int>(data, CompareInts);
            Console.WriteLine("Done sorting " + data.Count + " elements.");

            for (int i = 0; i < data.Count; i++)
            {
                AssertEquals(i, data[i]);
            }
        }

        private static int CompareInts(int a, int b)
        {
            return a - b;
        }
        private static void Sort<T>(List<T> data, Comparison<T> comparison)
        {
            Sorting<T>(0, data.Count - 1, data, comparison);
        }
        private static int GetPivotPoint<T>(int begPoint, int endPoint, List<T> data, Comparison<T> comparison)
        {
            int pivot = begPoint;
            int m = begPoint + 1;
            int n = endPoint;

            while ((m < endPoint) && GreaterThanOrEqualTo<T>(data[pivot], data[m], comparison))
            {
                m++;
            }

            while ((n > begPoint) && LessThanOrEqualTo<T>(data[pivot], data[n], comparison))
            {
                n--;
            }

            while (m < n)
            {
                T temp = data[m];
                data[m] = data[n];
                data[n] = temp;

                while ((m < endPoint) && GreaterThanOrEqualTo<T>(data[pivot], data[m], comparison))
                {
                    m++;
                }

                while ((n > begPoint) && LessThanOrEqualTo<T>(data[pivot], data[n], comparison))
                {
                    n--;
                }

            }
            if (pivot != n)
            {
                T temp2 = data[n];
                data[n] = data[pivot];
                data[pivot] = temp2;

            }
            return n;

        }
        private static void Sorting<T>(int beg, int end, List<T> data, Comparison<T> comparison)
        {
            if (end == beg)
            {
                return;
            }
            else
            {
                int pivot = GetPivotPoint(beg, end, data, comparison);
                if (pivot > beg)
                    Sorting<T>(beg, pivot - 1, data, comparison);
                if (pivot < end)
                    Sorting<T>(pivot + 1, end, data, comparison);
            }
        }
        private static bool GreaterThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
        {
            return comparison(a, b) > -1;
        }
        private static bool LessThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
        {
            return comparison(a, b) < 1;
        }
    }

    public delegate int Comparison<T>(T a, T b);
}
