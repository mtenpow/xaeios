namespace System.Reflection
{
	public abstract class MethodBase : MemberInfo
	{
        public abstract object Invoke(object self, object[] args);
	}
}
