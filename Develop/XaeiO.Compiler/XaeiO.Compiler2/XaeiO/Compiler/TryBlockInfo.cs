using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;
using Mono.Cecil.Cil;
using XaeiO.Compiler.CodeModel;
using Tenpow.Collections.Generic;
using XaeiO.Compiler.Optimization;

namespace XaeiO.Compiler
{
    public class TryBlockInfo : ICloneable
    {
        public TryBlockInfoParent Parent
        {
            get;
            set;
        }

        public CFGNodeCluster TryBlock
        {
            get;
            set;
        }

        public Dictionary<CFGNodeCluster, ExceptionHandler> Handlers
        {
            get;
            private set;
        }

        public CFGNodeCluster ConsolidatedCatchBlock
        {
            get;
            set;
        }

        public CFGNodeCluster FinallyBlock
        {
            get;
            set;
        }

        public TryBlockInfo()
        {
            Handlers = new Dictionary<CFGNodeCluster, ExceptionHandler>();
        }

        public object Clone()
        {
            Dictionary<CFGNodeCluster, ExceptionHandler> handlers = new Dictionary<CFGNodeCluster, ExceptionHandler>();
            foreach (KeyValuePair<CFGNodeCluster, ExceptionHandler> handler in Handlers)
            {
                handlers.Add((CFGNodeCluster)handler.Key.Clone(), handler.Value);
            }
            TryBlockInfo clone = new TryBlockInfo
            {
                Parent = Parent,
                TryBlock = (CFGNodeCluster)TryBlock.Clone(),
                Handlers = handlers,
                ConsolidatedCatchBlock = ConsolidatedCatchBlock == null ? null : (CFGNodeCluster)ConsolidatedCatchBlock.Clone(),
                FinallyBlock = FinallyBlock == null ? null : (CFGNodeCluster)FinallyBlock.Clone()
            };
            return clone;
        }
    }

    public class TryBlockInfoParent
    {
        public TryBlockInfo TryBlockInfo
        {
            get;
            set;
        }

        public TryBlockInfoParentType Type
        {
            get;
            set;
        }

        public TryBlockInfoParent(TryBlockInfo info, TryBlockInfoParentType type)
        {
            TryBlockInfo = info;
            Type = type;
        }
    }

    public enum TryBlockInfoParentType
    {
        Try,
        Catch,
        Finally
    }
}