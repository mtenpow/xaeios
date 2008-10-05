namespace System.Runtime.InteropServices
{
    //TODO: Finish implementing System.Runtime.InteropServices.DllImportAttribute
    [AttributeUsage(AttributeTargets.Method)]
    [System.Runtime.CompilerServices.Dummy]
	public class DllImportAttribute : Attribute
	{
        public string Value
        {
            get
            {
                return _value;
            }
        }
        private string _value;
        public DllImportAttribute(string dllName)
		{
            _value = dllName;
        }
	}
}
