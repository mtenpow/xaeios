using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using NDesk.Options;
using Newtonsoft.Json;
using XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat;

namespace XaeiO.Linker
{
    public class Linker
    {
        public class ObjectImage
        {
            public AssemblyName Name;
            public JavaScriptObject Header;

            /// <summary>
            /// Number of methods in code section
            /// </summary>
            public long MethodCount;
            public long CodeStreamLength;
            public MemoryStream CodeStream;

            /// <summary>
            /// Number of data slots in data section
            /// </summary>
            public long DataCount;
            public long DataStreamLength;
            public MemoryStream DataStream;

            public long InitializationStreamLength;
            public MemoryStream InitializationStream;

            public long ModuleImageCodeStoreIndex;
            public long ModuleImageDataStoreIndex;

            public List<KeyValuePair<uint, string>> CodeSectionFixups;
            public List<KeyValuePair<uint, string>> DataSectionFixups;
            public List<KeyValuePair<uint, string>> InitializationSectionFixups;

            public JavaScriptObject GetMetadata()
            {
                return (JavaScriptObject)Header["Metadata"];
            }
            public JavaScriptArray GetFixups()
            {
                return (JavaScriptArray)Header["Fixups"];
            }

            public override string ToString()
            {
                return Name.Name;
            }
        }
        private Dictionary<AssemblyName, ObjectImage> _loadedObjectImages = new Dictionary<AssemblyName, ObjectImage>();
        private long _moduleImageCodeStoreSize = 0;
        private long _moduleImageDataStoreSize = 0;
        private string _outputFilePath;
        private ObjectImage _entryPointImage;

        public static void Main(string[] args)
        {
            /*
            args = new string[]{
                "-i", "OSCorlib.xo",
                "-i", "XaeiOS.Kernel.xo",
                "-i", "System.xo",
                "-i", "System.Browser.xo",
                "-i", "XaeiOS.ProcessViewer.xo",
                "-e", "XaeiOS.TestSuite.xo",
                "-o", "XaeiOS.TestSuite.xm",
                "-v",

            };*/
            XaeiO.Linker.Linker linker = new XaeiO.Linker.Linker();
            linker.ParseArguments(args);

            // TODO: Order object images according to dependencies.  Corlib goes first.

            linker.Link();
        }

        private void ParseArguments(string[] args)
        {
            int verbocity = 0;
            bool showHelp = false;
            OptionSet optionSet = new OptionSet() {
                { "e|EntrypointObjectImage=",   (string e) => {
                    AssemblyName entrypointAssemblyName = LoadObjectImage(e);
                    SetEntryPointObjectImage(_loadedObjectImages[entrypointAssemblyName]);
                } },
                { "i|ObjectImage=",             (string i) => { LoadObjectImage(i); } },
                { "o|OutputFilePath=",          (string o) => { _outputFilePath = o; } },
                { "v|Verbose",                  v => { ++verbocity; } },
                { "h|?|Help",                   v => showHelp = v != null }
            };
            optionSet.Parse(args);

            if (showHelp)
            {
                optionSet.WriteOptionDescriptions(Console.Out);
                Environment.Exit(0);
            }

            if (_outputFilePath == null)
            {
                Console.WriteLine("No output file path specified");
                optionSet.WriteOptionDescriptions(Console.Out);
                Environment.Exit(0);
            }

            if (_loadedObjectImages.Count == 0)
            {
                Console.WriteLine("No object images specified");
                optionSet.WriteOptionDescriptions(Console.Out);
                Environment.Exit(0);
            }
        }

        public AssemblyName LoadObjectImage(string filepath)
        {
            ObjectImage objectImage = new ObjectImage();

            XmlDocument objectFileXmlDocument = new XmlDocument();
            try
            {
                objectFileXmlDocument.Load(filepath);
            }
            catch (XmlException e)
            {
                throw new LinkerException("Unable to load object image: " + filepath, e);
            }
            // TODO: Verify object file xml format
            XmlElement documentElement = objectFileXmlDocument.DocumentElement;
            XmlElement headerElement = (XmlElement)documentElement.GetElementsByTagName("Header")[0];

            // load header
            JavaScriptObject header = (JavaScriptObject)JavaScriptConvert.DeserializeObject(((XmlCDataSection)headerElement.FirstChild).Data);
            objectImage.Header = header;
            JavaScriptObject metadata = objectImage.GetMetadata();
            AssemblyName assemblyName = new AssemblyName();
            JavaScriptObject assemblyNameObject = (JavaScriptObject)metadata["Name"];
            assemblyName.Name = (string)assemblyNameObject["Name"];
            assemblyName.Version = (string)assemblyNameObject["Version"];
            assemblyName.Culture = (string)assemblyNameObject["Culture"];
            objectImage.Name = assemblyName;

            // load code section
            XmlElement codeElement = (XmlElement)documentElement.GetElementsByTagName("Code")[0];
            MemoryStream codeMemoryStream = new MemoryStream();
            StreamWriter codeMemoryStreamWriter = new StreamWriter(codeMemoryStream);
            codeMemoryStreamWriter.Write(((XmlCDataSection)codeElement.FirstChild).Data);
            codeMemoryStreamWriter.Flush();
            long codeMemoryStreamLength = codeMemoryStream.Position;
            codeMemoryStream.Seek(0, SeekOrigin.Begin);
            objectImage.CodeStream = codeMemoryStream;
            objectImage.CodeStreamLength = codeMemoryStreamLength;
            objectImage.MethodCount = (int)long.Parse(codeElement.GetAttribute("Length"));
            objectImage.ModuleImageCodeStoreIndex = _moduleImageCodeStoreSize;
            _moduleImageCodeStoreSize += objectImage.MethodCount;

            // load data section
            XmlElement dataElement = (XmlElement)documentElement.GetElementsByTagName("Data")[0];
            MemoryStream dataMemoryStream = new MemoryStream();
            StreamWriter dataMemoryStreamWriter = new StreamWriter(dataMemoryStream);
            dataMemoryStreamWriter.Write(((XmlCDataSection)dataElement.FirstChild).Data);
            dataMemoryStreamWriter.Flush();
            long dataMemoryStreamLength = dataMemoryStream.Position;
            dataMemoryStream.Seek(0, SeekOrigin.Begin);
            objectImage.DataStream = dataMemoryStream;
            objectImage.DataStreamLength = dataMemoryStreamLength;
            objectImage.DataCount = (int)long.Parse(dataElement.GetAttribute("Length"));
            objectImage.ModuleImageDataStoreIndex = _moduleImageDataStoreSize;
            _moduleImageDataStoreSize += objectImage.DataCount;

            // load init section
            XmlElement initElement = (XmlElement)documentElement.GetElementsByTagName("Initialization")[0];
            MemoryStream initMemoryStream = new MemoryStream();
            StreamWriter initMemoryStreamWriter = new StreamWriter(initMemoryStream);
            initMemoryStreamWriter.Write(((XmlCDataSection)initElement.FirstChild).Data);
            initMemoryStreamWriter.Flush();
            long initMemoryStreamLength = initMemoryStream.Position;
            initMemoryStream.Seek(0, SeekOrigin.Begin);
            objectImage.InitializationStream = initMemoryStream;
            objectImage.InitializationStreamLength = initMemoryStreamLength;

            _loadedObjectImages[assemblyName] = objectImage;
            return assemblyName;
        }
        public void SetEntryPointObjectImage(ObjectImage objectImage)
        {
            _entryPointImage = objectImage;
        }
        public void Link()
        {
            // fixup object images
            foreach (ObjectImage objectImage in _loadedObjectImages.Values)
            {
                Fixup(objectImage);
            }

            // now build linked image file
            using (FileStream fileStream = new FileStream(_outputFilePath, FileMode.Create))
            {
                byte[] buffer;
                buffer = UTF8Encoding.UTF8.GetBytes("var " + XaeiO.Compiler.BackEnds.XaeiOS.XaeiOSBackEnd.CodeStore + "=[");
                fileStream.Write(buffer, 0, buffer.Length);
                bool first = true;
                foreach (ObjectImage objectImage in _loadedObjectImages.Values)
                {
#if DEBUG
                    buffer = UTF8Encoding.UTF8.GetBytes(string.Format("\n\n/************\nObject image {0} - Code: {1}\tData: {2}\n**********/\n\n", objectImage, objectImage.ModuleImageCodeStoreIndex, objectImage.ModuleImageDataStoreIndex));
                    fileStream.Write(buffer, 0, buffer.Length);
                    Log("Image " + objectImage + " - Code: " + objectImage.ModuleImageCodeStoreIndex + "\tData: " + objectImage.ModuleImageDataStoreIndex);
#endif
                    if (first)
                    {
                        first = false;
                    }
                    else
                    {
                        buffer = UTF8Encoding.UTF8.GetBytes(",");
                        fileStream.Write(buffer, 0, buffer.Length);
                    }
                    List<KeyValuePair<uint, string>> codeSectionFixups = objectImage.CodeSectionFixups;
                    MemoryStream codeStream = objectImage.CodeStream;
                    long codeStreamLength = objectImage.CodeStreamLength;
                    foreach (KeyValuePair<uint, string> fixup in codeSectionFixups)
                    {
                        uint fixupOffset = fixup.Key;
                        string fixedUp = fixup.Value;
                        buffer = new byte[fixupOffset];
                        codeStream.Read(buffer, 0, (int)fixupOffset);
                        fileStream.Write(buffer, 0, (int)fixupOffset);
                        buffer = UTF8Encoding.UTF8.GetBytes(fixedUp);
                        fileStream.Write(buffer, 0, buffer.Length);
                    }
                    buffer = codeStream.GetBuffer();
                    if (codeStreamLength - codeStream.Position > 0)
                    {
                        fileStream.Write(buffer, (int)codeStream.Position, (int)(codeStreamLength - codeStream.Position));
                    }
                }

                buffer = UTF8Encoding.UTF8.GetBytes("];var _=[");
                fileStream.Write(buffer, 0, buffer.Length);
                first = true;
                foreach (ObjectImage objectImage in _loadedObjectImages.Values)
                {
                    if (first)
                    {
                        first = false;
                    }
                    else
                    {
                        buffer = UTF8Encoding.UTF8.GetBytes(",");
                        fileStream.Write(buffer, 0, buffer.Length);
                    }
                    List<KeyValuePair<uint, string>> dataSectionFixups = objectImage.DataSectionFixups;
                    MemoryStream dataStream = objectImage.DataStream;
                    long dataStreamLength = objectImage.DataStreamLength;
                    foreach (KeyValuePair<uint, string> fixup in dataSectionFixups)
                    {
                        uint fixupOffset = fixup.Key;
                        string fixedUp = fixup.Value;
                        buffer = new byte[fixupOffset];
                        dataStream.Read(buffer, 0, (int)fixupOffset);
                        fileStream.Write(buffer, 0, (int)fixupOffset); // TODO: since fileStream.Write only accepts ints, we may need to break this write up into many writes
                        buffer = UTF8Encoding.UTF8.GetBytes(fixedUp);
                        fileStream.Write(buffer, 0, buffer.Length);
                    }
                    buffer = dataStream.GetBuffer();
                    if (dataStreamLength - dataStream.Position > 0)
                    {
                        fileStream.Write(buffer, (int)dataStream.Position, (int)(dataStreamLength - dataStream.Position));
                    }
                }
                buffer = UTF8Encoding.UTF8.GetBytes("];");
                fileStream.Write(buffer, 0, buffer.Length);

                buffer = UTF8Encoding.UTF8.GetBytes("var __module__={Initialize:function(){");
                fileStream.Write(buffer, 0, buffer.Length);

                foreach (ObjectImage objectImage in _loadedObjectImages.Values)
                {
                    List<KeyValuePair<uint, string>> initSectionFixups = objectImage.InitializationSectionFixups;
                    MemoryStream initStream = objectImage.InitializationStream;
                    long initStreamLength = objectImage.InitializationStreamLength;
                    foreach (KeyValuePair<uint, string> fixup in initSectionFixups)
                    {
                        uint fixupOffset = fixup.Key;
                        string fixedUp = fixup.Value;
                        buffer = new byte[fixupOffset];
                        initStream.Read(buffer, 0, (int)fixupOffset);
                        fileStream.Write(buffer, 0, (int)fixupOffset); // TODO: since fileStream.Write only accepts ints, we may need to break this write up into many writes
                        buffer = UTF8Encoding.UTF8.GetBytes(fixedUp);
                        fileStream.Write(buffer, 0, buffer.Length);
                    }
                    buffer = initStream.GetBuffer();
                    if (initStreamLength - initStream.Position > 0)
                    {
                        fileStream.Write(buffer, (int)initStream.Position, (int)(initStreamLength - initStream.Position));
                    }
                }

                buffer = UTF8Encoding.UTF8.GetBytes("}");
                fileStream.Write(buffer, 0, buffer.Length);

                // build array of static constructors to be called by OSCorlib after boot
                List<long> staticConstructorCodeIndicesArray = new List<long>();
                foreach (ObjectImage objectImage in _loadedObjectImages.Values)
                {
                    JavaScriptObject metadata = objectImage.GetMetadata();

                    // static constructors array
                    object staticConstructorsObject;
                    if (metadata.TryGetValue("StaticConstructors", out staticConstructorsObject))
                    {
                        JavaScriptArray staticConstructors = (JavaScriptArray)staticConstructorsObject;
                        foreach (long staticConstructorReferenceIndex in staticConstructors)
                        {
                            ResolvedReference resolvedReference = ResolveMethodReference(objectImage, (JavaScriptObject)((JavaScriptArray)(metadata["MethodReferences"]))[(int)staticConstructorReferenceIndex]);
                            staticConstructorCodeIndicesArray.Add(resolvedReference.Context.ModuleImageCodeStoreIndex + (long)resolvedReference.Resolved["CodeIndex"]);
                        }
                    }
                }
                StringBuilder staticConstructorCodeIndicesArrayStringBuilder = new StringBuilder();
                staticConstructorCodeIndicesArrayStringBuilder.Append(",StaticConstructors:[");
                for (int i = 0; i < staticConstructorCodeIndicesArray.Count; i++)
                {
                    staticConstructorCodeIndicesArrayStringBuilder.Append(string.Format(XaeiO.Compiler.BackEnds.XaeiOS.XaeiOSBackEnd.CodeStore + "[{0}]", staticConstructorCodeIndicesArray[i]));
                    if (i < staticConstructorCodeIndicesArray.Count - 1)
                    {
                        staticConstructorCodeIndicesArrayStringBuilder.Append(",");
                    }
                }
                staticConstructorCodeIndicesArrayStringBuilder.Append("]");
                buffer = UTF8Encoding.UTF8.GetBytes(staticConstructorCodeIndicesArrayStringBuilder.ToString());
                fileStream.Write(buffer, 0, buffer.Length);

                if (_entryPointImage != null)
                {
                    JavaScriptObject metadata = _entryPointImage.GetMetadata();

                    // TODO: Use a streamwriter rather than buffers

                    // boot method
                    int bootMethodReferenceIndex = (int)(long)metadata["BootMethod"];
                    ResolvedReference resolvedReference = ResolveMethodReference(_entryPointImage, (JavaScriptObject)((JavaScriptArray)(metadata["MethodReferences"]))[bootMethodReferenceIndex]);
                    buffer = UTF8Encoding.UTF8.GetBytes(string.Format(",Boot:" + XaeiO.Compiler.BackEnds.XaeiOS.XaeiOSBackEnd.CodeStore + "[{0}]", resolvedReference.Context.ModuleImageCodeStoreIndex + (long)resolvedReference.Resolved["CodeIndex"]));
                    fileStream.Write(buffer, 0, buffer.Length);

                    // managed entry point
                    int entrypointMethodReferenceIndex = (int)(long)metadata["EntryPoint"];
                    resolvedReference = ResolveMethodReference(_entryPointImage, (JavaScriptObject)((JavaScriptArray)(metadata["MethodReferences"]))[entrypointMethodReferenceIndex]);
                    buffer = UTF8Encoding.UTF8.GetBytes(string.Format(",EntryPoint:" + XaeiO.Compiler.BackEnds.XaeiOS.XaeiOSBackEnd.CodeStore + "[{0}]", resolvedReference.Context.ModuleImageCodeStoreIndex + (long)resolvedReference.Resolved["CodeIndex"]));
                    fileStream.Write(buffer, 0, buffer.Length);
                }

                buffer = UTF8Encoding.UTF8.GetBytes("};");
                fileStream.Write(buffer, 0, buffer.Length);
            }
        }
        public void Fixup(ObjectImage objectImage)
        {
            JavaScriptObject metadata = objectImage.GetMetadata();
            JavaScriptArray fixups = objectImage.GetFixups();

            List<KeyValuePair<uint, string>> codeSectionFixups = objectImage.CodeSectionFixups = new List<KeyValuePair<uint, string>>();
            List<KeyValuePair<uint, string>> dataSectionFixups = objectImage.DataSectionFixups = new List<KeyValuePair<uint, string>>();
            List<KeyValuePair<uint, string>> initSectionFixups = objectImage.InitializationSectionFixups = new List<KeyValuePair<uint, string>>();
            List<KeyValuePair<uint, string>> currentSectionFixups;
            foreach (JavaScriptObject fixup in fixups)
            {
                FixupType fixupType = (FixupType)(long)fixup["Type"];
                FixupType sectionFixupType = fixupType & (FixupType.CodeSection | FixupType.DataSection | FixupType.InitializationSection);
                fixupType = fixupType & ~FixupType.CodeSection;
                fixupType = fixupType & ~FixupType.DataSection;
                fixupType = fixupType & ~FixupType.InitializationSection;
                switch (sectionFixupType)
                {
                    case FixupType.CodeSection:
                        {
                            currentSectionFixups = codeSectionFixups;
                            break;
                        }
                    case FixupType.DataSection:
                        {
                            currentSectionFixups = dataSectionFixups;
                            break;
                        }
                    case FixupType.InitializationSection:
                        {
                            currentSectionFixups = initSectionFixups;
                            break;
                        }
                    default:
                        {
                            throw new LinkerException();
                        }
                }
                uint fixupOffset = (uint)(long)fixup["Offset"];
                int fixupIndex = (int)(long)fixup["Index"];
                string fixedUp;
                try
                {
                    switch (fixupType)
                    {
                        case FixupType.MethodCodePointer:
                            {
                                JavaScriptObject methodReference = (JavaScriptObject)((JavaScriptArray)metadata["MethodReferences"])[fixupIndex];
                                ResolvedReference resolvedReference = ResolveMethodReference(objectImage, methodReference);
                                fixedUp = (resolvedReference.Context.ModuleImageCodeStoreIndex + (long)resolvedReference.Resolved["CodeIndex"]).ToString();
                                break;
                            }
                        case FixupType.StaticFieldDataPointer:
                            {
                                JavaScriptObject fieldReference = (JavaScriptObject)((JavaScriptArray)metadata["FieldReferences"])[fixupIndex];
                                ResolvedReference resolvedReference = ResolveFieldReference(objectImage, fieldReference);
                                fixedUp = (resolvedReference.Context.ModuleImageDataStoreIndex + (long)resolvedReference.Resolved["DataIndex"]).ToString();
                                break;
                            }
                        case FixupType.VTableDataPointer:
                            {
                                JavaScriptObject typeReference = (JavaScriptObject)((JavaScriptArray)metadata["TypeReferences"])[fixupIndex];
                                ResolvedReference resolvedReference = ResolveTypeReference(objectImage, typeReference);
                                fixedUp = (resolvedReference.Context.ModuleImageDataStoreIndex + (long)resolvedReference.Resolved["VTableIndex"]).ToString();
                                break;
                            }
                        case FixupType.VTableSlot:
                            {
                                JavaScriptObject methodReference = (JavaScriptObject)((JavaScriptArray)metadata["MethodReferences"])[fixupIndex];
                                ResolvedReference resolvedReference = ResolveMethodReference(objectImage, methodReference);
                                fixedUp = resolvedReference.Resolved["VTableSlot"].ToString();
                                break;
                            }
                        default:
                            {
                                throw new InvalidObjectFormatException();
                            }
                    }
                }
                catch (Exception e)
                {
                    Error("COULD NOT FIXUP: [" + fixupType.ToString() + " " + e.Message + "].  Object image is: " + objectImage);
                    fixedUp = "COULD NOT FIXUP: [" + fixupType.ToString() + " " + e.Message + "]";
                }
                currentSectionFixups.Add(new KeyValuePair<uint, string>(fixupOffset, fixedUp));
            }

        }

        public class ResolvedReference
        {
            public ObjectImage Context;
            public JavaScriptObject Resolved;

            public ResolvedReference(ObjectImage context, JavaScriptObject resolved)
            {
                Context = context;
                Resolved = resolved;
            }
        }

        public ResolvedReference ResolveFieldReference(ObjectImage context, JavaScriptObject fieldReference)
        {
            JavaScriptObject metadata = context.GetMetadata();
            int typeReferenceIndex = (int)(long)fieldReference["Type"];
            JavaScriptObject typeReference = (JavaScriptObject)((JavaScriptArray)metadata["TypeReferences"])[typeReferenceIndex];
            ResolvedReference resolvedTypeDefinitionReference = ResolveTypeReference(context, typeReference);
            JavaScriptObject typeDefinition = resolvedTypeDefinitionReference.Resolved;

            foreach (JavaScriptObject fieldDefinition in (JavaScriptArray)typeDefinition[(bool)fieldReference["IsStatic"] ? "StaticFields" : "Fields"])
            {
                if (FieldReferenceEquals(context, fieldReference, fieldDefinition))
                {
                    return new ResolvedReference(resolvedTypeDefinitionReference.Context, fieldDefinition);
                }
            }
            throw new Exception("Could not resolve field: " + typeReference["Namespace"] + "." + typeReference["Name"] + "." + fieldReference["Name"]);
        }
        public ResolvedReference ResolveMethodReference(ObjectImage context, JavaScriptObject methodReference)
        {
            JavaScriptObject metadata = context.GetMetadata();
            int typeReferenceIndex = (int)(long)methodReference["Type"];
            JavaScriptObject typeReference = (JavaScriptObject)((JavaScriptArray)metadata["TypeReferences"])[typeReferenceIndex];
            ResolvedReference resolvedTypeDefinitionReference = ResolveTypeReference(context, typeReference);
            JavaScriptObject typeDefinition = resolvedTypeDefinitionReference.Resolved;
            foreach (JavaScriptObject methodDefinition in (JavaScriptArray)typeDefinition["Methods"])
            {
                if (MethodReferenceEquals(context, methodReference, resolvedTypeDefinitionReference.Context, methodDefinition))
                {
                    return new ResolvedReference(resolvedTypeDefinitionReference.Context, methodDefinition);
                }
            }
            throw new Exception("Could not resolve method: " + typeReference["Namespace"] + "." + typeReference["Name"] + "::" + methodReference["Name"]);
        }
        public ResolvedReference ResolveTypeReference(ObjectImage context, JavaScriptObject typeReference)
        {
            JavaScriptObject metadata = context.GetMetadata();
            int assemblyReferenceIndex = (int)(long)typeReference["Assembly"];
            ObjectImage referencedObjectImage;
            if (assemblyReferenceIndex == -1)
            {
                referencedObjectImage = context;
            }
            else
            {
                JavaScriptObject assemblyReference = (JavaScriptObject)((JavaScriptArray)metadata["AssemblyReferences"])[assemblyReferenceIndex];
                referencedObjectImage = ResolveAssemblyReference(assemblyReference);
            }

            JavaScriptObject referencedMetadata = referencedObjectImage.GetMetadata();
            foreach (JavaScriptObject typeDefinition in (JavaScriptArray)referencedMetadata["Types"])
            {
                if (TypeReferenceEquals(context, typeReference, referencedObjectImage, typeDefinition))
                {
                    int declaringTypeReferenceIndex = (int)(long)typeReference["DeclaringType"];
                    int declaringTypeReferenceIndex2 = (int)(long)typeDefinition["DeclaringType"];
                    if (declaringTypeReferenceIndex != -1 && declaringTypeReferenceIndex2 != -1)
                    {
                        // if both have declaring types
                        JavaScriptObject declaringTypeReference = (JavaScriptObject)((JavaScriptArray)metadata["TypeReferences"])[declaringTypeReferenceIndex];
                        JavaScriptObject declaringTypeReference2 = (JavaScriptObject)((JavaScriptArray)referencedMetadata["TypeReferences"])[declaringTypeReferenceIndex2];
                        ResolvedReference resolvedReference = ResolveTypeReference(referencedObjectImage, declaringTypeReference2);
                        if (!TypeReferenceEquals(context, declaringTypeReference, resolvedReference.Context, resolvedReference.Resolved))
                        {
                            continue;
                        }
                    }
                    else if (declaringTypeReferenceIndex != -1 || declaringTypeReferenceIndex2 != -1)
                    {
                        // if one has a declaring type and not the other
                        continue;
                    }
                    return new ResolvedReference(referencedObjectImage, typeDefinition);
                }
            }
            // TODO: Resolve declaring type to get its full name
            throw new Exception("Could not resolve type: " + (typeReference.ContainsKey("DeclaringType") && (long)typeReference["DeclaringType"] != -1 ? typeReference["DeclaringType"] : typeReference["Namespace"]) + "." + typeReference["Name"]);
        }

        public ObjectImage ResolveAssemblyReference(JavaScriptObject assemblyReference)
        {
            foreach (AssemblyName assemblyName in _loadedObjectImages.Keys)
            {
                if (assemblyName.Name == (string)assemblyReference["Name"] &&
                    assemblyName.Version == (string)assemblyReference["Version"]/* &&
                    assemblyName.Culture == (string)assemblyReference["Culture"]*/
                                                                                  )
                {
                    return _loadedObjectImages[assemblyName];
                }
            }
            throw new Exception("Could not resolve assembly: " + assemblyReference["Name"] + " Version=" + assemblyReference["Version"]);// + " Culture=" + assemblyReference["Culture"]);
        }

        public bool FieldReferenceEquals(ObjectImage referenceContext, JavaScriptObject fieldReference, JavaScriptObject fieldDefinition)
        {
            if (((string)fieldDefinition["Name"]) == ((string)fieldReference["Name"]))
            {
                return true;
            }
            return false;
        }

        public bool TypeReferenceEquals(ObjectImage referenceContext, JavaScriptObject typeReference, ObjectImage definitionContext, JavaScriptObject typeDefinition)
        {
            bool isGeneric = (bool)typeReference["IsGeneric"];
            if (isGeneric)
            {
                // TODO: check constraints etc
                return true;
            }
            string typeReferenceName = ((string)typeReference["Name"]);
            if (typeReferenceName.EndsWith("&"))
            {
                // this is a reference type
                // remove trailing "&" from type reference name
                typeReferenceName = typeReferenceName.Substring(0, typeReferenceName.Length - 1);
            }
            if (((string)typeDefinition["Name"]) == typeReferenceName &&
                ((string)typeDefinition["Namespace"]) == ((string)typeReference["Namespace"]))
            {
                return true;
            }
            return false;
        }

        public bool MethodReferenceEquals(ObjectImage referenceContext, JavaScriptObject methodReference, ObjectImage definitionContext, JavaScriptObject methodDefinition)
        {
            if (((string)methodReference["Name"]) != ((string)methodDefinition["Name"]))
            {
                return false;
            }
            if (((bool)methodReference["HasThis"]) != ((bool)methodDefinition["HasThis"]))
            {
                return false;
            }

            JavaScriptArray methodReferenceParameterReferences = (JavaScriptArray)methodReference["Parameters"];
            JavaScriptArray methodDefinitionParameters = (JavaScriptArray)methodDefinition["Parameters"];

            if (methodReferenceParameterReferences.Count != methodDefinitionParameters.Count)
            {
                return false;
            }

            JavaScriptObject metadata = referenceContext.GetMetadata();
            int i = 0;
            foreach (long parameterReferenceIndex in methodReferenceParameterReferences)
            {
                if (!ParameterReferenceEquals(referenceContext, (JavaScriptObject)((JavaScriptArray)metadata["ParameterReferences"])[(int)parameterReferenceIndex], definitionContext, (JavaScriptObject)methodDefinitionParameters[i++]))
                {
                    return false;
                }
            }
            return true;
        }

        public bool ParameterReferenceEquals(ObjectImage referenceContext, JavaScriptObject parameterReference, ObjectImage definitionContext, JavaScriptObject parameterDefinition)
        {
            /*if (((string)parameterReference["Name"]) != ((string)parameterDefinition["Name"]))
            {
                return false;
            }*/

            if (((long)parameterReference["Sequence"]) != ((long)parameterDefinition["Sequence"]))
            {
                return false;
            }

            JavaScriptObject metadata = referenceContext.GetMetadata();

            int typeReferenceIndex = (int)(long)parameterReference["Type"];
            JavaScriptObject typeReference = (JavaScriptObject)((JavaScriptArray)metadata["TypeReferences"])[typeReferenceIndex];
            ResolvedReference resolvedTypeDefinitionReference = ResolveTypeReference(referenceContext, typeReference);

            return TypeReferenceEquals(definitionContext, (JavaScriptObject)((JavaScriptArray)definitionContext.GetMetadata()["TypeReferences"])[(int)(long)parameterDefinition["Type"]], referenceContext, resolvedTypeDefinitionReference.Resolved);

        }

        private void Error(string s)
        {
            Console.WriteLine("[ERROR] " + s);
        }

        private void Log(String s)
        {
            Console.WriteLine("[LOG] " + s);
        }
    }
}
