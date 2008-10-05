using System;
using System.Collections.Generic;
using System.Text;

using Reflection = System.Reflection;
using System.Diagnostics;

namespace XaeiO.Compiler.CodeModel
{
    public static class CodeMatching
    {
        public static bool HasStatement<T>(IBlockStatement block) where T : ICodeObject
        {
            return HasStatement<T>(block.Statements);
        }
        public static bool HasStatement<T>(ICollection<IStatement> statements) where T : ICodeObject
        {
            foreach (IStatement statement in statements)
            {
                if (statement is T)
                {
                    return true;
                }
                else if (HasStatement<T>(statement))
                {
                    return true;
                }
            }
            return false;
        }
        public static bool HasStatement<T>(IStatement statement) where T : ICodeObject
        {
            foreach (Reflection.PropertyInfo propertyInfo in statement.GetType().GetProperties())
            {
                if (typeof(T).IsAssignableFrom(propertyInfo.PropertyType))
                {
                    return true;
                }
                else if (typeof(IList<ISwitchCase>).IsAssignableFrom(propertyInfo.PropertyType))
                {
                    foreach (ISwitchCase switchCase in (IList<ISwitchCase>)propertyInfo.GetValue(statement, null))
                    {
                        if (HasStatement<T>(switchCase.Body))
                        {
                            return true;
                        }
                    }
                }
                else if (typeof(IBlockStatement).IsAssignableFrom(propertyInfo.PropertyType) && HasStatement<T>((IBlockStatement)propertyInfo.GetValue(statement, null)))
                {
                    return true;
                }
                else if (typeof(IList<IStatement>).IsAssignableFrom(propertyInfo.PropertyType) && HasStatement<T>((IList<IStatement>)propertyInfo.GetValue(statement, null)))
                {
                    return true;
                }
                else if (typeof(IStatement).IsAssignableFrom(propertyInfo.PropertyType) && HasStatement<T>((IStatement)propertyInfo.GetValue(statement, null)))
                {
                    return true;
                }
            }
            return false;
        }
        public static T MatchCode<T>(ICodeObject context, CodeMatcher<T> codeMatcher) where T : ICodeObject
        {
            T match = default(T);
            MatchAndReplaceCode<T>(context, codeMatcher, delegate(T codeObject)
            {
                match = (T)codeObject;
                return match;
            }, false);
            return match;
        }
        public static bool MatchCode<T>(ICodeObject context) where T : ICodeObject
        {
            bool match = false;
            MatchAndReplaceCode<T>(context, delegate(T codeObject)
            {
                match = true;
                return true;
            }, delegate(T codeObject)
            {
                return codeObject;
            }, false);
            return match;
        }
        public static void MatchAndReplaceCode<T>(ICodeObject context, CodeMatcher<T> codeMatcher, CodeReplacer<T> codeReplacer) where T : ICodeObject
        {
            MatchAndReplaceCode<T>(context, codeMatcher, codeReplacer, true);
        }
        public static void MatchAndReplaceCode<T>(ICodeObject context, CodeMatcher<T> codeMatcher, CodeReplacer<T> codeReplacer, bool exhaustive) where T : ICodeObject
        {
            MatchAndReplaceCode<T>(context, delegate(T codeObject, ICodeObject theContext)
            {
                return codeMatcher(codeObject);
            }, delegate(T codeObject, ICodeObject theContext)
            {
                return codeReplacer(codeObject);
            }, exhaustive);
        }
        public static void MatchAndReplaceCode<T>(ICodeObject context, ContextAwareCodeMatcher<T> codeMatcher, ContextAwareCodeReplacer<T> codeReplacer, bool exhaustive) where T : ICodeObject
        {
            bool replaceExpression = false;
            bool replaceStatement = false;
            bool replaceSwitchCase = false;
            bool replaceCatchClause = false;
            if (typeof(T).Equals(typeof(ICodeObject)))
            {
                replaceExpression = true;
                replaceStatement = true;
                replaceSwitchCase = true;
                replaceCatchClause = true;
            }
            else if (typeof(IExpression).IsAssignableFrom(typeof(T)))
            {
                replaceExpression = true;
            }
            else if (typeof(IStatement).IsAssignableFrom(typeof(T)))
            {
                replaceStatement = true;
            }
            else if (typeof(ISwitchCase).IsAssignableFrom(typeof(T)))
            {
                replaceSwitchCase = true;
            }
            else if (typeof(ICatchClause).IsAssignableFrom(typeof(T)))
            {
                replaceCatchClause = true;
            }
            else
            {
                Debug.Assert(false);
            }

            Debug.Assert(context is ICodeObject);

            foreach (Reflection.PropertyInfo propertyInfo in context.GetType().GetProperties())
            {
                //if (!typeof(ICodeObject).IsAssignableFrom(propertyInfo.PropertyType))
                //{
                //    continue;
                //}
                object value = propertyInfo.GetValue(context, null);

                if (value == null || value == context)
                {
                    continue;
                }

                IExpression expression = value as IExpression;
                if (expression != null)
                {
                    if (replaceExpression && expression is T && codeMatcher((T)expression, context))
                    {
                        propertyInfo.SetValue(context, codeReplacer((T)expression, context), null);
                        if (!exhaustive)
                        {
                            return;
                        }
                    }
                    else
                    {
                        MatchAndReplaceCode<T>(expression, codeMatcher, codeReplacer, exhaustive);
                    }
                }

                IList<IExpression> expressions = value as IList<IExpression>;
                if (expressions != null)
                {
                    foreach (IExpression innerExpression in new List<IExpression>(expressions))
                    {
                        if (replaceExpression && innerExpression is T && codeMatcher((T)innerExpression, context))
                        {
                            expressions.Insert(expressions.IndexOf(innerExpression), (IExpression)codeReplacer((T)innerExpression, context));
                            expressions.Remove(innerExpression);
                            if (!exhaustive)
                            {
                                return;
                            }
                        }
                        else
                        {
                            MatchAndReplaceCode<T>(innerExpression, codeMatcher, codeReplacer, exhaustive);
                        }
                    }
                }

                IStatement innerStatement = value as IStatement;
                if (innerStatement != null)
                {
                    if (replaceStatement && innerStatement is T && codeMatcher((T)innerStatement, context))
                    {
                        propertyInfo.SetValue(context, codeReplacer((T)innerStatement, context), null);
                        if (!exhaustive)
                        {
                            return;
                        }
                    }
                    else
                    {
                        MatchAndReplaceCode<T>(innerStatement, codeMatcher, codeReplacer, exhaustive);
                    }
                }

                IList<IStatement> innerStatements = value as IList<IStatement>;
                if (innerStatements != null)
                {
                    foreach (IStatement currentInnerStatement in new List<IStatement>(innerStatements))
                    {
                        if (replaceStatement && currentInnerStatement is T && codeMatcher((T)currentInnerStatement, context))
                        {
                            innerStatements.Insert(innerStatements.IndexOf(currentInnerStatement), (IStatement)codeReplacer((T)currentInnerStatement, context));
                            innerStatements.Remove(currentInnerStatement);
                            if (!exhaustive)
                            {
                                return;
                            }
                        }
                        else
                        {
                            MatchAndReplaceCode<T>(currentInnerStatement, codeMatcher, codeReplacer, exhaustive);
                        }
                    }
                }

                IList<ISwitchCase> innerCases = value as IList<ISwitchCase>;
                if (innerCases != null)
                {
                    foreach (ISwitchCase innerCase in new List<ISwitchCase>(innerCases))
                    {
                        if (replaceSwitchCase && innerCase is T && codeMatcher((T)innerCase, context))
                        {
                            innerCases.Insert(innerCases.IndexOf(innerCase), (ISwitchCase)codeReplacer((T)innerCase, context));
                            innerCases.Remove(innerCase);
                            if (!exhaustive)
                            {
                                return;
                            }
                        }
                        else
                        {
                            foreach (IStatement currentInnerStatement in new List<IStatement>(innerCase.Body.Statements))
                            {
                                if (replaceStatement && currentInnerStatement is T && codeMatcher((T)currentInnerStatement, context))
                                {
                                    innerCase.Body.Statements.Insert(innerCase.Body.Statements.IndexOf(currentInnerStatement), (IStatement)codeReplacer((T)currentInnerStatement, context));
                                    innerCase.Body.Statements.Remove(currentInnerStatement);
                                    if (!exhaustive)
                                    {
                                        return;
                                    }
                                }
                                else
                                {
                                    MatchAndReplaceCode<T>(currentInnerStatement, codeMatcher, codeReplacer, exhaustive);
                                }
                            }
                        }
                    }
                }
                IList<ICatchClause> innerClauses = value as IList<ICatchClause>;
                if (innerClauses != null)
                {
                    foreach (ICatchClause innerClause in new List<ICatchClause>(innerClauses))
                    {
                        if (replaceCatchClause && innerClause is T && codeMatcher((T)innerClause, context))
                        {
                            innerClauses.Insert(innerClauses.IndexOf(innerClause), (ICatchClause)codeReplacer((T)innerClause, context));
                            innerClauses.Remove(innerClause);
                            if (!exhaustive)
                            {
                                return;
                            }
                        }
                        else
                        {
                            foreach (IStatement currentInnerStatement in new List<IStatement>(innerClause.Body.Statements))
                            {
                                if (replaceStatement && currentInnerStatement is T && codeMatcher((T)currentInnerStatement, context))
                                {
                                    innerClause.Body.Statements.Insert(innerClause.Body.Statements.IndexOf(currentInnerStatement), (IStatement)codeReplacer((T)currentInnerStatement, context));
                                    innerClause.Body.Statements.Remove(currentInnerStatement);
                                    if (!exhaustive)
                                    {
                                        return;
                                    }
                                }
                                else
                                {
                                    MatchAndReplaceCode<T>(currentInnerStatement, codeMatcher, codeReplacer, exhaustive);
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}
