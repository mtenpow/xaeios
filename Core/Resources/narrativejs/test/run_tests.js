load("../src/NjsRuntime.js");
load("../src/Narcissus.js");
load("../src/NjsCompiler.js");
load("../src/NjsScriptWriter.js");

if( typeof(readFile) == "undefined" && typeof(snarf) == "undefined" ) {
	print("ERROR: your JavaScript shell must implement a readFile method");
} else {
	if( typeof(readFile) == "undefined" ) {
		function readFile(filename) {
			return snarf(filename);
		}
	}
}

function test(desc, method) {
	try {
		method();
	} catch(ex) {
		if(ex.message) {
			print("FAILED: " + desc + ": " + ex.message);
		} else {
			print("FAILED: " + desc);
		}
		return;
	}
	
	print("passed: " + desc);
}

for(var argIdx = 0; argIdx < arguments.length; argIdx++) {
	load(arguments[argIdx]);
}
