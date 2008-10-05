using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

using XaeiO.Compiler;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.FrontEnds;
using XaeiO.Compiler.MiddleEnds;
using XaeiO.Compiler.BackEnds.XaeiOS;
using XaeiO.Compiler.CodeModel;

class Program
{

    public static void Main(string[] args)
    {
        // create test options
        if (args.Length == 0)
        {
            //--Assembly ../../../../../Libraries/System.Browser/System.Browser/System.Browser/bin/debug/System.Browser.dll;
            args = new String[]
            {
                "--TargetArchitecture", "JavaScript",
                "--TargetSubArchitecture", "Mozilla",
                "--TargetSubArchitectureVersion", "3.0",
                "--OutputPath", "./Build/",
                //"--Verbose",
                
                "--Assembly", "../../../../../Core/XaeiOS.Core/XaeiOS.TestSuite/bin/debug/XaeiOS.TestSuite.exe",
                "--Assembly", "../../../../../Core/XaeiOS.Core/OSCorlib/bin/Debug/OSCorlib.dll",
                "--Assembly", "../../../../../Core/XaeiOS.Core/XaeiOS.Kernel/bin/Debug/XaeiOS.Kernel.dll",
                "--Assembly", "../../../../../Libraries/System.Browser/System.Browser/System.Browser/bin/debug/System.Browser.dll",
                /*
                "--Assembly", "../../../../../Libraries/System/System/bin/debug/System.dll",
                "--Assembly", "../../../../../Libraries/System.Net/System.Net.Tests/bin/debug/System.Net.Tests.exe",
                "--Assembly", "../../../../../Libraries/System.Net/System.Net/bin/debug/System.Net.dll",
                "--Assembly", "../../../../../../MuZume/XaeiOS/Source/MuZume/MuZume/bin/Debug/MuZume.exe",
                //"--Assembly", "../../../../../Tests/TestCLRApplication/TestCLRApplication/bin/debug/TestCLRApplication.exe",
                "--Reference", "../../../XaeiO.Compiler2.Tests/bin/Debug/XaeiO.Compiler2.Tests.exe",
*/
            };
            /*
            args = new String[]
            {
                "--TargetArchitecture", "CLR",
                "--OutputPath", "./Build/",
                "--Assembly", "MuZume.exe"
            };*/
        }

        CompilerOptions options = new CompilerOptions(args);
        XaeiOSCompiler compiler = new XaeiOSCompiler(options);
        compiler.Compile();
    }
}