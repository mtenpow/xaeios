using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace System.Browser.Dom
{
    [Intrinsic]
    public interface IDomDocument : IDomNode
    {
        [Intrinsic("createElement")]
        IDomElement CreateElement(string tagName);
        [Intrinsic("getElementById")]
        IDomElement GetElementById(string id);
    }
}
