load("../deploy/njs_compile.js");

var files = [
	"keywords",
	"ops",
	"simple_call",
	"multiple_calls",
	"call_args",
	"if",
	"while",
	"for"
];

function test_pair(caseName) {
	var compiler = new NjsCompiler();
	var input = "files/" + caseName + ".input.js";
	var output = "files/" + caseName + ".output.js";
	try {
		var result = compiler.compile(readFile(input), input);
	} catch(e) {
		throw(e.fileName + ":" + e.lineNumber + ": " + e.message + "\n" + e.stack);
	}

	var expected = readFile(output);
	
	var resLines = result.split("\n");
	var expLines = expected.split("\n");
	for (var i = 0; i < Math.max(resLines.length, expLines.length); i++) {
		if (resLines[i] == null)
			resLines[i] = "";
		if (expLines[i] == null)
			expLines[i] = "";
		
		if (resLines[i].replace(/\s/g, "") != expLines[i].replace(/\s/g, "")) {
			var outRes = "";
			for (var j = 0; j < resLines.length; j++) {
				outRes += "  " + resLines[j] + "\n";
			}
			throw (input + " didn't compile to expected output.  Mismatch at line " + (i+1) +
			       "\nexpected:\n  " + expLines[i].replace(/\s/g, "") +
			       "\ngot:\n  " + resLines[i].replace(/\s/g, "") +
			       "\ncomplete output:\n" +
			       outRes);
		}
	}
	print(input + " passed");
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

for( var i = 0; i < files.length; i ++ ) {
	test_pair(files[i]);
}

test("` not supported in var names", function() {
	var compiler = new NjsCompiler();
	try {
		compiler.compile("var `foo = 5;");
	} catch(ex) {
		return;
	}
	
	throw new Error();
});

test("$ is supported in var names", function() {
	var compiler = new NjsCompiler();
	// if this throws an exception, the test fails.
	compiler.compile("var $foo = 5;");
});

test("all whitespace supported", function() {
	var str = "function foo() {";
	str += String.fromCharCode(9);
	str += "var x = 4;";
	str += String.fromCharCode(10);
	str += "var x = 4;";
	str += String.fromCharCode(11);
	str += "var x = 4;";
	str += String.fromCharCode(12);
	str += "var x = 4;";
	str += String.fromCharCode(13);
	str += "var x = 4;";
	str += String.fromCharCode(32);
	str += "var x = 4;";
	str += "}";
	var compiler = new NjsCompiler();
	// will throw an exception if this test fails
	compiler.compile(str);
});