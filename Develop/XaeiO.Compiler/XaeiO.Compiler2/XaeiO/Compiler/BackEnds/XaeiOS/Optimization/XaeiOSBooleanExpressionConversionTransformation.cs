using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;

using Mono.Cecil;

namespace XaeiO.Compiler.BackEnds.XaeiOS.Optimization
{
    /// <summary>
    /// Converts simple expressions that treat integers as booleans into ones that use booleans
    /// </summary>
    public class XaeiOSBooleanConversionTransformation : TransformationBase
    {
        private MethodCompileInfo _compileInfo;

        public XaeiOSBooleanConversionTransformation()
            : base(TransformationPhaseOrder.BeforeRegisterAllocation)
        {
        }

        public override void Transform(MethodCompileInfo compileInfo)
        {
            _compileInfo = compileInfo;
            bool changed;
            do
            {
                changed = false;
                foreach (CFGNode node in _compileInfo.CFG.Vertices)
                {
                    if (_compileInfo.DeadCode.Contains(node))
                    {
                        continue;
                    }
                    IExpression replacement = null;
                    CodeMatching.MatchAndReplaceCode<IExpression>(node.BasicBlock, delegate(IExpression expression, ICodeObject context)
                    {
                        IBinaryExpression binaryExpression = expression as IBinaryExpression;
                        if (binaryExpression != null)
                        {
                            ILiteralExpression rightLiteral = binaryExpression.Right as ILiteralExpression;
                            if (rightLiteral != null && rightLiteral.Value is int && (int)rightLiteral.Value == 0)
                            {
                                bool isInequality = (binaryExpression.Operator == BinaryOperator.ValueInequality) || (binaryExpression.Operator == BinaryOperator.IdentityInequality);
                                bool isEquality = (!isInequality) && ((binaryExpression.Operator == BinaryOperator.ValueEquality) || (binaryExpression.Operator == BinaryOperator.IdentityEquality));
                                if ((isInequality || isEquality) && ReferenceComparer.TypeReferenceEquals(binaryExpression.Left.Type, CoreTypes.Boolean))
                                {
                                    if (isInequality)
                                    {
                                        replacement = binaryExpression.Left;
                                    }
                                    else
                                    {
                                        replacement = new UnaryExpression(binaryExpression.Left, UnaryOperator.BooleanNot);
                                    }
                                    return true;
                                }
                            }
                            return false;
                        }

                        IConditionExpression conditionExpression = expression as IConditionExpression;
                        if (conditionExpression != null)
                        {
                            if (ReferenceComparer.TypeReferenceEquals(conditionExpression.Condition.Type, CoreTypes.Boolean))
                            {
                                ILiteralExpression thenLiteralExpression = conditionExpression.Then as ILiteralExpression;
                                ILiteralExpression elseLiteralExpression = conditionExpression.Else as ILiteralExpression;
                                if (thenLiteralExpression != null && elseLiteralExpression != null)
                                {
                                    if (thenLiteralExpression.Value is int && elseLiteralExpression.Value is int)
                                    {
                                        if (((int)thenLiteralExpression.Value) == 1 && ((int)elseLiteralExpression.Value) == 0)
                                        {
                                            replacement = conditionExpression.Condition;
                                            return true;
                                        }
                                    }
                                }
                            }
                            return false;
                        }

                        return false;
                    }, delegate(IExpression expression, ICodeObject context)
                    {
                        IExpression ret = replacement;
                        replacement = null;
                        changed = true;
                        return ret;
                    }, true);
                }
            } while (changed);
        }
    }
}
