using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Optimization
{
	public interface ITransformation
	{
        TransformationPhaseOrder PhaseOrder
        {
            get;
        }

        List<Type> Requires
        {
            get;
        }

        Set<Type> Corrupts
        {
            get;
        }

        /// <summary>
        /// Performs the transformation.
        /// </summary>
        /// <param name="methodCompileInfo">The MethodCompileInformation to transform.</param>
        /// <returns>A boolean indicating whether the transformation is now consistent.</returns>
        bool Transform(MethodCompileInfo methodCompileInfo);
	}
}
