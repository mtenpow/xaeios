using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler
{
	public enum TargetArchitecture
	{
        JavaScript,
        Java,
        CLR,
        Flash
	}

    public enum TargetSubArchitecture
    {
        Mozilla,
        WebKit,
        IE,
        Opera,
        Generic
    }
}
