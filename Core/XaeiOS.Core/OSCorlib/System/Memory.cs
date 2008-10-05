namespace System
{
	public class Memory
	{
        public static void* GetDataSegmentSize()
        {
            return Calls.IncrementDataSegmentSize(0);
        }

        public static void* Malloc(int size)
        {
            throw new Exception();
        }

        public static void* Calloc(int size)
        {
            throw new Exception();
        }

        public static void Realloc(void* p, int newSize)
        {
            throw new Exception();
        }

        public static void Free(void* p)
        {
        }

        private unsafe struct FreeBlock
        {
            public void* Location;
            public int Size;
            public FreeBlock* Next;
        }

        private unsafe class ThreadCacheHash : System.Collections.SparseHash<int, IntPtr>
        {
        }
    }
}
