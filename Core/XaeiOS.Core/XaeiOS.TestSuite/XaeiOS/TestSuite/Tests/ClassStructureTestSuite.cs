using System;
using System.Reflection;
using System.Threading;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace XaeiOS.TestSuite.Tests
{
    public class ClassStructureTestSuite : TestSuite
    {
        #region TestOverrideInterfaceMethodOfAbstractBaseClass
        [Test]
        public void TestOverrideInterfaceMethodOfAbstractBaseClass()
        {
            IAdder adder = new RegularAdder();
            AssertEquals(16, adder.AddTen(6));
        }

        private interface IAdder
        {
            int AddTen(int x);
        }

        private abstract class AdderBase : IAdder
        {
            #region IInterface Members

            public abstract int AddTen(int x);

            #endregion

            protected AdderBase()
            {
            }
        }

        private class RegularAdder : AdderBase {
            public RegularAdder()
            {
            }

            public override int AddTen(int x)
            {
                for (int i = 0; i < 10; i++)
                {
                    x++;
                }
                return x;
            }
        }

        #endregion

        #region

        [Test]
        public void TestStaticConstructorsWorked()
        {
            AssertNotNull("Static constructor for StaticCosntructorClass1 was not invoked", StaticConstructorClass1.property);
            AssertNotNull("Static constructor for StaticCosntructorClass2 was not invoked", StaticConstructorClass2.property);
        }
        private class StaticConstructorClass1
        {
            public static object property;
            static StaticConstructorClass1()
            {
                property = new object();
                Logging.Debug("In static constructor for StaticConstructorClass1.  property is " + property);
            }
        }

        public class StaticConstructorClass2
        {
            public static object property;
            static StaticConstructorClass2()
            {
                property = new object();
                Logging.Debug("In static constructor for StaticConstructorClass2.  property is " + property);
            }
        }
        #endregion
    }
}