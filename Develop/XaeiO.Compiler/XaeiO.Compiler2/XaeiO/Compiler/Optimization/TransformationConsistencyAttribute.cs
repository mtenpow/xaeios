using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Optimization
{
    [AttributeUsage(AttributeTargets.Property)]
    public class TransformationConsistencyAttribute : Attribute
    {
        public Type TransformationType
        {
            get;
            private set;
        }
        public TransformationConsistencyAttribute(Type transformationType)
        {
            if (!typeof(ITransformation).IsAssignableFrom(transformationType))
            {
                throw new ArgumentException("transformationType must implement " + typeof(ITransformation));
            }
            TransformationType = transformationType;
        }
    }
}
