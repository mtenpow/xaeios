using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Optimization
{
    public abstract class TransformationBase : ITransformation
    {
        #region ITransformation Members

        public TransformationPhaseOrder PhaseOrder
        {
            get { return _phaseOrder; }
        }
        private TransformationPhaseOrder _phaseOrder;

        public List<Type> Requires
        {
            get { return _requires; }
        }
        private List<Type> _requires = new List<Type>();

        public Set<Type> Corrupts
        {
            get { return _corrupts; }
        }
        private Set<Type> _corrupts = new Set<Type>();

        public abstract bool Transform(MethodCompileInfo methodCompileInfo);

        protected TransformationBase()
            : this(TransformationPhaseOrder.Any)
        {
        }

        protected TransformationBase(TransformationPhaseOrder phaseOrder)
        {
            _phaseOrder = phaseOrder;
        }

        #endregion
    }
}
