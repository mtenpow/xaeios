using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Optimization
{
    public static class TransformationUtility
    {
        public static void PerformTransformation(ITransformation transformation, MethodCompileInfo methodCompileInfo)
        {
            // TODO: Find and error out on circular transformation dependencies

            // make sure all required transformations are consistent
            foreach (Type requiredTransformationType in transformation.Requires)
            {
                if (!methodCompileInfo.ConsistentTransformationTypes.Contains(requiredTransformationType))
                {
                    // this required transformation is not consistent, perform the transformation
                    PerformTransformation((ITransformation)Activator.CreateInstance(requiredTransformationType), methodCompileInfo);
                }
            }

            transformation.Transform(methodCompileInfo);
            methodCompileInfo.ConsistentTransformationTypes.Add(transformation.GetType());
            methodCompileInfo.ConsistentTransformationTypes -= transformation.Corrupts;

        }
    }
}
