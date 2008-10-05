using System;
using System.Collections.Generic;
using System.Text;

// TODO: ProgramAnalysis class

namespace XaeiO.Compiler.Optimization
{
	public abstract class ProgramAnalysis<T>
	{
        private ProgramAnalysisDirection _direction;

        public ProgramAnalysisDirection Direction
        {
            get { return _direction; }
            set { _direction = value; }
        }

        private ConfluenceOperator<T> _confluenceOperator;

        public ConfluenceOperator<T> ConfluenceOperator
        {
            get { return _confluenceOperator; }
            set { _confluenceOperator = value; }
        }

        public abstract List<CFGNode> GetNodes();

        public ProgramAnalysis()
        {
            _direction = ProgramAnalysisDirection.Forward;
        }

        public void Compute()
        {
            if (_confluenceOperator == null)
            {
                throw new InvalidOperationException("Confluence operator cannot be null for a program analysis computation");
            }
            List<CFGNode> nodes = GetNodes();

        }
    }
    public enum ProgramAnalysisDirection
    {
        Forward,
        Reverse
    }
    public delegate T ConfluenceOperator<T>(T a, T b);
}
