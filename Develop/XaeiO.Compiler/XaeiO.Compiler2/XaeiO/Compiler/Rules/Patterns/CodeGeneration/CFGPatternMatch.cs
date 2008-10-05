using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
	public class CFGPatternMatch : PatternMatch
	{
        private Set<CFGNode> _matchedNodes;
        public Set<CFGNode> MatchedNodes
        {
            get { return _matchedNodes; }
            set { _matchedNodes = value; }
        }

        public CFGPatternMatch(Set<CFGNode> matchedNodes)
            : base(matchedNodes)
        {
            _matchedNodes = matchedNodes;
        }

        public CFGPatternMatch(CFGNode node)
            : this(new Set<CFGNode>(node))
        {
        }
	}
}
