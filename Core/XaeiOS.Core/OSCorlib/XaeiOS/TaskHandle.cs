using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

using System;

namespace XaeiOS
{
	public sealed class TaskHandle
    {
        public int ID
        {
            get
            {
                return var.Cast<TaskHandle, int>(this);
            }
        }
    }
}
