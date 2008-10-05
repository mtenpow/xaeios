load("../deploy/njs_compile.js");

var files = [
	"simple_call", null,
	"simple_return", null,
	"scope", null,
	"branch", null,
	"loop", null,
	"switch", null,
	"nested_sync_and_asynch_functions", null,
	"constructor", null,
	"boolean_comparison", null,
	"exceptions", null,
	"exception_support_off", {exceptions: "false"},
	"notifier_API", null,
	"spawn", null,
	"notifiers_with_exceptions", null,
	"notifiers_without_exceptions", {exceptions: "false"},
	"dom_notifiers", null,
	"bugs", null,
];

var assertions = 0;
var failed     = 0;
function assert(bool, message) {
	assertions++;
	if (!bool) {
		failed++;
		
		print("Test failed: " + currentFile + ": " + message);
		var stack;
		if (stack = new Error().stack) {
			var lines = stack.split("\n");
			lines.shift();lines.shift();
			print("Stack trace:");
			for (var i = 0; i < lines.length; i++) {
				lines[i].match(/@([^@]*)$/);
				print("    " + RegExp.$1);
			}
		}
		print("");
	}
}

function fail(message) {
	assert(false, message);
}

var trail = [];
function trace(id) {
	trail.push(id);
}
function assertTrail(/*...*/) {
	var test = [];
	for( var i = 0; i < arguments.length; i++ ) {
		test.push(arguments[i]);
	}
	assert(test.join() == trail.join(), 
	       "Unmatched trail: expected " + test.join() + ", got " + trail.join());

	trail = [];
}

for (var i = 0; i < files.length; i += 2) {
	currentFile = "files/" + files[i] + ".runtime.js";
	var options = files[i+1];
	assertions = 0;
	failed     = 0;
	timeouts   = [];
	trail      = [];

	try {
		var text = new NjsCompiler(options).compile(readFile(currentFile), currentFile);
	} catch(e) {
		fail("Compilation failed: " + e.fileName + ":" + e.lineNumber + ": " + e.message);
		continue;
	}
	
	try {
		eval(text);
	} catch(e) {
		if (e) {
			fail("Uncaught eval exception: " + e.fileName + ":" + e.lineNumber + ": " + e.message);
		} else {
			fail("Uncaught empty exception");
		}
	}
	if (failed > 0) {
		print("Compiled code:");
		var lines = text.split("\n");
		for (var j = 0; j < lines.length; j++) {
			print("    " + lines[j]);
		}
	}
	
	print(files[i] + " complete, " + assertions + " assertions, " + failed + " failed");
}


var timeouts = [];
function setTimeout(callback, interval) {
	var obj = {callback: callback, at: new Date().getTime() + interval};
	for (var i = 0; i < timeouts.length; i++) {
		if (timeouts[i].at > obj.at) {
			timeouts.push(obj);
			return;
		}
	}
	timeouts.push(obj);
}

function runTimeouts(millis) {
	if (millis == null) {
		while(timeouts.length) {
			timeouts[0].callback();
			timeouts.shift();
		}
	} else {
		var at = new Date().getTime() + millis;
		while (timeouts[0] != null && timeouts[0].at <= at) {
			timeouts[0].callback();
			timeouts.shift();
		}
	}
}
