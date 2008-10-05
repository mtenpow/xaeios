using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

using Mono.Cecil;

using Tenpow.Collections.Generic;

using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler
{
    public abstract class CompilerBase : ICompiler
    {
        #region ICompiler Members

        public IFrontEnd FrontEnd
        {
            get { return _frontEnd; }
        }
        private IFrontEnd _frontEnd;

        public IMiddleEnd MiddleEnd
        {
            get { return _middleEnd; }
        }
        private IMiddleEnd _middleEnd;

        public IBackEnd BackEnd
        {
            get { return _backEnd; }
        }
        private IBackEnd _backEnd;

        private AssemblyResolver _resolver;
        public IAssemblyResolver Resolver
        {
            get { return _resolver; }
        }

        public CompilerOptions Options
        {
            get
            {
                return _options;
            }
        }
        private CompilerOptions _options;

        public IncrementalCompilationState IncrementalCompilationState
        {
            get;
            set;
        }

        public abstract void Compile();

        #endregion

        private static readonly Set<string> AssemblyExtensions = new Set<string>(new string[]
        {
            ".dll",
            ".exe"
        });

        public Set<AssemblyDefinition> AssembliesToCompile
        {
            get
            {
                return _assembliesToCompile;
            }
        }
        private Set<AssemblyDefinition> _assembliesToCompile = new Set<AssemblyDefinition>();

        public ICollection<AssemblyDefinition> LoadedAssemblies
        {
            get { return new Set<AssemblyDefinition>(_assemblyCache.Values); }
        }
        private Dictionary<String, AssemblyDefinition> _assemblyCache = new Dictionary<string, AssemblyDefinition>();

        public CompilerBase(
            IFrontEnd frontEnd, IMiddleEnd middleEnd, IBackEnd backEnd, 
            CompilerOptions options
            )
        {
            _options = options;

            _frontEnd = frontEnd;
            _middleEnd = middleEnd;
            _backEnd = backEnd;

            _frontEnd.Compiler = this;
            _middleEnd.Compiler = this;
            _backEnd.Compiler = this;

            _resolver = new AssemblyResolver(this);
        }

        protected virtual void Initialize()
        {
            if (!Directory.Exists(_options.OutputPath))
            {
                Directory.CreateDirectory(_options.OutputPath);
            }
        }

        public ICollection<AssemblyDefinition> LoadAssemblies(ICollection<String> assemblyIdentifiers)
        {
            List<AssemblyDefinition> assemblyDefinitions = new List<AssemblyDefinition>();
            foreach (String assemblyIdentifier in assemblyIdentifiers)
            {
                assemblyDefinitions.Add(LoadAssembly(assemblyIdentifier));
            }
            return assemblyDefinitions;
        }

        public AssemblyDefinition LoadAssembly(string assemblyIdentifier)
        {
            return _resolver.Resolve(assemblyIdentifier);
        }

        public AssemblyDefinition LoadAssembly(AssemblyNameReference assemblyNameReference)
        {
            return _resolver.Resolve(assemblyNameReference);
        }

        public class AssemblyResolver : BaseAssemblyResolver
        {
            private CompilerBase _compiler;
            private Dictionary<String, AssemblyDefinition> _cache = new Dictionary<string, AssemblyDefinition>();
            public AssemblyResolver(CompilerBase compiler)
            {
                _compiler = compiler;
            }

            public override AssemblyDefinition Resolve(AssemblyNameReference name)
            {
                AssemblyDefinition assemblyDefinition;
                try
                {
                    assemblyDefinition = SmartResolve(name);
                }
                catch (Exception e)
                {
                    assemblyDefinition = base.Resolve(name);
                    Console.WriteLine("Smart assembly resolving for " + name + " failed: " + e); // TODO: Use logging
                }

                assemblyDefinition = ResolveSpecialAssembly(assemblyDefinition);

                // set resolver
                assemblyDefinition.Resolver = this;

                // save to cache
                SaveToCache(name.FullName, assemblyDefinition);

                return assemblyDefinition;
            }

            public override AssemblyDefinition Resolve(string assemblyIdentifier)
            {
                AssemblyDefinition assemblyDefinition;
                try
                {
                    assemblyDefinition = SmartResolve(assemblyIdentifier);
                }
                catch (Exception e)
                {
                    assemblyDefinition = base.Resolve(assemblyIdentifier);
                    Console.WriteLine("Smart assembly resolving for " + assemblyIdentifier + " failed: " + e); // TODO: Use logging
                }

                assemblyDefinition = ResolveSpecialAssembly(assemblyDefinition);

                // set resolver
                assemblyDefinition.Resolver = this;

                // save to cache
                SaveToCache(assemblyIdentifier, assemblyDefinition);

                return assemblyDefinition;
            }

            private AssemblyDefinition ResolveSpecialAssembly(AssemblyDefinition assemblyDefinition)
            {
                // TODO: Use CLRConjugate mechanism instead of hardcoding
                if (assemblyDefinition.Name.Name == "mscorlib")
                {
                    return CoreTypes.Corlib;
                }
                return assemblyDefinition;
            }

            private void SaveToCache(String assemblyIdentifier, AssemblyDefinition assemblyDefinition)
            {
                if (_compiler._assemblyCache.ContainsKey(assemblyDefinition.Name.FullName))
                {
                    _compiler._assemblyCache.Remove(assemblyDefinition.Name.FullName);
                }
                _compiler._assemblyCache.Add(assemblyDefinition.Name.FullName, assemblyDefinition);
                if (_cache.ContainsKey(assemblyIdentifier))
                {
                    _cache.Remove(assemblyIdentifier);
                }
                _cache[assemblyIdentifier] = assemblyDefinition;
            }

            private AssemblyDefinition SmartResolve(AssemblyNameReference assemblyNameReference)
            {
                AssemblyDefinition assemblyDefinition;

                // TODO: Why do I need a resolver cache and a compiler cache?

                // check resolver cache
                if (_cache.TryGetValue(assemblyNameReference.FullName, out assemblyDefinition))
                {
                    return assemblyDefinition;
                }

                // check compiler cache
                if (_compiler._assemblyCache.TryGetValue(assemblyNameReference.FullName, out assemblyDefinition))
                {
                    return assemblyDefinition;
                }

                // search in path
                if (TryResolveInSearchPath(assemblyNameReference, out assemblyDefinition))
                {
                    return assemblyDefinition;
                }

                throw new CompilerException("Unable to resolve assembly: " + assemblyNameReference);
            }

            private AssemblyDefinition SmartResolve(string assemblyIdentifier)
            {
                AssemblyDefinition assemblyDefinition;

                // check resolver cache
                if (_cache.TryGetValue(assemblyIdentifier, out assemblyDefinition))
                {
                    return assemblyDefinition;
                }

                // check compiler cache
                if (_compiler._assemblyCache.TryGetValue(assemblyIdentifier, out assemblyDefinition))
                {
                    return assemblyDefinition;
                }

                // search in path
                AssemblyNameReference assemblyNameReference = AssemblyNameReference.Parse(assemblyIdentifier);
                string filename = assemblyNameReference.Name;
                if (!HasAssemblyExtension(filename))
                {
                    filename += ".dll";
                }
                if (TryResolveInSearchPath(filename, out assemblyDefinition))
                {
                    // TODO: verify loaded assembly matches assemblyNameReference
                    return assemblyDefinition;
                }

                // TODO: versioned name?
                // TODO: Better way to determine if path or simple name
                // TODO: match identifier against loaded assemblies
                throw new CompilerException("Unable to resolve assembly: " + assemblyIdentifier);
            }

            private bool HasAssemblyExtension(string filename)
            {
                if (!Path.HasExtension(filename))
                {
                    return false;
                }
                return AssemblyExtensions.Contains(Path.GetExtension(filename));
            }

            private AssemblyDefinition ResolveInSearchPath(string filename)
            {
                foreach (string path in _compiler.Options.SearchPath)
                {
                    string filepath = Path.Combine(path, filename);
                    if (File.Exists(filepath))
                    {
                        return AssemblyFactory.GetAssembly(filepath);
                    }
                }
                return null;
            }

            private AssemblyDefinition ResolveInSearchPath(AssemblyNameReference assemblyNameReference)
            {
                foreach (string path in _compiler.Options.SearchPath)
                {
                    string filepath = Path.Combine(path, assemblyNameReference.Name + "." + "dll");
                    if (File.Exists(filepath))
                    {
                        AssemblyDefinition assemblyDefinition = AssemblyFactory.GetAssembly(filepath);
                        if (ReferenceComparer.AssemblyNameReferenceEquals(assemblyDefinition.Name, assemblyNameReference))
                        {
                            return assemblyDefinition;
                        }
                    }
                }
                return null;
            }

            private bool TryResolveInSearchPath(string filename, out AssemblyDefinition resolvedAssembly)
            {
                resolvedAssembly = ResolveInSearchPath(filename);
                return resolvedAssembly != null;
            }

            private bool TryResolveInSearchPath(AssemblyNameReference assemblyNameReference, out AssemblyDefinition resolvedAssembly)
            {
                resolvedAssembly = ResolveInSearchPath(assemblyNameReference);
                return resolvedAssembly != null;
            }
        }
    }
}
