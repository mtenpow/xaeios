// test bug found by Christer Forslund,
// which cause bad compilation
function global_setup() {
	// don't use i, because global value conlicts with test runner
	for(xyz = 0; xyz < 10; xyz++) {
		foo->();
	}
	trace(xyz);
}

function foo() {
}

global_setup();
assertTrail(10);


// test bug found by Kris Zyp where
// a for loop without braces goes into
// an infinite loop
function test_infinite_loop() {
	for(var i = 0; i < 10; i++)
		foo->();

	trace(i);
}

test_infinite_loop();
assertTrail(10);


function bar(i) {
	trace(i);
}

function test_no_braces() {
	var x = {1:2, 3:4};
	for (var i in x)
		bar->(i);
}
test_no_braces();
assertTrail(1, 3);
