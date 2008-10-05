using System;
using System.Reflection;
using System.Runtime.InteropServices;

using XaeiOS.Boot;

namespace XaeiOS.TestSuite.Tests
{
    [ReflectionTestAttribute]
    public class ReflectionTestSuite : TestSuite
    {
        [Test]
        public void TestGetTypeByName()
        {
            Type t = Type.GetType("System.Object");
            AssertNotNull("Could not get type System.Object by name", t);
        }

        [Test]
        public void TestGetType()
        {
            object x = new object();
            Type type = x.GetType();
            Assert("GetType() did not return an object of type Type!", type is Type);
            AssertEquals("System.Object", type.ToString());
        }

        [Test]
        public void TestGetMethods()
        {
            MethodInfo[] methods = typeof(ReflectionTestSuite).GetMethods();
            for (int i = 0; i < methods.Length; i++)
            {
                Log("Found method: " + methods[i].Name);
            }

            // TODO: test method invocation through reflection
            // TODO: implement stack overflow checks
        }

        [Test]
        public void TestGetProperties()
        {
            PropertyInfo[] properties = typeof(ReflectionTestSuite).GetProperties();
            for (int i = 0; i < properties.Length; i++)
            {
                Log("Found property: " + properties[i].Name);
            }
        }

        [Test]
        public void TestSetProperty()
        {
            MyProperty = "old value";
            Log("Trying to set property using reflection: " + typeof(ReflectionTestSuite).GetProperties()[0].Name);

            object[] args = new object[1];
            args[0] = "new value";
            typeof(ReflectionTestSuite).GetProperties()[0].SetMethod.Invoke(this, args);
            AssertEquals(args[0], MyProperty);
        }

        [Test]
        public void TestIsDefinedOnType()
        {
            Assert(typeof(ReflectionTestSuite) + " did not have attribute " + typeof(ReflectionTestAttribute), typeof(ReflectionTestSuite).IsDefined(typeof(ReflectionTestAttribute), false));
        }

        [Test]
        public void TestActivator()
        {
            object obj = Activator.CreateInstance(typeof(object));
            AssertEquals(typeof(object), obj.GetType());
        }

        public string MyProperty
        {
            get;
            set;
        }

        public class ReflectionTestAttribute : Attribute
        {
        }
    }
}