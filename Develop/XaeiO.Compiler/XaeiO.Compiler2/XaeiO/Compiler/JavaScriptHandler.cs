using System;
using System.IO;
using System.Collections.Generic;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.BackEnds.XaeiOS;

using Mono.Cecil;

namespace XaeiO.Compiler
{
    internal class JavaScriptHandler : ITargetArchitectureHandler
    {
        private XaeiOSCompiler _compiler;

        public JavaScriptHandler(XaeiOSCompiler compiler)
        {
            _compiler = compiler;

            // load incremental compilation state
            if (compiler.Options.IncrementalCompilation)
            {
                string stateFile = Path.Combine(_compiler.Options.OutputPath, "IncrementalCompilationState.xml");
                Console.WriteLine("Loading incremental compilation state from: " + stateFile);
                compiler.IncrementalCompilationState = IncrementalCompilationState.Load(stateFile);
            }
        }

        public void Compile()
        {
            foreach (AssemblyDefinition assembly in _compiler.AssembliesToCompile)
            {
                Console.WriteLine("Compiling assembly: " + assembly);
                if (_compiler.Options.IncrementalCompilation)
                {
                    if (!_compiler.IncrementalCompilationState.ContainsValidPersistedState(assembly))
                    {
                        Console.WriteLine("Creating incremental compilation state for assembly: " + assembly);
                        _compiler.IncrementalCompilationState.Put(assembly);
                    }
                }
                AssemblyCompileInfo assemblyCompileInfo = new AssemblyCompileInfo(assembly);
                try
                {
                    foreach (ModuleDefinition module in assembly.Modules)
                    {
                        foreach (TypeDefinition typeDefinition in module.Types)
                        {
                            if (XaeiOSBackEnd.HasDummyAttribute(typeDefinition))
                            {
                                continue;
                            }
                            List<MethodDefinition> methodDefinitions = new List<MethodDefinition>();
                            foreach (MethodDefinition methodDefinition in typeDefinition.Methods)
                            {
                                methodDefinitions.Add(methodDefinition);
                            }
                            foreach (MethodDefinition methodDefinition in typeDefinition.Constructors)
                            {
                                methodDefinitions.Add(methodDefinition);
                            }
                            foreach (MethodDefinition method in methodDefinitions)
                            {
                                // shouldn't compile dummy methods
                                if (!XaeiOSBackEnd.HasDummyAttribute(method))
                                {
                                    assemblyCompileInfo.CreateMethodCompileInfo(method);
                                }
                            }
                        }
                    }

                    _compiler.FrontEnd.BuildCFG(assemblyCompileInfo);
                    _compiler.MiddleEnd.TransformAssembly(assemblyCompileInfo);

                    if (!DebugSettings.CompilingOneMethod)
                    {
                        _compiler.BackEnd.EmitAssembly(assemblyCompileInfo);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Unable to compile assembly: " + assembly);
                    Console.WriteLine(e);
                    if (_compiler.Options.IncrementalCompilation)
                    {
                        _compiler.IncrementalCompilationState.Remove(assembly);
                    }
                }
            }

            if (_compiler.Options.IncrementalCompilation)
            {
                // TODO: extract out into a separate method
                string stateFile = Path.Combine(_compiler.Options.OutputPath, "IncrementalCompilationState.xml");
                Console.WriteLine("Saving incremental compilation state to: " + stateFile);
                foreach (AssemblyIncrementalCompilationState assemblyState in _compiler.IncrementalCompilationState.AssemblyStates)
                {
                    Console.WriteLine("Saving incremental compilation state for assembly: {0}", assemblyState.AssemblyName);
                }
                IncrementalCompilationState.Save(_compiler.IncrementalCompilationState, stateFile);
            }
        }
    }
}
