//#define GRAPH
//#define FINAL_GRAPH
//#define DETAILED_GRAPHS
//#define FRONTEND_GRAPH
//#define GRAPH_DOMINATORS
//#define GRAPH_REACHING_DEFINITIONS
//#define GRAPH_METHOD
//#define COMPILE_METHOD
//#define COMPILE_METHOD_SHORT
#define COMMENT_CODE
#define DEBUG_SYMBOLS
#define RUN_UNIT_TESTS
//#define TRACE_METHODS
//#define TRACE_KERNEL_METHODS
#define METHOD_INLINING
#define INCREMENTAL_COMPILATION

// TODO: Incremental compilation does not work with COMPILE_METHOD

#if COMPILE_METHOD && COMPILE_METHOD_SHORT
#error Cannot define a test method and a short test method
#endif

internal static class DebugSettings
{
    public const bool IncrementalCompilation =
#if INCREMENTAL_COMPILATION
 true;
#else
 false;
#endif

    public const bool Graph =
#if GRAPH
 true;
#else
 false;
#endif

    public const bool FinalGraph =
#if FINAL_GRAPH || GRAPH
 true;
#else
 false;
#endif

    public const bool AnyGraph =
#if FINAL_GRAPH || GRAPH
 true;
#else
 false;
#endif

    public const bool FrontEndGraph =
#if FRONTEND_GRAPH
 true;
#else
 false;
#endif

    public const bool DetailedGraphs =
#if DETAILED_GRAPHS
 true;
#else
 false;
#endif

    public const bool CommentCode =
#if COMMENT_CODE
 true;
#else
 false;
#endif

    public const string GraphMethod =
#if GRAPH_METHOD
 CompileMethod;
#else
 null;
#endif

    public const string CompileMethod =
#if COMPILE_METHOD
        //"System.Void XaeiOS.TestSuite.QuickSortTest::PerformTest()";
        //"System.Array System.Runtime.CompilerServices.RuntimeHelpers::CreateArray(System.Runtime.VTable,System.Int32)";
        //"System.Void XaeiOS.TestSuite.Tests.ExceptionHandlingTestSuite::TestFinallyExecutesAfterCatchBlockThrows2()";
        //"System.Void XaeiOS.TestSuite.TestBase::Test()";
        //"System.Void System.Threading.Thread::Sleep(System.Int32)";
        //"System.Int32 XaeiOS.TestSuite.Tests.CompilerBugsTestSuite::GetPivotPoint(System.Int32,System.Int32,System.Collections.Generic.List`1<T>,XaeiOS.TestSuite.Comparison`1<T>)";
        //"System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::NativeGetHashCode(System.Object)";
        //"System.Object System.Reflection.ReflectionHelpers::CreateInstance(System.Runtime.Constructor)";
        //"System.Void XaeiOS.Boot.BootManager::InvokeStaticConstructorsAndCallInitFunction()";
        //"System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::_doSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String,System.Int32)";
        //"System.Void XaeiOS.Process.SIP::TryExit3()";
        "System.Void System.Threading.Thread::Sleep(System.Int32)";
#else
 null;
#endif

    public const string CompileMethodShort =
#if COMPILE_METHOD_SHORT
 "TestBasicTryCatchFinally";
#else
 null;
#endif

    public const bool CompilingOneMethod =
#if COMPILE_METHOD || COMPILE_METHOD_SHORT
 true;
#else
 false;
#endif

    public const bool DebugSymbols =
#if DEBUG_SYMBOLS
 true;
#else
 false;
#endif

    public const bool RunUnitTests =
#if RUN_UNIT_TESTS
 true;
#else
        false;
#endif

    public const bool TraceMethods =
#if TRACE_METHODS
        true;
#else
 false;
#endif

    public const bool TraceKernelMethods =
#if TRACE_KERNEL_METHODS
 true;
#else
 false;
#endif

    public const bool MethodInlining =
#if METHOD_INLINING
 true;
#else
 false;
#endif

    public const bool GraphDominators =
#if GRAPH_DOMINATORS
 true;
#else
 false;
#endif

    public const bool GraphReachingDefinitions =
#if GRAPH_REACHING_DEFINITIONS
 true;
#else
 false;
#endif
}
