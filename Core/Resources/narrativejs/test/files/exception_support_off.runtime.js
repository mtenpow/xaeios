var continuation;

function halt(c) {
	if (c.isResuming())
		return c.commence();

	continuation = c;
	return c.suspend();
}

function foo() {
	var x = halt->();
	trace(x);
}

foo();
continuation.except("no exception");
assertTrail("no exception");


function bar() {
	trace("before halt");
	var x = halt->();
	throw(x);
}
try {
	bar();
} catch(e) {
	trace("shouldn't get here");
}

try {
	continuation.resume("after halt");
} catch(e) {
	trace(e);
}

assertTrail("before halt", "after halt");