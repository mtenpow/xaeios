using System;
using System.Threading;
using System.Browser.Dom;
using System.Runtime.CompilerServices;

using XaeiOS.Boot;
using System.Diagnostics;

namespace XaeiOS.TestSuite.Tests
{
    public class DomTest : TestBase
    {
        bool _testRunning;
        int _duration;
        Semaphore _semaphore;

        public override void PerformTest()
        {
            _testRunning = true;

            Log("Creating DOM elements");

            IDomElement element1 = DomManager.CreateElement("DIV");
            element1.Style.BackgroundColor = "blue";
            element1.Style.Top = "250px";
            element1.Style.Left = "150px";

            IDomElement element2 = DomManager.CreateElement("DIV");
            element2.Style.BackgroundColor = "red";
            element2.Style.Top = "250px";
            element2.Style.Left = "150px";

            IDomElement element3 = DomManager.CreateElement("DIV");
            element3.Style.BackgroundColor = "orange";
            element3.Style.Top = "250px";
            element3.Style.Left = "350px";

            IDomElement element4 = DomManager.CreateElement("DIV");
            element4.Style.BackgroundColor = "green";
            element4.Style.Top = "250px";
            element4.Style.Left = "350px";

            IDomDocument document = DomManager.Document;
            IDomElement documentElement = DomManager.GetDocumentBody();
            IDomElement[] elements = new IDomElement[] {
                element1,
                element2,
                element3,
                element4
            };

            _semaphore = new Semaphore(elements.Length);

            bool clockwise = true;
            for (int i = 0; i < elements.Length; i++, clockwise = !clockwise)
            {
                IDomElement element = elements[i];

                element.Style.Height = "90px";
                element.Style.Width = "90px";
                element.Style.Position = "absolute";

                bool clockwiseForThisElement = clockwise;
                documentElement.AppendChild(element);
                Thread thread = new Thread(delegate()
                {
                    Log("Starting thread to move element " + element + ".  Clockwise = " + clockwiseForThisElement);
                    MoveElement("element " + i, element, clockwiseForThisElement);
                }, ThreadPriority.Normal);
                thread.Name = "DomTest animation: " + element.Style.BackgroundColor;
                thread.Start();
            }

            Log("Sleeping for " + _duration + " seconds");

            Thread.Sleep(_duration * 1000);

            Log("Woke up!");
            _testRunning = false;
            _semaphore.Acquire(elements.Length);
        }

        private void MoveElement(string name, IDomElement element, bool clockwise)
        {
            _semaphore.Acquire();
            int originalX = NativeNumber.ParseInt(element.Style.Left);
            int originalY = NativeNumber.ParseInt(element.Style.Top);
            int counter = 0;
            while (_testRunning)
            {
                double factor;
                double motionSpeed = 8;
                double opacitySpeed = 30;
                factor = counter * 3.14;
                if (clockwise)
                {
                    factor *= -1;
                }
                element.Style.Left = ((int)Math.Floor(originalX + Math.Sin((NativeNumber)(factor / motionSpeed)) * 50)).ToString() + "px";
                element.Style.Top = ((int)Math.Floor(originalY + Math.Cos((NativeNumber)(factor / motionSpeed)) * 50)).ToString() + "px";
                element.Style.Opacity = (Math.Min((NativeNumber)((double)Math.Abs(Math.Sin((NativeNumber)(factor / opacitySpeed))) + .2), 1)).ToString();
                counter++;
                Thread.Sleep(33);
            }
            _semaphore.Release();
        }

        /// <summary>
        /// A test for the Document Object Model interfaces available in XaeiOS.
        /// DOM element resources are automatically freed when the SIP exits.
        /// </summary>
        /// <param name="duration">The number of seconds the animations in the test should run for</param>
        public DomTest(int duration)
            : base("Document Object Model test")
        {
            _duration = duration;
        }
    }
}