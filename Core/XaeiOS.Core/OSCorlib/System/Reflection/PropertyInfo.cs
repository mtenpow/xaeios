namespace System.Reflection
{
	public abstract class PropertyInfo : MemberInfo
	{
        public abstract MethodInfo GetMethod
        {
            get;
        }

        public abstract MethodInfo SetMethod
        {
            get;
        }

        public PropertyInfo()
		{
		}
	}
}
