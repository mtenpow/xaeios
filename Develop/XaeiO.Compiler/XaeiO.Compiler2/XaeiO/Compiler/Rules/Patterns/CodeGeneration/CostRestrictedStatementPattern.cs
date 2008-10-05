using System;
using System.Collections.Generic;
using System.Text;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler.Rules.Patterns.CodeGeneration
{
	public class CostRestrictedStatementPattern : StatementPattern
    {
        public override int Cost
        {
            get
            {
                System.Diagnostics.Debug.Assert(IsMatched);
                if (StatementPattern == null)
                {
                    return _cost;
                }
                else
                {
                    return StatementPattern.Cost;
                }
            }
        }
        private int _cost;

        private int _maxCost = int.MaxValue;
        public int MaxCost
        {
            get { return _maxCost; }
            set { _maxCost = value; }
        }

        private CodeGenerationPattern StatementPattern;

        private ConditionStatementPattern ConditionStatementPattern
        {
            get
            {
                if (_conditionStatementPattern == null)
                {
                    _conditionStatementPattern = new ConditionStatementPattern(CompileInfo);
                    _conditionStatementPattern.Matched += MatchedHandler;
                }
                return _conditionStatementPattern;
            }
        }

        void MatchedHandler(object sender, PatternMatchEventArgs<CFGPatternMatch> args)
        {
            MatchedNodes = args.Match.MatchedNodes;
        }
        private ConditionStatementPattern _conditionStatementPattern;

        private WhileStatementPattern WhileStatementPattern
        {
            get
            {
                if (_whileStatementPattern == null)
                {
                    _whileStatementPattern = new WhileStatementPattern(CompileInfo);
                    _whileStatementPattern.Matched += MatchedHandler;
                }
                return _whileStatementPattern;
            }
        }
        private WhileStatementPattern _whileStatementPattern;

        private SwitchStatementPattern SwitchStatementPattern
        {
            get
            {
                if (_switchStatementPattern == null)
                {
                    _switchStatementPattern = new SwitchStatementPattern(CompileInfo);
                    _switchStatementPattern.Matched += MatchedHandler;
                }
                return _switchStatementPattern;
            }
        }
        private SwitchStatementPattern _switchStatementPattern;

        private DoStatementPattern DoStatementPattern
        {
            get
            {
                if (_doStatementPattern == null)
                {
                    _doStatementPattern = new DoStatementPattern(CompileInfo);
                    _doStatementPattern.Matched += MatchedHandler;
                }
                return _doStatementPattern;
            }
        }
        private DoStatementPattern _doStatementPattern;

        public CostRestrictedStatementPattern(MethodCompileInfo compileInfo)
            : base(compileInfo)
        {
        }

        private Set<CFGNode> MatchedNodes;
        public override bool Match(CFGNode target)
        {
            IsMatched = false;

            DoStatementPattern.WorkingSet = WorkingSet;
            if (DoStatementPattern.Match(target) && DoStatementPattern.Cost < MaxCost)
            {
                StatementPattern = DoStatementPattern;
                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;
                return true;
            }

            WhileStatementPattern.WorkingSet = WorkingSet;
            if (WhileStatementPattern.Match(target) && WhileStatementPattern.Cost < MaxCost)
            {
                StatementPattern = WhileStatementPattern;
                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;
                return true;
            }

            SwitchStatementPattern.WorkingSet = WorkingSet;
            if (SwitchStatementPattern.Match(target) && SwitchStatementPattern.Cost < MaxCost)
            {
                StatementPattern = SwitchStatementPattern;
                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;
                return true;
            }

            ConditionStatementPattern.WorkingSet = WorkingSet;
            if (ConditionStatementPattern.Match(target) && ConditionStatementPattern.Cost < MaxCost)
            {
                StatementPattern = ConditionStatementPattern;
                OnMatched(new CFGPatternMatch(MatchedNodes));
                IsMatched = true;
                return true;
            }

            if (target.BasicBlock.Statements.Count > 0)
            {
                if ((target.FlowControl != FlowControl.Branch && target.FlowControl != FlowControl.ConditionalBranch))
                {
                    IStatement statement = target.BasicBlock.Statements[0] as IStatement;
                    if (statement != null)
                    {
                        StatementPattern = null;
                        _cost = 1;
                        MatchedStatement = statement;
                        OnMatched(new CFGPatternMatch(target));
                        IsMatched = true;
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else
            {
                StatementPattern = null;
                _cost = 0;
                MatchedStatement = new NopStatement();
                OnMatched(new CFGPatternMatch(target));
                IsMatched = true;
                return true;
            }

            return false;
        }
        private IStatement MatchedStatement;
        public override ICodeObject GenerateCode()
        {
            System.Diagnostics.Debug.Assert(IsMatched);
            if (StatementPattern == null)
            {
                return MatchedStatement;
            }
            else
            {
                return StatementPattern.GenerateCode();
            }
        }
	}
}
