using System.Runtime;
using System.Runtime.CompilerServices;
using System.Diagnostics;

namespace System.Reflection
{
	internal class RuntimeConstructorInfo : ConstructorInfo
	{
        private Constructor _constructor;

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
            get { return _constructor.Name; }
        }

        public RuntimeConstructorInfo(Constructor constructor, RuntimeType declaringType)
		{
            _constructor = constructor;
            _declaringType = declaringType;
		}

        public override object Invoke(object self, object[] args)
        {
            // TODO: Need binding flags and all that jazz
            // TODO: CompilerServices.Method needs calling convention info
            Logging.Debug("Invoking method through reflection: " + Name);


            // TODO: This is temporary!
            return ReflectionHelpers.TrampolineInvokeConstructor(_constructor, self, args);
        }

        public override bool IsDefined(Type attributeType, bool inherit)
        {
            return ReflectionHelpers.IsDefined(_constructor, attributeType, inherit);
        }
	}
}
