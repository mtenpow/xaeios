using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;
using Mono.Cecil.Cil;
using XaeiO.Compiler.CodeModel;
using Tenpow.Collections.Generic;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Collections;

namespace XaeiO.Compiler
{
    public class MethodCompileInfo
    {
        public Set<string> Duped
        {
            get
            {
                return _duped;
            }
        }
        private Set<string> _duped = new Set<string>();

        public DynamicDictionary<string, Set<CFGNode>> UsesOfVariable
        {
            get
            {
                return _usesOfVariable;
            }
        }
        private DynamicDictionary<string, Set<CFGNode>> _usesOfVariable = new DynamicDictionary<string,Set<CFGNode>>();

        public DynamicDictionary<string, Set<CFGNode>> DefinitionsOfVariable
        {
            get
            {
                return _definitionsOfVariable;
            }
        }
        private DynamicDictionary<string, Set<CFGNode>> _definitionsOfVariable = new DynamicDictionary<string, Set<CFGNode>>();

        public Set<CFGNode> DeadCode
        {
            get
            {
                if ((object)_deadCode == null)
                {
                    _deadCode = new Set<CFGNode>();
                }
                return _deadCode;
            }
        }
        private Set<CFGNode> _deadCode;

        public Set<CFGNode> NodeSet
        {
            get
            {
                Set<CFGNode> set = new Set<CFGNode>();
                foreach (CFGNode node in _cfg.Vertices)
                {
                    set.Add(node);
                }
                return set;
            }
        }

        public MethodDefinition Method
        {
            get { return _method; }
            set { _method = value; }
        }
        private MethodDefinition _method;

        public Dictionary<CFGNode, LoopTreeVertex> Loop
        {
            get
            {
                return _loop;
            }
            set { _loop = value; }
        }
        private Dictionary<CFGNode, LoopTreeVertex> _loop = new Dictionary<CFGNode, LoopTreeVertex>();

        public LoopTree LoopTree
        {
            get { return _loopTree; }
            set { _loopTree = value; }
        }
        private LoopTree _loopTree;

        public List<CFGEdge> DominatorBackEdges
        {
            get
            {
                return _backEdges;
            }
            set { _backEdges = value; }
        }
        private List<CFGEdge> _backEdges = new List<CFGEdge>();

        private List<CFGNode> _topologicalSort;
        public List<CFGNode> TopologicalSort
        {
            get { return _topologicalSort; }
            set { _topologicalSort = value; }
        }

        private Dictionary<CFGNode, int> _topologicalOrder;
        public Dictionary<CFGNode, int> TopologicalOrder
        {
            get { return _topologicalOrder; }
            set { _topologicalOrder = value; }
        }

        public DynamicDictionary<CFGNode, Set<CFGNode>> ForwardOnlyTransitiveClosure
        {
            get { return _forwardOnlyTransitiveClosure; }
            set { _forwardOnlyTransitiveClosure = value; }
        }
        private DynamicDictionary<CFGNode, Set<CFGNode>> _forwardOnlyTransitiveClosure;

        private DynamicDictionary<CFGNode, Set<CFGNode>> _transitiveClosure;
        public DynamicDictionary<CFGNode, Set<CFGNode>> TransitiveClosure
        {
            get { return _transitiveClosure; }
            set { _transitiveClosure = value; }
        }

        public Dictionary<CFGNode, CFGNode> ImmediateDominator
        {
            get
            {
                return _immediateDominator;
            }
        }
        private Dictionary<CFGNode, CFGNode> _immediateDominator = new Dictionary<CFGNode, CFGNode>();

        public Dictionary<CFGNode, CFGNodeSet> Dominators
        {
            get
            {
                return _dominators;
            }
        }
        private Dictionary<CFGNode, CFGNodeSet> _dominators = new Dictionary<CFGNode, CFGNodeSet>();

        private Dictionary<CFGNode, CFGNodeSet> _dominatorFrontier = new Dictionary<CFGNode, CFGNodeSet>();
        public Dictionary<CFGNode, CFGNodeSet> DominatorFrontier
        {
            get { return _dominatorFrontier; }
        }

        public DynamicDictionary<CFGNode, Set<string>> Defined
        {
            get
            {
                return _defined;
            }
        }
        private DynamicDictionary<CFGNode, Set<string>> _defined = new DynamicDictionary<CFGNode, Set<string>>();

        public DynamicDictionary<CFGNode, Set<string>> Used
        {
            get
            {
                return _used;
            }
        }
        private DynamicDictionary<CFGNode, Set<string>> _used = new DynamicDictionary<CFGNode, Set<string>>();

        public DynamicDictionary<CFGNode, Set<string>> LiveVariablesIn
        {
            get
            {
                return _liveVariablesIn;
            }
        }
        private DynamicDictionary<CFGNode, Set<string>> _liveVariablesIn = new DynamicDictionary<CFGNode, Set<string>>();

        public DynamicDictionary<CFGNode, Set<string>> LiveVariablesOut
        {
            get
            {
                return _liveVariablesOut;
            }
        }
        private DynamicDictionary<CFGNode, Set<string>> _liveVariablesOut = new DynamicDictionary<CFGNode, Set<string>>();

        public DynamicDictionary<CFGNode, Set<Definition>> ReachingDefinitions
        {
            get
            {
                return _reachingDefinitions;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _reachingDefinitions = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> GeneratedDefinitions
        {
            get
            {
                return _generatedDefinitions;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _generatedDefinitions = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> KilledDefinitions
        {
            get
            {
                return _killedDefinitions;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _killedDefinitions = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> LiveExpressionsIn
        {
            get
            {
                return _liveExpressionsIn;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _liveExpressionsIn = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> LiveExpressionsOut
        {
            get
            {
                return _liveExpressionsOut;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _liveExpressionsOut = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> GeneratedExpressions
        {
            get
            {
                return _generatedExpressions;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _generatedExpressions = new DynamicDictionary<CFGNode, Set<Definition>>();

        public DynamicDictionary<CFGNode, Set<Definition>> KilledExpressions
        {
            get
            {
                return _killedExpressions;
            }
        }
        private DynamicDictionary<CFGNode, Set<Definition>> _killedExpressions = new DynamicDictionary<CFGNode, Set<Definition>>();

        public List<TryBlockInfo> TryBlockInfos
        {
            get
            {
                return _tryBlockInfos;
            }
        }
        private List<TryBlockInfo> _tryBlockInfos = new List<TryBlockInfo>();

        public Set<CFGNode> Roots
        {
            get
            {
                // TODO: rather than calculating this everytime, have the basic middle end calculate it only when it is dirty
                Set<CFGNode> roots = new Set<CFGNode>(_cfg.Root);
                foreach (TryBlockInfo tryBlockInfo in _tryBlockInfos)
                {
                    if (tryBlockInfo.ConsolidatedCatchBlock != null)
                    {
                        roots.Add(tryBlockInfo.ConsolidatedCatchBlock.Start);
                    }
                    if (tryBlockInfo.FinallyBlock != null)
                    {
                        roots.Add(tryBlockInfo.FinallyBlock.Start);
                    }
                }
                return roots;
            }
        }

        public int MaxRegisters
        {
            get { return _maxRegisters; }
            set { _maxRegisters = value; }
        }
        private int _maxRegisters = 100; // TODO: Set max registers

        private Set<CFGNode> _phiNodes = new Set<CFGNode>();
        public Set<CFGNode> PhiNodes
        {
            get { return _phiNodes; }
            set
            {
                _phiNodes = value;
            }
        }

        public Dictionary<string, int> RegisterMap
        {
            get
            {
                if (_registerMap == null)
                {
                    _registerMap = new Dictionary<string, int>();
                }
                return _registerMap;
            }
        }
        private Dictionary<string, int> _registerMap;

        public Dictionary<string, int> LocalMap
        {
            get
            {
                if (_localMap == null)
                {
                    _localMap = new Dictionary<string, int>();
                }
                return _localMap;
            }
        }
        private Dictionary<string, int> _localMap;

        private CFG _cfg;
        public CFG CFG
        {
            get { return _cfg; }
            set { _cfg = value; }
        }

        private IBlockStatement _codeObject;
        public IBlockStatement CodeObject
        {
            get { return _codeObject; }
            set { _codeObject = value; }
        }

        public AssemblyCompileInfo AssemblyCompileInfo
        {
            get;
            set;
        }

        public Set<Type> ConsistentTransformationTypes
        {
            get
            {
                return _consistentTransformationTypes;
            }
            set
            {
                _consistentTransformationTypes = value;
            }
        }
        private Set<Type> _consistentTransformationTypes = new Set<Type>();

        private int _variableCounter = 0;

        public MethodCompileInfo(MethodDefinition method, AssemblyCompileInfo assemblyCompileInfo)
        {
            _method = method;
            AssemblyCompileInfo = assemblyCompileInfo;
        }

        public VariableDefinition NewFrozen(TypeReference variableType)
        {
            VariableDefinition variableDefinition = new VariableDefinition(
                "$tf" + (_variableCounter++),
                -1,
                Method,
                variableType
            );
            return variableDefinition;
        }
        public VariableDefinition NewTemporary(TypeReference variableType)
        {
            VariableDefinition variableDefinition = new VariableDefinition(
                "$t" + (_variableCounter++),
                -1,
                Method,
                variableType
            );
            return variableDefinition;
        }
        public bool IsTemporary(VariableReference variableReference)
        {
            return IsTemporary(variableReference.Name);
        }
        public bool IsTemporary(string variableName)
        {
            return variableName.StartsWith("$t");
        }
        public bool IsFrozen(VariableReference variableReference)
        {
            return variableReference.Name.StartsWith("$tf");
        }

        // TODO: Move ReplaceRoot into BasicMiddleEnd - MethodCompileInfo should only contain state information, and compiler tiers should manipulate that state
        public void ReplaceRoot(CFGNode root, CFGNode replacement)
        {
            if (_cfg.Root == root)
            {
                _cfg.Root = replacement;
            }
            else
            {
                foreach (TryBlockInfo tryBlockInfo in _tryBlockInfos)
                {
                    foreach (CFGNodeCluster handlerCluster in tryBlockInfo.Handlers.Keys)
                    {
                        if (handlerCluster.Start == root)
                        {
                            handlerCluster.Start = replacement;
                        }
                    }
                }
            }
        }

        public override string ToString()
        {
            return Method.ToString();
        }
    }
}