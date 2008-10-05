using System.Runtime;
using System.Runtime.CompilerServices;
using System.Diagnostics;

namespace System.Reflection
{
	internal class RuntimeMethodInfo : MethodInfo
	{
        private Method _method;

        public override Type DeclaringType
        {
            get
            {
                return _declaringType;
            }
        }
        private RuntimeType _declaringType;

        public override string Name
        {
            get { return _method.Name; }
        }

        public RuntimeMethodInfo(Method method, RuntimeType declaringType)
		{
            _method = method;
            _declaringType = declaringType;
		}

        public override object Invoke(object self, object[] args)
        {
            // TODO: Need binding flags and all that jazz
            // TODO: CompilerServices.Method needs calling convention info
            Logging.Debug("Invoking method through reflection: " + Name);


            // NOTE: This is a hack to get basic property getter/setters working!!!  This is temporary!
            return ReflectionHelpers.TrampolineInvokeMethod(_method, self, args);
        }

        public override bool IsDefined(Type attributeType, bool inherit)
        {
            return ReflectionHelpers.IsDefined(_method, attributeType, inherit);
        }
	}
}
