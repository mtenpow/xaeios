using System;
using System.Reflection;
using System.Threading;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiOS.TestSuite.Tests
{
    public class CompilerBugsTestSuite : TestSuite
    {
        //TODO: Make get pivot point tests
        private const int Timeout = 3;
        [Test]
        public void TestMethodInliningBreaksLoops()
        {
            Lock sync = new Lock();
            Condition done = new Condition(sync);
            int resultPivot = -1;
            Thread testThread = new Thread(delegate()
            {
                try
                {
                    List<int> data = new List<int>();
                    data.Add(5);
                    data.Add(53);
                    data.Add(25);
                    data.Add(2);
                    data.Add(32131);
                    data.Add(142);

                    resultPivot = GetPivotPoint(0, data.Count - 1, data, CompareInts);

                    Log("GetPivotPoint complete");

                    done.Signal();
                }
                catch (ThreadAbortException)
                {
                    Log("Test thread aborted..");
                }
            });
            testThread.Start();
            sync.Acquire();
            if (!done.Await(Timeout * 1000))
            {
                testThread.Abort();
                Fail("Test did not complete in " + Timeout + " seconds.  Infinite loop most likely still exists.");
            }

        }

        private static int CompareInts(int a, int b)
        {
            if (a == b)
            {
                //Logging.Debug(a + " == " + b);
                return 0;
            }
            else if (a > b)
            {
                //Logging.Debug(a + " > " + b);
                return 1;
            }
            else
            {
                //Logging.Debug(a + " < " + b);
                return -1;
            }
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

            /* BUG NOTE:
             * 
             * The direct cause was here:
             * 
             * MiddleEnd copy propagation was propagating begPoint + 1 and endPoint to the condition of the outer while statement.
             * 
             * So, we ended up with this:
             * 
             * while(begPoint + 1 < endPoint)
             * 
             * begPoint + 1 and endPoint are loop invariants so we had an infinite loop.
             * 
             * TODO: Add infinite loop detection by detecting loop invariants as conditions of a loop
             * 
             * The root cause was SSA form was not propagating phi functions to the dominator frontiers recursively.
             * If node A has dominator frontier {A, B} and node B has dominator frontier {B, C}, we need to propagate
             * all phi functions inserted at node B to node C as well.
             * 
             */
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
        private static bool GreaterThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
        {
            return comparison(a, b) > -1;
        }
        private static bool LessThanOrEqualTo<T>(T a, T b, Comparison<T> comparison)
        {
            return comparison(a, b) < 1;
        }
        private static int GetPivotPoint2<T>(int begPoint, int endPoint, List<T> data, Comparison<T> comparison)
        {
            int pivot = begPoint;
            int m = begPoint + 1;
            int n = endPoint;

            while ((m < endPoint) && GreaterThanOrEqualTo<T>(data[pivot], data[m], comparison))
            {
                Logging.Debug("1");
                m++; // copy propagation was removing this line
            }

            /**
             * The root cause here was the EliminateEmptyCFGNode was eliminating nodes with InDegree > 1
             * Before SSAForm was called, dominator frontiers were calculated.  Since EliminateEmptyCFGNode
             * was not marking DominatorAnalysis as a corrupt transformation, SSAForm was working with stale
             * DominatorAnalysis data.  Specifically, some nodes that were dominator frontier nodes were eliminated by
             * EliminateEmptyCFGNode.  So, phi markers, and ultimately phi nodes, were not being created in some cases.
             * 
             * The fix was to mark DominatorAnalysis as a corrupt transformation after EliminateEmptyCFGNode.
             * 
             * Another possible fix was not to eliminate empty cfg node that had InDegree > 1.  But I didn't go
             * with that solution.
             * 
             * TODO: SSAForm and EliminateEmptyCFGNode (any many other transformations) are still implemented as plain methods in BasicMiddleEnd.
             * Had these transformations been implemented using the ITransformation framework, I would have remembered to keep track of the
             * prerequisite/corrupted transformations.  I need to migrate ALL transformations to the ITransformation framework to void this
             * kind of mistake.
             * 
             **/

            return n;

        }
    }
}