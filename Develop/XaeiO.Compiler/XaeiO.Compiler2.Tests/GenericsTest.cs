using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiO.Compiler2.Tests
{
    public static class QuickSort
    {
        public static void Sort<T>(List<T> data, Comparison<T> comparison)
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
