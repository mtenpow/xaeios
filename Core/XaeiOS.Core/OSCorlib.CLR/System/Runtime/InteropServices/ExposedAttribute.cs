namespace System.Runtime.InteropServices
{
    [AttributeUsage(AttributeTargets.Method)]
    [System.Runtime.CompilerServices.Dummy]
    public class ExposedAttribute : Attribute
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

        public ExposedAttribute()
        {
        }

        public ExposedAttribute(string name)
        {
            _name = name;
        }
    }
}
