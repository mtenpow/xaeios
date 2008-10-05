namespace XaeiOS.Runtime
{
    public class Assembly
    {
        public string Name;
        public string Version;
        public byte[] Hash;
        public string ModuleUrl;

        public string StrongName
        {
            get
            {
                return Name + " v" + Version; // hash and url?
            }
        }
    }
}