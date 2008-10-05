
function usage() {
	print("usage: CompilerMain [options] file1.njs file2.njs ...");
	print("options:");
	print("\t--exceptions=[on|off]");
	java.lang.System.exit(1);
}

var files = [];
var options = {};
for (var i = 0; i < arguments.length; i++) {
	if (arguments[i].match(/^--(.*)=(.*)/)) {
		options[RegExp.$1]=RegExp.$2;
	} else {
		if (!arguments[i].match(/\.njs$/)) {
			usage();
		}
		files.push(arguments[i]);
	}
}

if (files.length == 0) {
	usage();
}

var compiler = new NjsCompiler(options);
for( var i = 0; i < files.length; i++ ) {
	var filename = files[i];
	var code = readFile(filename);
	try {
		var output = compiler.compile(code, filename);
	} catch (e) {
		if (e.lineNumber != null && e.fileName != null) {
			print("Parse error: " + e.fileName + ", line " + e.lineNumber + ": " + e.toString());
		} else {
			print("Compiler error:" + e.toString());
		}
		java.lang.System.exit(1);
	}

	var file = new java.io.FileWriter(filename.replace(/\.njs$/, ".js"));
	file.write(output);
	file.flush();
	file.close();
}

