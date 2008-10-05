var notifier = NjsRuntime.createDomNotifier();

function test_retval() {
	var x = notifier.wait->();
	trace(x);
}

test_retval();
test_retval();
test_retval();
notifier.action = notifier.notifyOne;
notifier("foo");
notifier.action = notifier.notifyAll;
notifier("bar");
assertTrail("foo", "bar", "bar");


test_retval();
test_retval();
test_retval();
notifier.notifyOne("foo");
notifier.notifyAll("bar");
assertTrail("foo", "bar", "bar");


// test IE compatibility
// ironically enough, we can't run this test in IE
if (typeof(event) == "undefined") {
	test_retval();
	test_retval();
	test_retval();
	event = "foo";
	notifier.notifyOne();
	event = "bar";
	notifier.notifyAll();
	assertTrail("foo", "bar", "bar");
}
