var en = new EventNotifier();

function waiter() {
	en.wait->();
	trace("running");
	en.wait->();
	return "done";
}

var future = spawn(waiter());
future.onResume = function() {
	trace("resume");
}
future.onSuspend = function() {
	trace("suspend");
}

function futureWaiter() {
	trace(future.wait->());
}
spawn(futureWaiter());

assert(!future.hasValue());
en();
assertTrail("resume","running","suspend");
en();
assertTrail("resume","done");
assert(future.hasValue());
assert(future.value() == "done");


var f = spawn(5);
assert(f.value() == 5);

var en = new EventNotifier();
f = spawn(en);
assert(!f.hasValue());
en(6);
assert(f.value() == 6);