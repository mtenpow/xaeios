using System;
using System.Resources;
using System.Runtime.CompilerServices;

namespace System.Browser.Dom
{
    public static class DomManager
    {
        public static extern IDomDocument Document
        {
            [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "document")]
            get;
        }

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "document.documentElement")]
        public static extern IDomElement GetDocumentElement();

        [XaeiOSMethodImpl(MethodImplOptions.Inline, Implementation = "document.body")]
        public static extern IDomElement GetDocumentBody();


        public static IDomElement CreateElement(string tagName)
        {
            IDomElement domElement = Document.CreateElement(tagName);
            RegisterElement(domElement);
            return domElement;
        }

        public static void RegisterElement(IDomElement element)
        {
            // TODO: make sure element is not already registered
            ResourceManager.RegisterResource(new DomElementResourceWrapper(element));
        }

        private class DomElementResourceWrapper : IDisposable
        {
            public IDomElement DomElement;
            public void Dispose()
            {
                if (DomElement != null)
                {
                    if (DomElement.ParentNode != null)
                    {
                        DomElement.ParentNode.RemoveChild(DomElement);
                    }
                    DomElement = null;
                }
            }
            public DomElementResourceWrapper(IDomElement domElement)
            {
                DomElement = domElement;
            }

            public override string ToString()
            {
                if (DomElement != null)
                {
                    return DomElement.ToString();
                }
                else
                {
                    return "[free]";
                }
            }
        }

    }
}