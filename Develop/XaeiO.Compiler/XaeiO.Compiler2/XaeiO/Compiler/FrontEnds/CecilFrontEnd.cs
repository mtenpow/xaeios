using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using Mono.Cecil;
using Mono.Cecil.Cil;

using XaeiO.Compiler.CodeModel;

using Tenpow.Collections.Generic;

// TODO: Make sure ints dont get converted to boolean.  Ref<int>(0) should not because Ref<int>(false)
// TODO: Get rid of recurse with FollowControlPath, pass the state in some object.  Complex control flow could cause StackOverflowExceptions

namespace XaeiO.Compiler.FrontEnds
{
    public class CecilFrontEnd : CompilerTierBase, IFrontEnd
    {
        MethodCompileInfo _methodCompileInfo;
        CFG _cfg;
        MethodDefinition _methodDefinition;
        MethodBody _body;
        Dictionary<Instruction, CFGNodeCluster> _instructionMap;
        Dictionary<Instruction, ExceptionHandler> _handlerStarts;
        Stack<IExpression> _evaluationStack;
        Set<Instruction> _instructionsWithMultiplePredecessors;
        Set<CFGNode> _stackAlignmentNodes;

        #region IFrontEnd Members

        public void BuildCFG(AssemblyCompileInfo assemblyCompileInfo)
        {
            if (Compiler.Options.IncrementalCompilation)
            {
                // skip transformation if incremental compile info state is available
                if (Compiler.IncrementalCompilationState.ContainsValidPersistedState(assemblyCompileInfo.Assembly))
                {
                    Console.WriteLine("Skipping {0} in the front end because it has already been compiled", assemblyCompileInfo.Assembly);
                    // TODO: Instead of just returning, populate the properties object with the output of the front end
                    return;
                }
            }
            foreach (MethodCompileInfo methodCompileInfo in assemblyCompileInfo.MethodCompileInfos.Values)
            {
                try
                {
                    if (methodCompileInfo.Method.RVA.Value != 0) // can't compile extern methods
                    {
                        BuildCFG(methodCompileInfo);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Front end unable to build CFG for method: " + methodCompileInfo.Method);
                    Console.WriteLine(e);
                    throw;
                }
            }
        }

        public void BuildCFG(MethodCompileInfo compileInfo)
        {
            if (Compiler.Options.Verbocity > 0)
            {
                Console.WriteLine("CecilFrontEnd: " + compileInfo.Method);
            }
            _methodCompileInfo = compileInfo;

            _methodDefinition = compileInfo.Method;
            _body = _methodDefinition.Body;
            _cfg = new CFG();

            _instructionMap = new Dictionary<Instruction, CFGNodeCluster>();
            _handlerStarts = new Dictionary<Instruction, ExceptionHandler>();
            Dictionary<Instruction, ExceptionHandler> finallyStarts = new Dictionary<Instruction, ExceptionHandler>();
            _instructionsWithMultiplePredecessors = new Set<Instruction>();
            _stackAlignmentNodes = new Set<CFGNode>();
            Set<Instruction> hasPredecessor = new Set<Instruction>();

            // find instructions with multiple predecessors
            foreach (Instruction instr in _body.Instructions)
            {
                switch (instr.OpCode.FlowControl)
                {
                    case Mono.Cecil.Cil.FlowControl.Next:
                        {
                            if (hasPredecessor.Contains(instr.Next))
                            {
                                _instructionsWithMultiplePredecessors.Add(instr.Next);
                            }
                            else
                            {
                                hasPredecessor.Add(instr.Next);
                            }
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Branch:
                        {
                            if (hasPredecessor.Contains((Instruction)instr.Operand))
                            {
                                _instructionsWithMultiplePredecessors.Add((Instruction)instr.Operand);
                            }
                            else
                            {
                                hasPredecessor.Add((Instruction)instr.Operand);
                            }
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Cond_Branch:
                        {
                            if (hasPredecessor.Contains(instr.Next))
                            {
                                _instructionsWithMultiplePredecessors.Add(instr.Next);
                            }
                            else
                            {
                                hasPredecessor.Add(instr.Next);
                            }

                            Instruction branchTarget = instr.Operand as Instruction;
                            if (branchTarget != null)
                            {
                                if (hasPredecessor.Contains(branchTarget))
                                {
                                    _instructionsWithMultiplePredecessors.Add(branchTarget);
                                }
                                else
                                {
                                    hasPredecessor.Add(branchTarget);
                                }
                            }
                            else
                            {
                                Instruction[] switchTargets = instr.Operand as Instruction[];
                                if (switchTargets != null)
                                {
                                    throw new NotImplementedException("Switch is not yet supported");
                                }
                                else
                                {
                                    throw new CompilerException("Unable to follow conditional branch flow");
                                }
                            }
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Call:
                        {
                            if (hasPredecessor.Contains(instr.Next))
                            {
                                _instructionsWithMultiplePredecessors.Add(instr.Next);
                            }
                            else
                            {
                                hasPredecessor.Add(instr.Next);
                            }
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Return:
                        {
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Throw:
                        {
                            break;
                        }
                    default:
                        {
                            throw new CompilerException("Invalid FlowControl");
                        }
                }
            }

            // find beginnings of filter/catch/finally clauses
            foreach (ExceptionHandler handler in _body.ExceptionHandlers)
            {
                switch (handler.Type)
                {
                    case ExceptionHandlerType.Catch:
                        {
                            _handlerStarts.Add(handler.HandlerStart, handler);
                            break;
                        }
                    case ExceptionHandlerType.Fault:
                        {
                            throw new NotImplementedException();
                        }
                    case ExceptionHandlerType.Filter:
                        {
                            _handlerStarts.Add(handler.FilterStart, handler);
                            break;
                        }
                    case ExceptionHandlerType.Finally:
                        {
                            finallyStarts.Add(handler.HandlerStart, handler);
                            break;
                        }
                    default:
                        {
                            throw new CompilerException("Invalid exception handler type: " + handler.Type);
                        }
                }
            }

            if (DebugSettings.FrontEndGraph)
            {
                new XaeiO.Compiler.Helpers.CFGRenderer(_cfg, _methodCompileInfo).Render("frontend-initial.png");
            }

            // start at the first instruction and follow the control path to build the CFG
            // most of the work is done here
            FollowControlFlowPath(new Stack<IExpression>(), _body.Instructions[0]);

            if (DebugSettings.FrontEndGraph)
            {
                new XaeiO.Compiler.Helpers.CFGRenderer(_cfg, _methodCompileInfo).Render("frontend-follow-root.png");
            }

            // add left over instructions to the CFG - these are typically catch/finally clauses that aren't explicitly branched to in IL code
            foreach (Instruction instr in _body.Instructions)
            {
                FollowControlFlowPath(new Stack<IExpression>(), instr);
            }

            if (DebugSettings.FrontEndGraph)
            {
                new XaeiO.Compiler.Helpers.CFGRenderer(_cfg, _methodCompileInfo).Render("frontend-follow-remainder.png");
            }

            // set up TryBlockInfos
            Dictionary<CFGNode, TryBlockInfo> tryBlockInfoMap = new Dictionary<CFGNode,TryBlockInfo>();

            // set up handlers - we also set up the associated TryBlockInfos here and add them to the MethodCompileInfo
            foreach (KeyValuePair<Instruction, ExceptionHandler> handlerStart in _handlerStarts)
            {
                CFGNode tryStartNode = GetMappedCFGNodeCluster(handlerStart.Value.TryStart).Start;

                TryBlockInfo tryBlockInfo;
                if (!tryBlockInfoMap.TryGetValue(tryStartNode, out tryBlockInfo))
                {
                    tryBlockInfo = new TryBlockInfo();
                    tryBlockInfo.TryBlock = new CFGNodeCluster();
                    tryBlockInfo.TryBlock.Start = tryStartNode;
                    tryBlockInfo.TryBlock.End = GetMappedCFGNodeCluster(handlerStart.Value.TryEnd.Previous).End;

                    _methodCompileInfo.TryBlockInfos.Add(tryBlockInfo);

                    tryBlockInfoMap[tryStartNode] = tryBlockInfo;
                }

                // add the handler to the tryBlockInfo
                tryBlockInfo.Handlers.Add(
                    new CFGNodeCluster(
                        GetMappedCFGNodeCluster(handlerStart.Value.HandlerStart),
                        GetMappedCFGNodeCluster(handlerStart.Value.HandlerEnd.Previous)
                    ),
                    handlerStart.Value
                );
            }

            // set up finally blocks - we also implicity set up the associated TryBlockInfos here (if they haven't already been set up by a handler)
            foreach (KeyValuePair<Instruction, ExceptionHandler> finallyStart in finallyStarts)
            {
                CFGNode tryStartNode = GetMappedCFGNodeCluster(finallyStart.Value.TryStart).Start;

                TryBlockInfo tryBlockInfo;
                if (!tryBlockInfoMap.TryGetValue(tryStartNode, out tryBlockInfo))
                {

                    tryBlockInfo = new TryBlockInfo();
                    tryBlockInfo.TryBlock = new CFGNodeCluster();
                    tryBlockInfo.TryBlock.Start = tryStartNode;
                    tryBlockInfo.TryBlock.End = GetMappedCFGNodeCluster(finallyStart.Value.TryEnd.Previous).End;

                    _methodCompileInfo.TryBlockInfos.Add(tryBlockInfo);

                    tryBlockInfoMap[tryStartNode] = tryBlockInfo;
                }

                tryBlockInfo.FinallyBlock = new CFGNodeCluster(
                    GetMappedCFGNodeCluster(finallyStart.Value.HandlerStart),
                    GetMappedCFGNodeCluster(finallyStart.Value.HandlerEnd.Previous)
                );
            }

            // add branch edges
            foreach (Instruction instr in _body.Instructions)
            {
                CFGNodeCluster cluster = GetMappedCFGNodeCluster(instr);

                switch (instr.OpCode.FlowControl)
                {
                    case Mono.Cecil.Cil.FlowControl.Next:
                        {
                            cluster.End.FlowControl = FlowControl.Next;
                            AddEdge(cluster.End, GetMappedCFGNodeCluster(instr.Next).Start);
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Branch:
                        {
                            cluster.End.FlowControl = FlowControl.Branch;
                            AddEdge(cluster.End, GetMappedCFGNodeCluster((Instruction)instr.Operand).Start);
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Cond_Branch:
                        {
                            CFGNode current = cluster.End;
                            Debug.Assert(cluster.End.BasicBlock.Statements.Count == 1);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = (ConditionalBranchExpressionStatement)cluster.End.BasicBlock.Statements[0];
                            cluster.End.FlowControl = FlowControl.ConditionalBranch;
                            CFGEdge falseEdge = AddEdge(cluster.End, GetMappedCFGNodeCluster(instr.Next).Start);
                            falseEdge.BranchCondition = new BranchCondition(BranchConditionType.False);
                            falseEdge.BranchCondition.Data = conditionalBranchExpressionStatement;
                            CFGEdge trueEdge = AddEdge(cluster.End, GetMappedCFGNodeCluster((Instruction)instr.Operand).Start);
                            trueEdge.BranchCondition = new BranchCondition(BranchConditionType.True);
                            trueEdge.BranchCondition.Data = conditionalBranchExpressionStatement;
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Call:
                        {
                            cluster.End.FlowControl = FlowControl.Call;
                            AddEdge(cluster.End, GetMappedCFGNodeCluster(instr.Next).Start);
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Return:
                        {
                            cluster.End.FlowControl = FlowControl.Return;
                            break;
                        }
                    case Mono.Cecil.Cil.FlowControl.Throw:
                        {
                            cluster.End.FlowControl = FlowControl.Throw;
                            break;
                        }
                    default:
                        {
                            throw new CompilerException("Invalid FlowControl");
                        }
                }
            }

            if (DebugSettings.FrontEndGraph)
            {
                new XaeiO.Compiler.Helpers.CFGRenderer(_cfg, _methodCompileInfo).Render("frontend-final.png");
            }
            _cfg.Root = GetMappedCFGNodeCluster(_body.Instructions[0]).Start;
            _methodCompileInfo.CFG = _cfg;
        }

        #endregion

        public CecilFrontEnd()
            : base()
        {
        }


        private void FollowControlFlowPath(Stack<IExpression> evaluationStack, Instruction instr, CFGNodeCluster predecessorCluster)
        {
            CFGNodeCluster preamble = null;
            bool preambleExists = false;
            if (_instructionsWithMultiplePredecessors.Contains(instr) && evaluationStack.Count > 0)
            {
                // this instruction has multiple predecessors
                // so pop everything off the stack
                // and put them into special temporaries so that all control flow paths have a merged stack
                Stack<IExpression> newEvaluationStack = new Stack<IExpression>();
                int i = 0;
                foreach (IExpression expression in evaluationStack)
                {
                    TypeReference type = expression.Type;
                    Definition definition = new Definition(
                        new VariableDefinition(
                            "$ts" + (i++),
                            -1,
                            _methodCompileInfo.Method,
                            new TypeReference(
                                type.Name,
                                type.Namespace,
                                type.Scope,
                                type.IsValueType
                            )
                        ),
                        expression
                    );
                    newEvaluationStack.Push(definition.Target);
                    if (!preambleExists)
                    {
                        CFGNode newNode = AddNode(definition);
                        newNode.FlowControl = FlowControl.Next;
                        preamble = (CFGNodeCluster)newNode;
                        preambleExists = true;
                    }
                    else
                    {
                        CFGNode newNode = AddNode(definition);
                        newNode.FlowControl = FlowControl.Next;
                        AddEdge(preamble.End, newNode);
                        preamble.End = newNode;
                    }
                }
                evaluationStack = newEvaluationStack;
                if (predecessorCluster.End.BasicBlock.Statements.Count == 1 && predecessorCluster.End.BasicBlock.Statements[0] is ConditionalBranchExpressionStatement)
                {
                    CFGNode secondToLastNode;
                    if (predecessorCluster.Start == predecessorCluster.End)
                    {
                        secondToLastNode = AddNode();
                        AddEdge(secondToLastNode, predecessorCluster.End);
                        predecessorCluster.Start = secondToLastNode;
                    }
                    else
                    {
                        secondToLastNode = predecessorCluster.End.Predecessors[0];
                    }
                    Set<CFGEdge> outEdges = new Set<CFGEdge>();
                    foreach (CFGEdge edge in _cfg.OutEdges(secondToLastNode))
                    {
                        outEdges.Add(edge);
                        AddEdge(preamble.End, edge.Target);
                    }
                    foreach (CFGEdge edge in outEdges)
                    {
                        _cfg.RemoveEdge(edge);
                    }
                    AddEdge(secondToLastNode, preamble.Start);
                }
                else
                {
                    Set<CFGEdge> outEdges = new Set<CFGEdge>();
                    foreach (CFGEdge edge in _cfg.OutEdges(predecessorCluster.End))
                    {
                        outEdges.Add(edge);
                        AddEdge(preamble.End, edge.Target);
                    }
                    foreach (CFGEdge edge in outEdges)
                    {
                        _cfg.RemoveEdge(edge);
                    }
                    AddEdge(predecessorCluster.End, preamble.Start);
                    predecessorCluster.End = preamble.End;
                }
            }
            FollowControlFlowPath(evaluationStack, instr);
        }
        private void FollowControlFlowPath(Stack<IExpression> evaluationStack, Instruction instr)
        {
            Stack<IExpression> oldEvaluationStack = _evaluationStack;
            _evaluationStack = evaluationStack;
            try
            {
                CFGNodeCluster cluster;
                if (TryGetMappedCFGNodeCluster(instr, out cluster))
                {
                    return;
                }

                ExceptionHandler handler;
                CFGNode preamble = null;
                if (_handlerStarts.TryGetValue(instr, out handler))
                {
                    if (handler.Type == ExceptionHandlerType.Catch)
                    {
                        preamble = AddNewTemporaryDefinitionNode(new ExceptionExpression());
                    }

                    // TODO: Filter handler type
                }
                switch (instr.OpCode.Code)
                {
                    case Code.Add:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Add, right));

                            break;
                        }
                    case Code.Add_Ovf:
                        {
                            // TODO: Check overflow
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Add, right));

                            break;
                        }
                    case Code.And:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.BitwiseAnd, right));

                            break;
                        }
                    case Code.Beq:
                    case Code.Beq_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.ValueEquality, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Bge:
                    case Code.Bge_S:
                    case Code.Bge_Un:
                    case Code.Bge_Un_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.GreaterThanOrEqual, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Bgt:
                    case Code.Bgt_S:
                    case Code.Bgt_Un:
                    case Code.Bgt_Un_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.GreaterThan, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Ble:
                    case Code.Ble_S:
                    case Code.Ble_Un:
                    case Code.Ble_Un_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.LessThanOrEqual, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Blt:
                    case Code.Blt_S:
                    case Code.Blt_Un:
                    case Code.Blt_Un_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.LessThan, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Bne_Un:
                    case Code.Bne_Un_S:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.ValueInequality, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionalBranchExpressionStatement conditionalBranchExpressionStatement = new ConditionalBranchExpressionStatement(StackPop());
                            CFGNode conditionalBranchExpressionStatementNode = AddNode(conditionalBranchExpressionStatement);

                            AddEdge(binaryExpressionNode, conditionalBranchExpressionStatementNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionalBranchExpressionStatementNode;

                            break;
                        }
                    case Code.Box:
                        {
                            IExpression expressionToBox = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BoxExpression(expressionToBox, (TypeReference)instr.Operand));
                            break;
                        }
                    case Code.Br:
                    case Code.Br_S:
                        {
                            // front end flow control takes care of branching
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Brfalse:
                    case Code.Brfalse_S:
                        {
                            // front end flow control takes care of branching
                            cluster = (CFGNodeCluster)AddNode(new ConditionalBranchExpressionStatement(new UnaryExpression(StackPop(), UnaryOperator.BooleanNot)));
                            break;
                        }
                    case Code.Brtrue:
                    case Code.Brtrue_S:
                        {
                            // front end flow control takes care of branching
                            cluster = (CFGNodeCluster)AddNode(new ConditionalBranchExpressionStatement(StackPop()));
                            break;
                        }
                    case Code.Call:
                    case Code.Callvirt:
                        {
                            // TODO: .calli
                            MethodReference methodReference = (MethodReference)instr.Operand;
                            List<IExpression> arguments = new List<IExpression>();
                            for (int i = 0; i < methodReference.Parameters.Count; i++)
                            {
                                arguments.Add(StackPop());
                            }
                            arguments.Reverse();
                            IExpression targetExpression;
                            if (methodReference.HasThis)
                            {
                                targetExpression = StackPop();
                            }
                            else
                            {
                                ITypeReferenceExpression typeReferenceExpression = new TypeReferenceExpression(methodReference.DeclaringType);
                                targetExpression = typeReferenceExpression;
                            }
                            IMethodReferenceExpression methodReferenceExpression = new MethodReferenceExpression(targetExpression, methodReference, instr.OpCode.Name == "callvirt");
                            MethodInvokeExpression methodInvokeExpression = new MethodInvokeExpression(methodReferenceExpression);
                            foreach (IExpression argument in arguments)
                            {
                                methodInvokeExpression.Arguments.Add(argument);
                            }
                            if (CoreTypes.IsVoid(methodReference.ReturnType.ReturnType))
                            {
                                cluster = (CFGNodeCluster)AddNode(new ExpressionStatement(methodInvokeExpression));
                            }
                            else
                            {
                                cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(methodInvokeExpression);
                            }
                            break;
                        }
                    case Code.Castclass:
                        {
                            IExpression expression = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new CastExpression(expression, (TypeReference)instr.Operand));

                            break;
                        }
                    case Code.Ceq:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.ValueEquality, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionExpression conditionExpression = new ConditionExpression(StackPop(), new Int32LiteralExpression(1), new Int32LiteralExpression(0));
                            CFGNode conditionExpressionNode = AddNewTemporaryDefinitionNode(conditionExpression);

                            AddEdge(binaryExpressionNode, conditionExpressionNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionExpressionNode;

                            break;
                        }
                    case Code.Cgt:
                    case Code.Cgt_Un:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.GreaterThan, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionExpression conditionExpression = new ConditionExpression(StackPop(), new Int32LiteralExpression(1), new Int32LiteralExpression(0));
                            CFGNode conditionExpressionNode = AddNewTemporaryDefinitionNode(conditionExpression);

                            AddEdge(binaryExpressionNode, conditionExpressionNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionExpressionNode;

                            break;
                        }
                    case Code.Clt:
                    case Code.Clt_Un:
                        {
                            cluster = new CFGNodeCluster();

                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            BinaryExpression binaryExpression = new BinaryExpression(left, BinaryOperator.LessThan, right);
                            CFGNode binaryExpressionNode = AddNewTemporaryDefinitionNode(binaryExpression);
                            ConditionExpression conditionExpression = new ConditionExpression(StackPop(), new Int32LiteralExpression(1), new Int32LiteralExpression(0));
                            CFGNode conditionExpressionNode = AddNewTemporaryDefinitionNode(conditionExpression);

                            AddEdge(binaryExpressionNode, conditionExpressionNode);

                            cluster.Start = binaryExpressionNode;
                            cluster.End = conditionExpressionNode;

                            break;
                        }
                    case Code.Constrained:
                        {
                            // TODO: .constrained?
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Conv_I4:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new CastExpression(expression, CoreTypes.Int32));
                            break;
                        }
                    case Code.Conv_I8:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new CastExpression(expression, CoreTypes.Int64));
                            break;
                        }
                    case Code.Conv_R4:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new CastExpression(expression, CoreTypes.Single));
                            break;
                        }
                    case Code.Conv_R8:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new CastExpression(expression, CoreTypes.Double));
                            break;
                        }
                    case Code.Div:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Divide, right));

                            break;
                        }
                    case Code.Dup:
                        {
                            IExpression expression = StackPop();

                            cluster = (CFGNodeCluster)AddNewFrozenDefinitionNode(expression);
                            expression = StackPop();
                            StackPush(expression);
                            StackPush(expression);

                            break;
                        }
                    case Code.Endfinally:
                        {
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Isinst:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new TryCastExpression(expression, (TypeReference)instr.Operand));
                            break;
                        }
                    case Code.Initobj:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNode(new ExpressionStatement(new ObjectInitializeExpression(expression, (TypeReference)instr.Operand)));
                            break;
                        }
                    case Code.Ldarg_0:
                        {
                            if (_body.Method.HasThis)
                            {
                                cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ThisReferenceExpression(_body.Method.DeclaringType));
                            }
                            else
                            {
                                cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression(_methodDefinition.Parameters[0]));
                            }
                            break;
                        }
                    case Code.Ldarg_1:
                        {
                            int index = _body.Method.HasThis ? 0 : 1;
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression(_methodDefinition.Parameters[index]));
                            break;
                        }
                    case Code.Ldarg_2:
                        {
                            int index = _body.Method.HasThis ? 1 : 2;
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression(_methodDefinition.Parameters[index]));
                            break;
                        }
                    case Code.Ldarg_3:
                        {
                            int index = _body.Method.HasThis ? 2 : 3;
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression(_methodDefinition.Parameters[index]));
                            break;
                        }
                    case Code.Ldarg_S:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression((ParameterReference)instr.Operand));
                            break;
                        }
                    case Code.Ldarga:
                    case Code.Ldarga_S:
                        {
                            // TODO: box value types?
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArgumentReferenceExpression((ParameterReference)instr.Operand));
                            break;
                        }
                    case Code.Ldc_I4:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression((Int32)instr.Operand));
                            break;
                        }
                    case Code.Ldc_I4_0:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(0));
                            break;
                        }
                    case Code.Ldc_I4_1:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(1));
                            break;
                        }
                    case Code.Ldc_I4_2:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(2));
                            break;
                        }
                    case Code.Ldc_I4_3:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(3));
                            break;
                        }
                    case Code.Ldc_I4_4:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(4));
                            break;
                        }
                    case Code.Ldc_I4_5:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(5));
                            break;
                        }
                    case Code.Ldc_I4_6:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(6));
                            break;
                        }
                    case Code.Ldc_I4_7:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(7));
                            break;
                        }
                    case Code.Ldc_I4_8:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(8));
                            break;
                        }
                    case Code.Ldc_I4_M1:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression(-1));
                            break;
                        }
                    case Code.Ldc_I4_S:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int32LiteralExpression((sbyte)instr.Operand));
                            break;
                        }
                    case Code.Ldc_I8:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Int64LiteralExpression((Int64)instr.Operand));
                            break;
                        }
                    case Code.Ldc_R4:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Float32LiteralExpression((float)instr.Operand));
                            break;
                        }
                    case Code.Ldc_R8:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new Float64LiteralExpression((double)instr.Operand));
                            break;
                        }
                    case Code.Ldelem_Any:
                    case Code.Ldelem_I:
                    case Code.Ldelem_I1:
                    case Code.Ldelem_I2:
                    case Code.Ldelem_I4:
                    case Code.Ldelem_I8:
                    case Code.Ldelem_R4:
                    case Code.Ldelem_R8:
                    case Code.Ldelem_U1:
                    case Code.Ldelem_U2:
                    case Code.Ldelem_U4:
                    case Code.Ldelem_Ref:
                        {
                            IExpression index = this.StackPop();
                            IExpression array = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArrayIndexerExpression(array, index));
                            break;
                        }
                    case Code.Ldelema:
                        {
                            // TODO: box value types?
                            IExpression index = this.StackPop();
                            IExpression array = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArrayIndexerExpression(array, index));
                            break;
                        }
                    case Code.Ldfld:
                        {
                            IExpression target = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new FieldReferenceExpression(target, (FieldReference)instr.Operand));
                            break;
                        }
                    case Code.Ldflda:
                        {
                            // TODO: Not too sure if ldflda is the same as ldfld for us
                            IExpression target = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new FieldReferenceExpression(target, (FieldReference)instr.Operand));
                            break;
                        }
                    case Code.Ldftn:
                        {
                            MethodReference methodReference = (MethodReference)instr.Operand;
                            IExpression target = new TypeReferenceExpression(methodReference.DeclaringType);
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new MethodReferenceExpression(target, methodReference));
                            break;
                        }
                    case Code.Ldind_I:
                    case Code.Ldind_I1:
                    case Code.Ldind_I2:
                    case Code.Ldind_I4:
                    case Code.Ldind_I8:
                    case Code.Ldind_R4:
                    case Code.Ldind_R8:
                    case Code.Ldind_Ref:
                    case Code.Ldind_U1:
                    case Code.Ldind_U2:
                    case Code.Ldind_U4:
                        {
                            // TODO: What is .ldind_X?
                            IExpression target = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(target);
                            break;
                        }
                    case Code.Ldlen:
                        {
                            IExpression target = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArrayLengthExpression(target));
                            break;
                        }
                    case Code.Ldobj:
                        {
                            // TODO: what is ldobj?
                            IExpression target = this.StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(target);
                            break;
                        }
                    case Code.Ldsfld:
                        {
                            FieldReference fieldReference = (FieldReference)instr.Operand;
                            FieldDefinition fieldDefinition = ReferenceResolver.ResolveFieldReference(fieldReference);
                            ITypeReferenceExpression target = new TypeReferenceExpression(fieldDefinition.DeclaringType);
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new FieldReferenceExpression(target, fieldReference));
                            break;
                        }
                    case Code.Ldsflda:
                        {
                            // TOOD: is ldsflda the same as ldsfld
                            FieldReference fieldReference = (FieldReference)instr.Operand;
                            FieldDefinition fieldDefinition = ReferenceResolver.ResolveFieldReference(fieldReference);
                            ITypeReferenceExpression target = new TypeReferenceExpression(fieldDefinition.DeclaringType);
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new AddressOfExpression(new FieldReferenceExpression(target, fieldReference)));
                            break;
                        }
                    case Code.Ldloc_0:
                        {
                            StackPush(new VariableReferenceExpression((VariableReference)_body.Variables[0]));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldloc_1:
                        {
                            StackPush(new VariableReferenceExpression((VariableReference)_body.Variables[1]));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldloc_2:
                        {
                            StackPush(new VariableReferenceExpression((VariableReference)_body.Variables[2]));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldloc_3:
                        {
                            StackPush(new VariableReferenceExpression((VariableReference)_body.Variables[3]));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldloc_S:
                        {
                            StackPush(new VariableReferenceExpression((VariableReference)instr.Operand));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldloca_S:
                        {
                            // TODO: .ldloca?
                            StackPush(new VariableReferenceExpression((VariableReference)instr.Operand));
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Ldnull:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new NullLiteralExpression());
                            break;
                        }
                    case Code.Ldstr:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new StringLiteralExpression((string)instr.Operand));
                            break;
                        }
                    case Code.Ldtoken:
                        {
                            IExpression expression = null;

                            TypeReference typeReference = instr.Operand as TypeReference;
                            if (typeReference != null)
                            {
                                expression = new TypeReferenceExpression(typeReference);
                            }
                            else
                            {
                                FieldReference fieldReference = instr.Operand as FieldReference;
                                if (fieldReference != null)
                                {
                                    // TODO: array init broken here?
                                    Console.WriteLine("ldtoken: " + instr.Operand + "!!!!!!!!!!!!!!!!!!!!!!!!!");
                                    Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                                    expression = new FieldReferenceExpression(new TypeReferenceExpression(fieldReference.DeclaringType), fieldReference);
                                }
                                else
                                {
                                    MethodReference methodReference = instr.Operand as MethodReference;
                                    if (methodReference != null)
                                    {
                                        expression = new MethodReferenceExpression(new TypeReferenceExpression(methodReference.DeclaringType), methodReference);
                                    }
                                }
                            }

                            if (expression == null)
                            {
                                throw new CompilerException("Unable to parse .ldtoken.  Unrecognized operand: " + instr.Operand);
                            }


                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(expression);
                            break;
                        }
                    case Code.Leave:
                    case Code.Leave_S:
                        {
                            // TODO: .leave? relevant to exception handling?
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Mul:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Multiply, right));
                            break;
                        }
                    case Code.Mul_Ovf:
                        {
                            // TODO: check overflow
                            IExpression right = StackPop();
                            IExpression left = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Multiply, right));
                            break;
                        }
                    case Code.Neg:
                        {
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new UnaryExpression(StackPop(), UnaryOperator.Negate));
                            break;
                        }
                    case Code.Newobj:
                        {
                            MethodReference methodReference = (MethodReference)instr.Operand;
                            List<IExpression> arguments = new List<IExpression>();
                            for (int i = 0; i < methodReference.Parameters.Count; i++)
                            {
                                arguments.Add(StackPop());
                            }
                            arguments.Reverse();
                            ObjectCreateExpression objectCreateExpression = new ObjectCreateExpression(methodReference);
                            foreach (IExpression argument in arguments)
                            {
                                objectCreateExpression.Arguments.Add(argument);
                            }
                            CFGNode start = AddNewTemporaryDefinitionNode(objectCreateExpression);

                            IExpression objectExpression = StackPop();

                            // now call constructor
                            IMethodReferenceExpression methodReferenceExpression = new MethodReferenceExpression(objectExpression, methodReference);
                            MethodInvokeExpression methodInvokeExpression = new MethodInvokeExpression(methodReferenceExpression);
                            foreach (IExpression argument in arguments)
                            {
                                methodInvokeExpression.Arguments.Add(argument);
                            }

                            CFGNode end = AddNode(new ExpressionStatement(methodInvokeExpression));
                            AddEdge(start, end);
                            cluster = new CFGNodeCluster(start, end);

                            StackPush(objectExpression);
                            break;
                        }
                    case Code.Newarr:
                        {
                            IExpression arrayLength = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new ArrayCreateExpression((TypeReference)instr.Operand, arrayLength));
                            break;
                        }
                    case Code.Nop:
                        {
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Or:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.BitwiseOr, right));

                            break;
                        }
                    case Code.Pop:
                        {
                            this.StackPop();
                            cluster = (CFGNodeCluster)AddNode(new NopStatement());
                            break;
                        }
                    case Code.Rem:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Modulus, right));
                            break;
                        }
                    case Code.Ret:
                        {
                            MethodReturnStatement methodReturnStatement;
                            if (CoreTypes.IsVoid(_body.Method.ReturnType.ReturnType))
                            {
                                methodReturnStatement = new MethodReturnStatement();
                            }
                            else
                            {
                                methodReturnStatement = new MethodReturnStatement(StackPop());
                            }
                            cluster = (CFGNodeCluster)AddNode(methodReturnStatement);
                            break;
                        }
                    case Code.Shl:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.ShiftLeft, right));

                            break;
                        }
                    case Code.Shr:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.ShiftRight, right));

                            break;
                        }
                    case Code.Starg:
                    case Code.Starg_S:
                        {
                            ParameterReference parameter = (ParameterReference)instr.Operand;
                            IArgumentReferenceExpression argumentReferenceExpression = new ArgumentReferenceExpression(parameter);
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(argumentReferenceExpression, StackPop()));
                            break;
                        }
                    case Code.Stelem_Any:
                    case Code.Stelem_I:
                    case Code.Stelem_I1:
                    case Code.Stelem_I2:
                    case Code.Stelem_I4:
                    case Code.Stelem_I8:
                    case Code.Stelem_R4:
                    case Code.Stelem_R8:
                    case Code.Stelem_Ref:
                        {
                            IExpression value = this.StackPop();
                            IExpression index = this.StackPop();
                            IExpression array = this.StackPop();
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(new ArrayIndexerExpression(array, index), value));
                            break;
                        }
                    case Code.Stfld:
                        {
                            IExpression expression = this.StackPop();
                            IExpression target = this.StackPop();
                            FieldReference fieldReference = (FieldReference)instr.Operand;
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(new FieldReferenceExpression(target, fieldReference), expression));
                            break;
                        }
                    case Code.Stind_Ref:
                        {
                            // TODO: what is .stind_X?
                            IExpression value = this.StackPop();
                            IExpression address = this.StackPop();
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(address, value));
                            break;
                        }
                    case Code.Stsfld:
                        {
                            FieldReference fieldReference = (FieldReference)instr.Operand;
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(new FieldReferenceExpression(new TypeReferenceExpression(fieldReference.DeclaringType), fieldReference), StackPop()));
                            break;
                        }
                    case Code.Stloc_0:
                        {
                            IExpression expression = StackPop();
                            VariableReference variable = _body.Variables[0];
                            cluster = (CFGNodeCluster)AddNode(new Definition(variable, expression));
                            break;
                        }
                    case Code.Stloc_1:
                        {
                            IExpression expression = StackPop();
                            VariableReference variable = _body.Variables[1];
                            cluster = (CFGNodeCluster)AddNode(new Definition(variable, expression));
                            break;
                        }
                    case Code.Stloc_2:
                        {
                            IExpression expression = StackPop();
                            VariableReference variable = _body.Variables[2];
                            cluster = (CFGNodeCluster)AddNode(new Definition(variable, expression));
                            break;
                        }
                    case Code.Stloc_3:
                        {
                            IExpression expression = StackPop();
                            VariableReference variable = _body.Variables[3];
                            cluster = (CFGNodeCluster)AddNode(new Definition(variable, expression));
                            break;
                        }
                    case Code.Stloc_S:
                        {
                            IExpression expression = StackPop();
                            VariableReference variable = (VariableReference)instr.Operand;
                            cluster = (CFGNodeCluster)AddNode(new Definition(variable, expression));
                            break;
                        }
                    case Code.Stobj:
                        {
                            IExpression value = this.StackPop();
                            IExpression address = this.StackPop();
                            cluster = (CFGNodeCluster)AddNode(new AssignStatement(address, value));
                            break;
                        }
                    case Code.Sub:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Subtract, right));

                            break;
                        }
                    case Code.Sub_Ovf:
                        {
                            // TODO: Check overflow
                            IExpression right = StackPop();
                            IExpression left = StackPop();

                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.Subtract, right));

                            break;
                        }
                    case Code.Throw:
                        {
                            IExpression expression = StackPop();
                            cluster = (CFGNodeCluster)AddNode(new ThrowExceptionStatement(expression));
                            break;
                        }
                    case Code.Unbox:
                    case Code.Unbox_Any:
                        {
                            // TODO: unbox.any?
                            IExpression expressionToBox = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new UnboxExpression(expressionToBox, (TypeReference)instr.Operand));
                            break;
                        }
                    case Code.Xor:
                        {
                            IExpression right = StackPop();
                            IExpression left = StackPop();
                            cluster = (CFGNodeCluster)AddNewTemporaryDefinitionNode(new BinaryExpression(left, BinaryOperator.BitwiseExclusiveOr, right));
                            break;
                        }
                    default:
                        {
                            throw new CompilerException("Invalid opcode: " + instr.OpCode);
                        }
                }
                Debug.Assert(cluster.Start != null);
                if (preamble != null)
                {
                    AddEdge(preamble, cluster.Start);
                    cluster.Start = preamble;
                    if (DebugSettings.FrontEndGraph)
                    {
                        new XaeiO.Compiler.Helpers.CFGRenderer(_cfg, _methodCompileInfo).Render("frontend-added-preamble.png");
                    }
                }
                MapInstruction(instr, cluster);
                Mono.Cecil.Cil.FlowControl flowControl = instr.OpCode.FlowControl;
                switch (flowControl)
                {
                    case Mono.Cecil.Cil.FlowControl.Next:
                    case Mono.Cecil.Cil.FlowControl.Call:
                        {
                            //FollowControlFlowPath(new Stack<IExpression>(_evaluationStack), instr.Next, cluster);
                            FollowControlFlowPath(_evaluationStack, instr.Next, cluster);
                            return;
                        }
                    case Mono.Cecil.Cil.FlowControl.Branch:
                        {
                            FollowControlFlowPath(_evaluationStack, (Instruction)instr.Operand, cluster);
                            return;
                        }
                    case Mono.Cecil.Cil.FlowControl.Cond_Branch:
                        {
                            Instruction instr1 = instr.Next;
                            Instruction instr2 = (Instruction)instr.Operand;
                            FollowControlFlowPath(_evaluationStack, instr1, cluster);
                            FollowControlFlowPath(_evaluationStack, instr2, cluster);
                            return;
                        }
                    case Mono.Cecil.Cil.FlowControl.Return:
                    case Mono.Cecil.Cil.FlowControl.Throw:
                        {
                            instr = null;
                            break;
                        }
                    default:
                        {
                            throw new CompilerException("Invalid FlowControl");
                        }
                }
            }
            finally
            {
                _evaluationStack = oldEvaluationStack;
            }
        }

        #region Helper

        private IExpression StackPush(IExpression expression)
        {
            _evaluationStack.Push(expression);
            return expression;
        }

        private IExpression StackPop()
        {
            return StackPop(false);
        }

        private IExpression StackPop(bool doNotThrow)
        {
            if (_evaluationStack.Count == 0 && doNotThrow)
            {
                return null;
            }
            else
            {
                return _evaluationStack.Pop();
            }
        }

        private CFGNodeCluster GetMappedCFGNodeCluster(Instruction instruction)
        {
            return _instructionMap[instruction];
        }

        private bool TryGetMappedCFGNodeCluster(Instruction instruction, out CFGNodeCluster cluster)
        {
            return _instructionMap.TryGetValue(instruction, out cluster);
        }

        private void MapInstruction(Instruction instruction, CFGNodeCluster cluster)
        {
            _instructionMap[instruction] = cluster;
        }

        private CFGNode AddNode(IStatement statement)
        {
            return _cfg.AddNode(statement);
        }

        private CFGNode AddNode()
        {
            return _cfg.AddNode();
        }

        private CFGEdge AddEdge(CFGNode source, CFGNode target)
        {
            return _cfg.AddEdge(source, target);
        }

        private Definition NewTemporaryDefinition(IExpression expression)
        {
            TypeReference type = expression.Type;
            return new Definition(
                _methodCompileInfo.NewTemporary(
                    new TypeReference(
                        type.Name,
                        type.Namespace,
                        type.Scope,
                        type.IsValueType
                    )
                ),
                expression
            );
        }

        private Definition NewFrozenDefinition(IExpression expression)
        {
            TypeReference type = expression.Type;
            return new Definition(
                _methodCompileInfo.NewFrozen(
                    new TypeReference(
                        type.Name,
                        type.Namespace,
                        type.Scope,
                        type.IsValueType
                    )
                ),
                expression
            );
        }
        private CFGNode AddNewFrozenDefinitionNode(IExpression expression)
        {
            Definition definition = NewFrozenDefinition(expression);
            StackPush(definition.Target);
            return AddNode(definition);
        }
        private CFGNode AddNewTemporaryDefinitionNode(IExpression expression)
        {
            return AddNewTemporaryDefinitionNode(expression, true);
        }
        private CFGNode AddNewTemporaryDefinitionNode(IExpression expression, bool push)
        {
            Definition definition = NewTemporaryDefinition(expression);
            if (push)
            {
                StackPush(definition.Target);
            }
            return AddNode(definition);
        }

        #endregion
    }

}
