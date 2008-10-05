using System;
using System.Collections.Generic;
using System.Text;

// TODO: ConvergingProgramAnalysis

namespace XaeiO.Compiler.Optimization
{
	public abstract class ConvergingProgramAnalysis<T> : TransformationBase
	{
        public ConvergingProgramAnalysisDirection Direction
        {
            get;
            set;
        }

        public ConfluenceOperator<T> ConfluenceOperator
        {
            get;
            set;
        }

        public abstract List<CFGNode> GetNodes();

        public ConvergingProgramAnalysis()
        {
            Direction = ConvergingProgramAnalysisDirection.Forward;
        }

        public void Compute()
        {
            if (ConfluenceOperator == null)
            {
                throw new InvalidOperationException("Confluence operator cannot be null for a converging program analysis computation");
            }
            List<CFGNode> nodes = GetNodes();

        }
    }
    public enum ConvergingProgramAnalysisDirection
    {
        Forward,
        Reverse
    }
    public delegate T ConfluenceOperator<T>(T a, T b);
}
