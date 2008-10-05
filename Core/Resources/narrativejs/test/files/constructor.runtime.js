function foo() {
	trace(1);
	this.x = bar->();
	trace(2);
	this.toString = function() {
		return "foo instance";
	}
}

function bar(frame) {
	if (frame.isResuming())
		return frame.commence();

	setTimeout(function() { frame.resume("retval") }, 1);
	return frame.suspend();
}

function baz() {
	// make sure to execute each type of constructor -- with(out) args,
	// with(out) yielding -- to cover all the codepaths.
	trace(3);
	var y = new foo->();
	trace(4);
	new foo();
	trace(5);
	var z = new foo->(1);
	trace(6);
	new foo(1);
	trace(7);
	new foo;
	trace(8);
	trace(y.toString());
	trace(z.toString());
	trace(y.x);
}

baz();
runTimeouts();
assertTrail(3,1,2,4,1,5,1,2,2,6,1,7,1,8,"foo instance", "foo instance", "retval",2,2);