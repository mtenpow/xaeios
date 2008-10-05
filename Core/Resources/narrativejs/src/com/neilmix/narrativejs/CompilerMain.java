package com.neilmix.narrativejs;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextAction;
import org.mozilla.javascript.Script;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;
import org.mozilla.javascript.tools.shell.Main;
import org.mozilla.javascript.tools.shell.Global;
import org.mozilla.javascript.tools.ToolErrorReporter;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;

public class CompilerMain {

	static Global global = Main.getGlobal();

    private static class IProxy implements ContextAction
    {
		String[] args;
		String source;
		
        IProxy()
        {
        }

        public Object run(Context cx)
        {
			// define "arguments" array in the top-level object:
			// need to allocate new array since newArray requires instances
			// of exactly Object[], not ObjectSubclass[]
			Object[] array = new Object[args.length];
			System.arraycopy(args, 0, array, 0, args.length);
			Scriptable argsObj = cx.newArray(global, array);
			global.defineProperty("arguments", argsObj,
								  ScriptableObject.DONTENUM);
	
			Script script = Main.loadScriptFromSource(cx, source, "compiler", 1, null);
			if (script != null) {
				Main.evaluateScript(script, cx, global);
			}

            return null;
        }
    }

	public static void main(String[] args) throws java.io.IOException
	{		
		InputStream is = CompilerMain.class.getResourceAsStream("Compiler.js");
		BufferedReader in = new BufferedReader(new InputStreamReader(is));
		StringBuffer buffer = new StringBuffer();
		String line;
		while ((line = in.readLine()) != null) {
			buffer.append(line);
			buffer.append("\n");
		}

		ToolErrorReporter errorReporter = new ToolErrorReporter(false, global.getErr());
		Main.shellContextFactory.setErrorReporter(errorReporter);

		global.init(Main.shellContextFactory);

		IProxy iproxy = new IProxy();
		iproxy.args = args;
		iproxy.source = buffer.toString();
		Main.shellContextFactory.call(iproxy);
	}
}
