function foo() {
	trace("before");
	var x = bar->();
	trace(x);
}

function bar() {
	return baz->();
}

var baz = function(frame) {
	return bee();
}

function bee() {
	return "after";
}

foo();
assertTrail("before", "after");


var baz = function(frame) {
	gFrame = frame;
	if (frame.isResuming())
		return frame.commence();

	return frame.suspend();
}

foo();
gFrame.resume(bee());
assertTrail("before", "after");
