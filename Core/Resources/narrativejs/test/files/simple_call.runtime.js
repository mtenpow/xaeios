function foo() {
	trace("before");
	var x = "assigned val";
	var y = bar->("first", "second");
	trace(y);
	trace(x);
}

function bar(arg1, arg2) {
	trace(arguments.length);
	trace(arg1);
	trace(arg2);
	return baz->();
}

// regular return
var baz = function(frame) {
	return "after";
}

foo();
assertTrail("before", 2, "first", "second", "after", "assigned val");

// same thing, but with suspend
var baz = function(frame) {
	if (frame.isResuming())
		return frame.commence();
	
	gFrame = frame;
	return frame.suspend();
}

foo();
gFrame.resume("after");
assertTrail("before", 2, "first", "second", "after", "assigned val");


function bee() {
	var i = 1;
	i += 7;
	trace(i);
	i -= 2;
	trace(i);
	i /= 3;
	trace(i);
	i *= 5;
	trace(i);
	baz->();
}
bee();

assertTrail(8,6,2,10);

var x = { doit: function() { trace(this == x) } };
function test_property_access() {
	x["doit"]();
	x["doit"]->();
}
test_property_access();
assertTrail(true, true);
