var notifier = NjsRuntime.createNotifier();
function test_notification() {
	trace(1);
	notifier.wait->();
	trace(2);
	notifier.wait->();
	trace(3);
	try {
		var x = notifier.wait->();
		trace(x); // shouldn't get traced
	} catch(e if e == NJS_INTERRUPT) {
		trace(4);
	}
}

test_notification();
notifier.action = notifier.notifyOne;
notifier();
notifier.action = notifier.notifyAll;
notifier();
notifier.action = notifier.interrupt;
notifier();
assertTrail(1,2,3,4);

function waitForNotify() {
	trace(1);
	notifier.wait->();
	trace(2);
}

waitForNotify();
waitForNotify();
waitForNotify();
waitForNotify();

notifier.notifyOne();
assertTrail(1,1,1,1,2);

notifier.notifyAll();
assertTrail(2,2,2);

notifier.notifyAll();
assertTrail();

function waitForArguments() {
	var args = notifier.wait->();
	for (var i = 0; i < args.length; i++)
		trace(args[i]);
}

waitForArguments();
notifier.notifyOne(1);
assertTrail(1);
waitForArguments();
notifier.action = notifier.notifyOne;
notifier(2);
assertTrail(2);

var currentTime = 0;

NjsRuntime.getEpoch = function() {
	return currentTime;
}

var timeouts = [];
// declare off of global to prevent x-browser scoping issues w/eval.
NjsGlobal.setTimeout = function(f, when) {
	timeouts.push([f, currentTime + when]);
}
function execTimeouts() {
	for (var i = 0; i < timeouts.length; i++) {
		var timeout = timeouts[i];
		if (timeout && timeout[1] <= currentTime) {
			timeout[0]();
			timeouts[i] = null;
		}
	}
}

function waitForTime(millis) {
	try {
		notifier.wait->(millis);
		trace(millis + ":notify");
	} catch(e if e == NJS_TIMEOUT) {
		trace(millis + ":timeout");
	}
}

waitForTime(5);
currentTime = 5;
execTimeouts();
assertTrail("5:timeout");

currentTime = 0;
waitForTime(5);
waitForTime(10);
currentTime = 7;
execTimeouts();
assertTrail("5:timeout");
notifier.notifyAll();
assertTrail("10:notify");


currentTime = 0;
waitForTime(15);
waitForTime(5);
waitForTime(10);
currentTime = 5;
execTimeouts();
assertTrail("5:timeout");
waitForTime(7);
notifier.notifyOne();
assertTrail("15:notify");
currentTime = 11;
execTimeouts();
assertTrail("10:timeout");
waitForTime(5);
waitForTime(4);
currentTime = 13;
execTimeouts();
assertTrail("7:timeout");
notifier.notifyAll();
assertTrail("5:notify","4:notify");
notifier.notifyOne();
assertTrail();