var notifier = NjsRuntime.createNotifier();

function test_interrupt() {
	var x = notifier.wait->();
	trace(x[0]);
	x = notifier.wait->();
	trace(x == NJS_INTERRUPT);
}

test_interrupt();
notifier("first");
notifier.interrupt();
assertTrail("first", true);
