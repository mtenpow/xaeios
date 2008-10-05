using System;
using System.Resources;
using System.Runtime.InteropServices;

using System.Browser.Css;

namespace System.Browser.Dom
{
    [Intrinsic]
    public interface IDomElement : IDomNode
    {
        [Intrinsic("style")]
        IStyle Style
        {
            get;
        }
        [Intrinsic("innerHTML")]
        string InnerHtml
        {
            get;
            set;
        }
        [Intrinsic("getAttribute")]
        string GetAttribute(string attributeName);
        [Intrinsic("setAttribute")]
        string SetAttribute(string attributeName, string value);
    }
}
