using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

using NDesk.Options;

namespace XaeiO.Compiler
{
    public class CompilerOptions
    {
        private static readonly string[] DefaultSearchPath = new string[]{
            "./"
        };

        private const string DefaultOutputPath = "./Build/";

        public IList<string> AssembliesToCompile
        {
            get;
            set;
        }

        public IList<string> References
        {
            get;
            set;
        }

        public TargetArchitecture TargetArchitecture
        {
            get;
            set;
        }

        public TargetSubArchitecture TargetSubArchitecture
        {
            get;
            set;
        }

        public float TargetSubArchitectureVersion
        {
            get;
            set;
        }

        public CPUClass CPUClass
        {
            get;
            set;
        }

        public string OutputPath
        {
            get;
            set;
        }

        private List<string> _searchPath = new List<string>(DefaultSearchPath);

        public List<string> SearchPath
        {
            get { return _searchPath; }
            set { _searchPath = value; }
        }

        public bool ShowHelp
        {
            get;
            set;
        }

        public int Verbocity
        {
            get;
            set;
        }

        public bool IncrementalCompilation
        {
            get;
            set;
        }

        private OptionSet _optionSet;

        public CompilerOptions(string[] args)
            : this()
        {
            SetDefaults();
            ParseArguments(args);
        }

        public CompilerOptions()
        {
            AssembliesToCompile = new List<string>();
            References = new List<string>();
        }

        public void PrintHelp()
        {
            _optionSet.WriteOptionDescriptions(Console.Out);
        }

        private void SetDefaults()
        {
            TargetArchitecture = TargetArchitecture.JavaScript;
            TargetSubArchitecture = TargetSubArchitecture.Generic;
            TargetSubArchitectureVersion = 0;
            OutputPath = DefaultOutputPath;
            IncrementalCompilation = DebugSettings.IncrementalCompilation;
        }

        private void ParseArguments(string[] args)
        {
            _optionSet = new OptionSet() {
                { "a|Assembly=",                        (string a) => { AssembliesToCompile.Add(a); } },
                { "r|Reference=",                       (string r) => { References.Add(r); } },
                { "t|TargetArchitecture=",              (TargetArchitecture t) => { TargetArchitecture = t; } },
                { "ts|TargetSubArchitecture=",          (TargetSubArchitecture ts) => { TargetSubArchitecture = ts; } },
                { "tsv|TargetSubArchitectureVersion=",  (float tsv) => { TargetSubArchitectureVersion = tsv; } },
                { "o|OutputDirectory=",                 (string o) => { OutputPath = o; } },
                { "v|Verbose",                          (v) => { ++Verbocity; } },
                { "ic|IncrementalCompilation=",         (ic) => { IncrementalCompilation = ic != null; } },
                { "h|?|Help",                           (h) => ShowHelp = h != null }
            };
            _optionSet.Parse(args);

            OutputPath = Path.Combine(OutputPath, Enum.GetName(typeof(TargetArchitecture), TargetArchitecture));
        }
    }
}
