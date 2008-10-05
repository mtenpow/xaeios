using System;
using System.Threading;
using System.Browser.Dom;
using System.Resources;
using System.Runtime.CompilerServices;

namespace XaeiOS.TestSuite.Tests
{
    public class ResourceTest : TestBase
    {
        public override void PerformTest()
        {
            Log("Creating DOM resources");

            IDomElement widget1;
            IDomElement widget2;

            DomElementResource resource1;
            DomElementResource resource2;

            IDomDocument document = DomManager.Document;
            IDomElement documentElement = DomManager.GetDocumentBody();

            widget1 = document.CreateElement("DIV");
            widget1.Style.BackgroundColor = "purple";
            widget1.Style.Height = "90px";
            widget1.Style.Width = "90px";
            widget1.Style.Position = "absolute";
            widget1.Style.Top = "250px";
            widget1.Style.Left = "350px";

            documentElement.AppendChild(widget1);
            resource1 = new DomElementResource(widget1);
            ResourceManager.RegisterResource(resource1);

            widget2 = document.CreateElement("DIV");
            widget2.Style.BackgroundColor = "green";
            widget2.Style.Height = "90px";
            widget2.Style.Width = "90px";
            widget2.Style.Position = "absolute";
            widget2.Style.Top = "250px";
            widget2.Style.Left = "450px";

            documentElement.AppendChild(widget2);
            resource2 = new DomElementResource(widget2);
            ResourceManager.RegisterResource(resource2);

            Log("Sleeping for 1 second");

            Thread.Sleep(1000);

            Log("Cleaning up one resource and leaving the other to be cleaned when the SIP exits");
            resource1.Dispose();
            Log("Resource freed");

            Log("Sleeping for 1 second");

            Thread.Sleep(1000);

        }

        public ResourceTest()
            : base("Resource test")
        {
        }
    }

    internal class DomElementResource : IDisposable
    {
        private IDomElement _element;

        #region IResource Members

        public void Dispose()
        {
            if (_element != null)
            {
                if (_element.ParentNode != null)
                {
                    _element.ParentNode.RemoveChild(_element);
                }
                _element = null;
            }
        }

        #endregion

        public DomElementResource(IDomElement element)
        {
            _element = element;
        }

        public override string ToString()
        {
            if (_element != null)
            {
                return _element.ToString();
            }
            else
            {
                return "[free]";
            }
        }
    }
}