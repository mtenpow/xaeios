namespace System.Runtime.InteropServices
{
    [AttributeUsage(
       AttributeTargets.Class |
       AttributeTargets.Interface |
        AttributeTargets.Constructor |
        AttributeTargets.Field |
        AttributeTargets.Method |
        AttributeTargets.Struct |
        AttributeTargets.Property)]
    [System.Runtime.CompilerServices.Dummy]
    public class IntrinsicAttribute : Attribute
    {
        public bool UseGlobalNamespace
        {
            get
            {
                return _useGlobalNamespace;
            }
            set
            {
                _useGlobalNamespace = value;
            }
        }
        private bool _useGlobalNamespace;

        private bool _setVTable = false;
        public bool SetVTable
        {
            get { return _setVTable; }
            set { _setVTable = value; }
        }

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
        private string _name;

        public IntrinsicAttribute()
        {
        }

        public IntrinsicAttribute(string name)
        {
            _name = name;
        }
    }
}
