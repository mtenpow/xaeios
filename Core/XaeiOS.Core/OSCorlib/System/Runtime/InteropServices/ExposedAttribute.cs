namespace System.Runtime.InteropServices
{
    [AttributeUsage(AttributeTargets.Method)]
    [System.Runtime.CompilerServices.Dummy]
    public class ExposedAttribute : Attribute
    {
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
