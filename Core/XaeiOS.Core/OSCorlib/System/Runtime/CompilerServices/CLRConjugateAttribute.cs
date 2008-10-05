namespace System.Runtime.CompilerServices
{
    [AttributeUsage(
        AttributeTargets.Assembly |
        AttributeTargets.Class |
        AttributeTargets.Struct |
        AttributeTargets.Delegate)]
    public class CLRConjugateAttribute : System.Attribute
    {
        public string ConjugateName
        {
            get
            {
                return _conjugateName;
            }
            set
            {
                _conjugateName = value;
            }
        }
        private string _conjugateName;

        public CLRConjugateAttribute(string conjugateName)
        {
            _conjugateName = conjugateName;
        }
    }

    [AttributeUsage(
        AttributeTargets.Assembly |
        AttributeTargets.Class |
        AttributeTargets.Struct |
        AttributeTargets.Delegate |
        AttributeTargets.Interface )]
    public class CorlibCLRConjugateAttribute : System.Attribute
    {
        public CorlibCLRConjugateAttribute()
        {
        }
    }
}