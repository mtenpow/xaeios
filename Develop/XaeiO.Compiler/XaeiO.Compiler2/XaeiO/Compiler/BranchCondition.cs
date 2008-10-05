using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler
{
    public class BranchCondition
    {
        public BranchConditionType Type
        {
            get;
            set;
        }

        public ICodeObject Data
        {
            get;
            set;
        }

        public BranchCondition(BranchConditionType type)
        {
            Type = type;
        }

        public BranchCondition(BranchConditionType type, ICodeObject data)
        {
            Type = type;
            Data = data;
        }

        public BranchCondition() : this(BranchConditionType.Unconditional)
        {
        }

        public override string ToString()
        {
            return string.Format("[BranchCondition - Type: {0}, Data: {1}]", Type, Data);
        }
    }

    public enum BranchConditionType
    {
        Unconditional,
        True,
        False,
        SwitchCaseCondition,
        SwitchCaseDefault,
        SwitchFallThrough,
        ContextSwitch,
        ExceptionThrown
    }
}