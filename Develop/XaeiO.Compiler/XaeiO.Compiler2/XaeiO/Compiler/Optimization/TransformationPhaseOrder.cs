using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Optimization
{
    [Flags]
	public enum TransformationPhaseOrder
	{
        None = 0,
        Initial = 1,
        AfterSSA = 2,
        BeforeRegisterAllocation = 4,
        AfterRegisterAllocation = 8,
        AfterAllMethodsTransformed = 16,
        Any = Initial | AfterSSA | BeforeRegisterAllocation | AfterRegisterAllocation | AfterAllMethodsTransformed
	}
}
