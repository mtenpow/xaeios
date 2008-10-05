using System.Runtime;
using System.Runtime.CompilerServices;

namespace System.Reflection
{
    // TODO: RuntimeMemberInfo should not contain references to other members/types.  These things should be loaded lazily from a central cache
	internal class RuntimePropertyInfo : PropertyInfo
	{
        private Property _property;

        public override Type DeclaringType
        {
            get { return _declaringType; }
        }
        private RuntimeType _declaringType;

        public override MethodInfo GetMethod
        {
            get
            {
                return _getMethod;
            }
        }
        private MethodInfo _getMethod;

        public override MethodInfo SetMethod
        {
            get
            {
                return _setMethod;
            }
        }
        private MethodInfo _setMethod;

        public override string Name
        {
            get { return _property.Name; }
        }

        public RuntimePropertyInfo(Property property, RuntimeType declaringType, RuntimeMethodInfo getMethod, RuntimeMethodInfo setMethod)
		{
            _property = property;
            _declaringType = declaringType;
            _getMethod = getMethod;
            _setMethod = setMethod;
        }

        public override bool IsDefined(Type attributeType, bool inherit)
        {
            return ReflectionHelpers.IsDefined(_property, attributeType, inherit);
        }
	}
}
