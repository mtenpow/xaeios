using System;
using System.Runtime.InteropServices;

namespace System.Browser.Css
{
    [Intrinsic]
    public interface IStyle
    {
        [Intrinsic("left")]
        string Left
        {
            get;
            set;
        }

        [Intrinsic("top")]
        string Top
        {
            get;
            set;
        }

        [Intrinsic("width")]
        string Width
        {
            get;
            set;
        }

        [Intrinsic("height")]
        string Height
        {
            get;
            set;
        }

        [Intrinsic("backgroundColor")]
        string BackgroundColor
        {
            get;
            set;
        }

        [Intrinsic("position")]
        string Position
        {
            get;
            set;
        }

        [Intrinsic("opacity")]
        string Opacity
        {
            get;
            set;
        }
    }
}