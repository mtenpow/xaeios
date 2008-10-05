using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{

    public enum SpecialRegister : int
    {
        [SpecialRegisterName("$ep")]
        ExecutionPointer = 0,
        [SpecialRegisterName("$end")]
        TimeSliceEnd = 1,
        [SpecialRegisterName("$rv")]
        ReturnValue = 2,
        [SpecialRegisterName("$pc")]
        ParentContinuation = 3,
        [SpecialRegisterName("$f")]
        Frame = 4,
        Max = Frame + 1
    }

    public static class SpecialRegisterHelper
    {
        public static string GetSpecialRegisterName(SpecialRegister register)
        {
            return ((SpecialRegisterName)(typeof(SpecialRegister).GetField(Enum.GetName(typeof(SpecialRegister), register)).GetCustomAttributes(typeof(SpecialRegisterName), false)[0])).Name;
        }
    }

    [AttributeUsage(AttributeTargets.Field)]
    public class SpecialRegisterName : Attribute
    {
        private string _name;

        public string Name
        {
            get { return _name; }
        }
        public SpecialRegisterName(string name)
        {
            _name = name;
        }
    }
}
