using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using System.Xml;

using Mono.Cecil;
using Mono.Cecil.Cil;
using Mono.Cecil.Metadata;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using XaeiO.Compiler.Helpers;
using XaeiO.Compiler.Rules.Patterns;
using XaeiO.Compiler.Rules.Patterns.CodeGeneration;
using ImageFormat = XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

using Tenpow.Collections.Generic;

using Newtonsoft.Json;

using Reflection = System.Reflection;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public partial class XaeiOSBackEnd : CompilerTierBase, IBackEnd
    {
        public const string DataStore = "_";
        public const string CodeStore = "$$";
        public const int DefaultBasicBlockMaxCost = 3000;
    }
}
