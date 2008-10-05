using System;
using System.Text;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Xml.Serialization;

using Tenpow.Collections.Generic;

using Mono.Cecil;
using Mono.Cecil.Cil;

using XaeiO.Compiler.CodeModel;
using XaeiO.Compiler.Optimization;
using System.Security.Cryptography;

namespace XaeiO.Compiler
{
    [XmlRoot]
    public class IncrementalCompilationState
    {
        [XmlIgnore]
        private Dictionary<string, AssemblyIncrementalCompilationState> _fullNameToCompilationStateMap = new Dictionary<string, AssemblyIncrementalCompilationState>();

        [XmlArray]
        public List<AssemblyIncrementalCompilationState> AssemblyStates
        {
            get;
            set;
        }

        public AssemblyIncrementalCompilationState this[AssemblyDefinition assemblyDefinition]
        {
            get
            {
                return _fullNameToCompilationStateMap[assemblyDefinition.Name.FullName];
            }
        }

        private IncrementalCompilationState()
        {
            AssemblyStates = new List<AssemblyIncrementalCompilationState>();
        }

        public bool ContainsValidPersistedState(AssemblyDefinition assemblyDefinition)
        {
            AssemblyIncrementalCompilationState state;
            if (!_fullNameToCompilationStateMap.TryGetValue(assemblyDefinition.Name.FullName, out state))
            {
                Console.WriteLine("Could not find persisted incremental compilation state for assembly: " + assemblyDefinition);
                return false;
            }
            if (!state.WasPersisted)
            {
                Console.WriteLine("Incremental compilation state for assembly {0} was not persisted.", assemblyDefinition);
                return false;
            }

            string currentMD5Hash = ComputeMD5(assemblyDefinition.MainModule.Image.FileInformation);
            if (currentMD5Hash != state.MD5Hash)
            {
                Console.WriteLine("Incremental compilation state for assembly {0} did not match the loaded assembly.  Expected {1} but found {2}.",
                    assemblyDefinition, state.MD5Hash, currentMD5Hash);
                return false;
            }

            return true;
        }

        public bool Contains(AssemblyDefinition assemblyDefinition)
        {
            return _fullNameToCompilationStateMap.ContainsKey(assemblyDefinition.Name.FullName);
        }

        public void Put(AssemblyDefinition assemblyDefinition)
        {
            if (Contains(assemblyDefinition))
            {
                Remove(assemblyDefinition);
            }
            AssemblyIncrementalCompilationState state = new AssemblyIncrementalCompilationState(assemblyDefinition);
            _fullNameToCompilationStateMap.Add(assemblyDefinition.Name.FullName, state);
            AssemblyStates.Add(state);
            Console.WriteLine("Put incremental compilation state for assembly: {0}", assemblyDefinition);
        }

        public void Remove(AssemblyDefinition assemblyDefinition)
        {
            AssemblyIncrementalCompilationState state;
            if (_fullNameToCompilationStateMap.TryGetValue(assemblyDefinition.Name.FullName, out state))
            {
                _fullNameToCompilationStateMap.Remove(assemblyDefinition.Name.FullName);
                AssemblyStates.Remove(state);
                Console.WriteLine("Removed incremental compilation state for assembly: {0}", assemblyDefinition);
            }
        }

        public static IncrementalCompilationState Load(string file)
        {
            if (!File.Exists(file))
            {
                Console.WriteLine("Incremental compilation state file {0} does not exist.  Creating new incremental compilation state.", file);
                return new IncrementalCompilationState();
            }
            XmlSerializer serializer = new XmlSerializer(typeof(IncrementalCompilationState));
            IncrementalCompilationState state = null;
            try
            {
                state = (IncrementalCompilationState)serializer.Deserialize(new FileStream(file, FileMode.Open));
            }
            catch (InvalidOperationException e)
            {
                Console.WriteLine("Unable to load incremental compilation state from file {0}: {1}.  Creating new incremental compilation state.", file, e);
                return new IncrementalCompilationState();
            }
            Console.WriteLine("Loaded incremental compilation state from file {0}", file);

            foreach (AssemblyIncrementalCompilationState assemblyState in state.AssemblyStates)
            {
                Console.WriteLine("Loaded incremental compilation state for assembly: {0}", assemblyState.AssemblyName);
                assemblyState.WasPersisted = true;

                if (state._fullNameToCompilationStateMap.ContainsKey(assemblyState.AssemblyName))
                {
                    Console.WriteLine("Found multiple incremental compilation states for assembly {0}.  Creating new incremental compilation state.", assemblyState.AssemblyName);
                    return new IncrementalCompilationState();
                }
                state._fullNameToCompilationStateMap[assemblyState.AssemblyName] = assemblyState;
            }
            return state;
        }

        public static void Save(IncrementalCompilationState state, string file)
        {
            XmlSerializer serializer = new XmlSerializer(state.GetType());
            serializer.Serialize(new FileStream(file, FileMode.Create), state);
        }

        public static string ComputeMD5(FileInfo fileInfo)
        {
            StringBuilder sb = new StringBuilder();
            using (FileStream fs = new FileStream(fileInfo.FullName, FileMode.Open))
            {
                return Convert.ToBase64String(new MD5CryptoServiceProvider().ComputeHash(fs));
            }
        }
    }

    [XmlRoot]
    public class AssemblyIncrementalCompilationState
    {
        [XmlIgnore]
        public bool WasPersisted
        {
            get;
            set;
        }

        [XmlElement]
        public string AssemblyName
        {
            get;
            set;
        }

        [XmlElement]
        public string MD5Hash
        {
            get;
            set;
        }

        [XmlElement]
        public string BackEndOutput
        {
            get;
            set;
        }

        // TODO: Use a dict here
        [XmlElement]
        public List<object> Properties
        {
            get;
            set;
        }

        public AssemblyIncrementalCompilationState()
        {
        }

        public AssemblyIncrementalCompilationState(AssemblyDefinition assembly)
        {
            AssemblyName = assembly.Name.FullName;
            MD5Hash = IncrementalCompilationState.ComputeMD5(assembly.MainModule.Image.FileInformation);
            Properties = new List<object>();
            WasPersisted = false;
        }
    }
}