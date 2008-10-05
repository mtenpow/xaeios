namespace System.Reflection
{
    [AttributeUsage(AttributeTargets.Interface | (AttributeTargets.Struct | AttributeTargets.Class))]
    public sealed class DefaultMemberAttribute : Attribute
    {
        // Methods
        public DefaultMemberAttribute(string member_name)
        {
            this.member_name = member_name;
        }

        // Properties
        public string MemberName
        {
            get
            {
                return member_name;
            }
        }

        // Fields
        private string member_name;
    }


}
