using System;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;

namespace XaeiO.Compiler
{
    public static class CFGUtility
    {
        public static Set<CFGNode> FindNodeSet(CFGNodeCluster cluster, MethodCompileInfo methodCompileInfo)
        {
            // TODO: Ensure forward only transitive closure is not dirty
            return methodCompileInfo.ForwardOnlyTransitiveClosure[cluster.Start] - methodCompileInfo.ForwardOnlyTransitiveClosure[cluster.End];
        }
    }
}
