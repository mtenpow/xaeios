namespace System
{
	public class Calls
	{
        public static extern int Fork();

        public static extern int SetDataSegmentSize(void* endOfDataSegment);

        public static extern void* IncrementDataSegmentSize(int increment);

    }
}
