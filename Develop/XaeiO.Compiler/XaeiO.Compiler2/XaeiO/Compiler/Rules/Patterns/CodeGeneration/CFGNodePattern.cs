using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;
using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
    public abstract class CFGNodePattern : Pattern<CFGNode, CFGPatternMatch>
    {
    }
    public abstract class CodeGenerationPattern : CFGNodePattern, ICodeGenerationPattern
    {
        private bool _isMatched;
        public bool IsMatched
        {
            get { return _isMatched; }
            protected set
            {
                _isMatched = value;
            }
        }

        private int _cost;

        public abstract int Cost
        {
            get;
        }

        public MethodCompileInfo CompileInfo
        {
            get
            {
                return _compileInfo;
            }
        }
        private MethodCompileInfo _compileInfo;

        private Set<CFGNode> _workingSet;

        public Set<CFGNode> WorkingSet
        {
            get
            {
                if ((object)_workingSet == null)
                {
                    _workingSet = CompileInfo.NodeSet;
                }
                return _workingSet;
            }
            set { _workingSet = value; }
        }

        public Set<CFGNode> Filter(Set<CFGNode> nodes)
        {
            return WorkingSet & nodes;
        }

        public bool PassesFilter(CFGNode node)
        {
            return WorkingSet.Contains(node);
        }

        protected CodeGenerationPattern(MethodCompileInfo compileInfo)
            : this(compileInfo, null)
        {
        }
        protected CodeGenerationPattern(MethodCompileInfo compileInfo, Set<CFGNode> workingSet)
        {
            _compileInfo = compileInfo;
            _workingSet = workingSet;
        }

        public abstract ICodeObject GenerateCode();
    }
}