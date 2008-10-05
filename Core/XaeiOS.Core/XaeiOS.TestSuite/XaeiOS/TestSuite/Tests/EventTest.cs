using System;
using System.Runtime.InteropServices;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    public class EventTest : TestBase
    {
        private bool _handler1Called;
        private bool _handler2Called;
        private bool _handler3Called;
        public event EventHandler MyEvent;
        private event EventHandler NullEvent;

        public override void PerformTest()
        {
            _handler1Called = false;
            _handler2Called = false;
            Log("Adding event handler 1");
            MyEvent += new EventHandler(EventTest_MyEvent);
            Log("Adding event handler 2");
            MyEvent += new EventHandler(EventTest_MyEvent2);
            Log("Adding event handler 3");
            MyEvent += new EventHandler(EventTest_MyEvent3);
            Log("Event handlers added");
            Log("Firing event");
            MyEvent(this, null);
            Assert("Handler 1 was not called", _handler1Called);
            Assert("Handler 2 was not called", _handler2Called);
            Assert("Handler 3 was not called", _handler3Called);

            Log("Firing null event");
            try
            {
                NullEvent(this, new EventArgs());
            }
            catch (NullReferenceException e)
            {
                Log("Got null reference exception as expected: " + e);
            }
        }

        void EventTest_MyEvent3(object sender, EventArgs e)
        {
            Log("Handler 3 called!");
            _handler3Called = true;
        }

        void EventTest_MyEvent2(object sender, EventArgs e)
        {
            Log("Handler 2 called!");
            _handler2Called = true;
        }

        void EventTest_MyEvent(object sender, EventArgs e)
        {
            Log("Handler 1 called!");
            _handler1Called = true;
        }

        public EventTest() : base("Event test")
        {
        }
    }
}