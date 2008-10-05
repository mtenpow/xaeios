using System;
using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Text;

using Tenpow.Collections.Generic;

using Mono.Cecil;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.FrontEnds;
using XaeiO.Compiler.MiddleEnds;
using XaeiO.Compiler.BackEnds.XaeiOS;
using XaeiO.Compiler.Helpers;

namespace XaeiO.Compiler
{
    public class XaeiOSCompiler : CompilerBase
    {
        private Dictionary<TargetArchitecture, ITargetArchitectureHandler> _targetArchitectureHandlers;

        private AssemblyDefinition _kernelAssembly;
        public AssemblyDefinition KernelAssembly
        {
            get { return _kernelAssembly; }
            set { _kernelAssembly = value; }
        }

        public XaeiOSCompiler(CompilerOptions options) :
            base(   
                new CecilFrontEnd(),
                new BasicMiddleEnd(),
                new XaeiOSBackEnd(),
                options
            )
        {
            this.MiddleEnd.CustomTransformations.Add(new BackEnds.XaeiOS.Optimization.InitializingTransformation());
            this.MiddleEnd.CustomTransformations.Add(new BackEnds.XaeiOS.Optimization.BooleanConversionTransformation());
            this.MiddleEnd.CustomTransformations.Add(new BackEnds.XaeiOS.Optimization.ExceptionHandlingInitializingTransformation());

            Initialize();
        }

        public override void Compile()
        {
            ITargetArchitectureHandler handler;
            if (!_targetArchitectureHandlers.TryGetValue(Options.TargetArchitecture, out handler))
            {
                throw new CompilerException("The target architecture " + Options.TargetArchitecture + " is not supported.");
            }
            Console.WriteLine("Compiling for target architecture " + Options.TargetArchitecture + ":" + Options.TargetSubArchitecture + ":" + Options.TargetSubArchitectureVersion);
            handler.Compile();
        }

        protected override void Initialize()
        {
            base.Initialize();

            if (Options.ShowHelp)
            {
                Options.PrintHelp();
                Environment.Exit(0);
            }

            if (DebugSettings.AnyGraph)
            {
                Console.WriteLine("Graphing on...");
            }

            if (DebugSettings.CompileMethod != null)
            {
                Console.WriteLine("Testing with method: " + DebugSettings.CompileMethod);
            }
            else if (DebugSettings.CompileMethodShort != null)
            {
                Console.WriteLine("Testing with method (short name): " + DebugSettings.CompileMethodShort);
            }

            // initialize target architecture compilers
            _targetArchitectureHandlers = new Dictionary<TargetArchitecture, ITargetArchitectureHandler>();
            _targetArchitectureHandlers[TargetArchitecture.JavaScript] = new JavaScriptHandler(this);
            _targetArchitectureHandlers[TargetArchitecture.CLR] = new CLRHandler(this);

            foreach (string assembly in Options.References)
            {
                AssemblyDefinition assemblyDefinition = LoadAssembly(assembly);
                Console.WriteLine("Done loading assembly: " + assemblyDefinition);
            }

            foreach (string assembly in Options.AssembliesToCompile)
            {
                AssemblyDefinition assemblyDefinition = LoadAssembly(assembly);
                AssembliesToCompile.Add(assemblyDefinition);
                Console.WriteLine("Done loading assembly: " + assemblyDefinition);
            }

            if (Options.TargetArchitecture == TargetArchitecture.JavaScript)
            {
                CoreTypes.Corlib = LoadAssembly("OSCorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null");
                _kernelAssembly = LoadAssembly("XaeiOS.Kernel, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null");
            }
        }
    }
}
