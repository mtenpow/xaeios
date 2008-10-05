using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace System.Browser.Dom
{
    [Intrinsic]
    public interface IDomNode
    {
        [Intrinsic("parentNode")]
        IDomNode ParentNode
        {
            get;
        }

        [Intrinsic("firstChild")]
        IDomNode FirstChild
        {
            get;
        }

        [Intrinsic("lastChild")]
        IDomNode LastChild
        {
            get;
        }

        [Intrinsic("removeChild")]
        void RemoveChild(IDomNode childNode);
        [Intrinsic("appendChild")]
        void AppendChild(IDomNode childNode);
        [Intrinsic("insertBefore")]
        void InsertBefore(IDomNode childNode, IDomNode referenceNode);
    }
}
