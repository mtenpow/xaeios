using System.Runtime;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Diagnostics;

namespace System.Reflection
{
    internal class RuntimeType : Type
    {
        private Class _class;
        private RuntimeConstructorInfo[] _constructors;
        private RuntimeMethodInfo[] _methods;
        private RuntimePropertyInfo[] _properties;
        private Dictionary<Method, RuntimeMethodInfo> _methodToRuntimeMethodInfoMap = new Dictionary<Method, RuntimeMethodInfo>();
        private Dictionary<Constructor, RuntimeConstructorInfo> _constructorToRuntimeConstructorInfoMap = new Dictionary<Constructor, RuntimeConstructorInfo>();

        public override Type DeclaringType
        {
            get { return _declaringType; }
        }
        private RuntimeType _declaringType;

        public override string Name
        {
            get { return _class.Name; }
        }

        public override string Namespace
        {
            get { return _class.Namespace; }
        }

        public Class Class
        {
            get { return _class; }
        }

        public RuntimeType(Class klass, RuntimeType declaringType)
            : base((RuntimeTypeHandle)klass.VTable)
        {
            _class = klass;
        }

        public override ConstructorInfo[] GetConstructors()
        {
            LoadConstructorInfo();
            ConstructorInfo[] constructors = new ConstructorInfo[_constructors.Length];
            for (int i = 0; i < _constructors.Length; i++)
            {
                constructors[i] = _constructors[i];
            }
            return constructors;
        }

        public override MethodInfo[] GetMethods()
        {
            LoadMethodInfo();
            MethodInfo[] methods = new MethodInfo[_methods.Length];
            for (int i = 0; i < _methods.Length; i++)
            {
                methods[i] = _methods[i];
            }
            return methods;
        }

        public override PropertyInfo[] GetProperties()
        {
            LoadPropertyInfo();
            PropertyInfo[] properties = new PropertyInfo[_properties.Length];
            for (int i = 0; i < _properties.Length; i++)
            {
                properties[i] = _properties[i];
            }
            return properties;
        }

        public override bool IsDefined(Type attributeType, bool inherit)
        {
            return ReflectionHelpers.IsDefined(_class, attributeType, inherit);
        }

        public object CreateInstance()
        {
            return ReflectionHelpers.CreateInstance(this);
        }

        private void LoadConstructorInfo()
        {
            if (_constructors != null)
            {
                return;
            }
            _constructors = new RuntimeConstructorInfo[_class.Constructors.Length];
            for (int i = 0; i < _class.Constructors.Length; i++)
            {
                Constructor constructor = _class.Constructors[i];
                _constructors[i] = new RuntimeConstructorInfo(constructor, this);
                _constructorToRuntimeConstructorInfoMap[constructor] = _constructors[i];
            }
        }

        private void LoadMethodInfo()
        {
            if (_methods != null)
            {
                return;
            }
            _methods = new RuntimeMethodInfo[_class.Methods.Length];
            for (int i = 0; i < _class.Methods.Length; i++)
            {
                Method method = _class.Methods[i];
                _methods[i] = new RuntimeMethodInfo(method, this);
                _methodToRuntimeMethodInfoMap[method] = _methods[i];
            }
        }

        private void LoadPropertyInfo()
        {
            if (_properties != null)
            {
                return;
            }
            LoadMethodInfo();
            _properties = new RuntimePropertyInfo[_class.Properties.Length];
            for (int i = 0; i < _class.Properties.Length; i++)
            {
                Property property = _class.Properties[i];
                RuntimeMethodInfo getMethodInfo;
                if (property.GetMethod != null)
                {
                    getMethodInfo = _methodToRuntimeMethodInfoMap[property.GetMethod];
                }
                else
                {
                    getMethodInfo = null;
                }
                RuntimeMethodInfo setMethodInfo;
                if (property.SetMethod != null)
                {
                    setMethodInfo = _methodToRuntimeMethodInfoMap[property.SetMethod];
                }
                else
                {
                    setMethodInfo = null;
                }
                _properties[i] = new RuntimePropertyInfo(property, this, getMethodInfo, setMethodInfo);
            }
        }
    }
}
