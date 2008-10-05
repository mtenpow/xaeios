using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.Optimization
{
	public class DuffsDevice : TransformationBase
	{

        // TODO: DuffsDevice transformation
        public DuffsDevice()
            : base(TransformationPhaseOrder.BeforeRegisterAllocation)
        {
        }
       
        public override bool Transform(MethodCompileInfo methodCompileInfo)
        {
            throw new NotImplementedException();
            /*
            // TODO: This could be done a lot better.  Just because a loop is most "inner" doesn't mean that it dominates execution time.  Use a cost-based approach here.
            foreach (LoopTreeVertex loopTreeVertex in compileInfo.LoopTree.Vertices)
            {
                if (compileInfo.LoopTree.OutDegree(loopTreeVertex) > 1)
                {
                    // this is not an innermost loop, so skip it
                    continue;
                }

                // now.. lets turn this loop upside down!

            }
            */

            // match while statement (while0)
            // find condition
            // condition must be a binary binaryExpression with the left side being a field reference binaryExpression or a variable reference binaryExpression (iterator), the operator being <, <=, >, >= (op), and right side being a field or variable reference binaryExpression (bound)
            // build a new block statement (block1)
            // create new variable (v1)
            // add new assignstatement (v1 = (bound-iterator) % 8) to block1
            // add new while statement to block1 (while1)
            // set while1 condition to while0 condition
            // copy while0 body into while1 body
            // add new assignstatement (v1 = parseInt(bound-iterator) / 8)) to block1
            // duplicate while1 (while2)
            // duplicate while2 body within itself 7 times
            // add while2 to block1
        }
    }
}
