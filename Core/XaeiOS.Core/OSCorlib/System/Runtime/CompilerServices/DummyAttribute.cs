namespace System.Runtime.CompilerServices
{
    [AttributeUsage(
        AttributeTargets.Interface |
        AttributeTargets.Class |
        AttributeTargets.Constructor |
        AttributeTargets.Field |
        AttributeTargets.Method |
        AttributeTargets.Struct |
        AttributeTargets.Property |
        AttributeTargets.Enum |
        AttributeTargets.Delegate)]
    [Dummy]
    public class DummyAttribute : System.Attribute
    {
        public DummyAttribute()
        {
        }
    }
}