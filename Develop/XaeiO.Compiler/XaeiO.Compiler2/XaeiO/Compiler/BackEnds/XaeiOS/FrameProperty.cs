using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public enum FrameProperty
    {
        [FramePropertyName("$ecp")]
        ExceptionCatchPointer,
        [FramePropertyName("$e")]
        Exception
    }

    [AttributeUsage(AttributeTargets.Field)]
    public class FramePropertyName : Attribute
    {
        private string _name;

        public string Name
        {
            get { return _name; }
        }
        public FramePropertyName(string name)
        {
            _name = name;
        }
    }

    public static class FramePropertyHelper
    {
        public static string GetFramePropertyName(FrameProperty property)
        {
            return ((FramePropertyName)(typeof(FrameProperty).GetField(Enum.GetName(typeof(FrameProperty), property)).GetCustomAttributes(typeof(FramePropertyName), false)[0])).Name;
        }
    }
}