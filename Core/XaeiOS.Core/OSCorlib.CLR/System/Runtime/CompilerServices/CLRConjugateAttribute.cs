namespace System.Runtime.CompilerServices
{
    [AttributeUsage(
        AttributeTargets.Assembly |
        AttributeTargets.Class |
        AttributeTargets.Struct |
        AttributeTargets.Delegate)]
    [Dummy]
    public class CLRConjugateAttribute : Attribute
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

    [Dummy]
    public class CorlibCLRConjugateAttribute : Attribute
    {
        public CorlibCLRConjugateAttribute()
        {
        }
    }
}