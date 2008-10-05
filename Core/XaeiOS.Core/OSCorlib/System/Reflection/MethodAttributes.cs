

namespace System.Reflection
{
	/// <summary>
	/// Summary description for MethodAttributes.
	/// </summary>
	[Flags]
    [System.Runtime.CompilerServices.Dummy]
	public enum MethodAttributes
	{
		MemberAccessMask = 7,
		PrivateScope = 0,
		Private = 1,
		FamANDAssem = 2,
		Assembly = 3,
		Family = 4,
        FamORAssem = 5,
		Public = 6,
		Static = 16,
		Final = 32,
		Virtual = 64,
		HideBySig = 128,
		VtableLayoutMask = 126,
		CheckAccessOnOverride = 512,
		ReuseSlot = 0,
		NewSlot = 256,
		Abstract = 1024,
		SpecialName = 2048,
		PinvokeImpl = 8192,
		UnmanagedExport = 8,
		RTSpecialName = 4096,
		ReservedMask = 53248,
		HasSecurity = 16384,
		RequiredSecObject = 32768
	}
}
