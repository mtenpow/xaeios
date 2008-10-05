// test fix for bug where
//   if (true)
//     a = test2->()
// was compiling out the assignment

function test() {
	var a;
	if (true)
		a = test2->();
	trace(a);
}

function test2(coro) {
	if (coro.isResuming())
		return coro.commence();
		
	coro.suspend();
	coro.resume(5);
	return NjsRuntime.SUSPEND;
}

test();
assertTrail(5);

// fix infinite loop bug caused by failure to
// rethrow uncaught exceptions
function testInfiniteLoop() {
	nonexistent();
	try {
		any->();
	} catch(e) {
	}
}
try {
	testInfiniteLoop();
	assert(false, "no exception");
} catch(e) {
	assert(true, "got exception");
}


// make sure you can call a non-transformed
// routine with the -> operator
function foo(i) {
	trace(i);
}

function testRegularMethod() {
	trace(1);
	foo->(2);
	trace(3);
}
testRegularMethod();
