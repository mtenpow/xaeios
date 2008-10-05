using System;
using System.Collections.Generic;

namespace System.Net.Comet
{
    public enum CometConnectionState
    {
        Ready,
        Reestablishing,
        Established,
        Closing,
        Failed,
        Closed
    }
}
