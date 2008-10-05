var en = new EventNotifier();

function test_EventNotifier() {
	trace(2);
	trace(en.wait->());
	trace(4);
	trace(en.wait->());
	trace(6);
}

en(1);
test_EventNotifier();
en(3);
en(5);
assertTrail(2,3,4,5,6);

en = new EventNotifier("foo");
en(1);
test_EventNotifier();
en(3);
en(5);
assertTrail(2,"foo",4,"foo",6);

var rn = new ResultNotifier();

function test_ResultNotifier1() {
	trace(1);
	trace(rn.wait->());
	trace(2);
	trace(rn.wait->());
	trace(3);
}

function test_ResultNotifier2() {
	trace(4);
	trace(rn.wait->());
	trace(5);
	trace(rn.wait->());
	trace(6);
}

try {
	rn.value();
	throw "rn.value() with empty notifier didn't throw exception";
} catch(e) {
}

test_ResultNotifier1();
test_ResultNotifier2();
assertTrail(1,4);
rn.fulfill("rn");
assertTrail("rn",2,"rn",3,"rn",5,"rn",6);

try {
	rn.fulfill("blah");
} catch(e) {
	trace(1);
}

assertTrail(1);



var qn = new QueueNotifier();

function test_QueueNotifier(id) {
	while(true) {
		trace(id);
		trace(qn.shift->() + id);
	}
}

qn.push("a");
test_QueueNotifier(1);
test_QueueNotifier(2);
assertTrail(1,"a1",1,2);

qn.push("b");
qn.push("c");
assertTrail("b1",1,"c2",2);

test_QueueNotifier(3);

qn.push("d");
qn.push("e");
qn.push("f");

assertTrail(3,"d1",1,"e2",2,"f3",3);

var en = new EventNotifier();
var rn = new ResultNotifier();
function test_event_result_chain() {
	trace(en.wait->());
	trace(en.wait->());
}
test_event_result_chain();
assertTrail();
en(rn);
assertTrail();
rn.fulfill("rn");
assertTrail("rn");
en(2);
assertTrail(2);

var rn1 = new ResultNotifier();
var rn2 = new ResultNotifier();
var en = new EventNotifier();
function test_result_event_chain() {
	trace(rn1.wait->());
	trace(rn1.wait->());
	trace(rn2.wait->());
	trace(rn2.wait->());
}
rn1.fulfill(en);
en("en1");
test_result_event_chain();
assertTrail("en1","en1");
rn2.fulfill(en);
assertTrail();
en("en2");
assertTrail("en2","en2");
en("en3");
assertTrail();


var en = new EventNotifier();
var qn = new QueueNotifier();
function test_event_queue_chain() {
	trace(en.wait->());
	trace(en.wait->());
}
test_event_queue_chain();
assertTrail();
en(qn);
assertTrail();
qn.push("qn1");
assertTrail("qn1");
qn.push("qn2");
assertTrail();
en(2);
assertTrail(2);

var qn = new QueueNotifier();
var en = new EventNotifier();
function test_queue_event_chain() {
	trace(qn.wait->());
	trace(qn.wait->());
	trace(qn.wait->());
}
test_queue_event_chain();
qn.push(en);
assertTrail();
en("en1");
assertTrail("en1");
en("en2");
assertTrail();
qn.push(en);
qn.push(en);
en("en3");
en("en4");
assertTrail("en3","en3");


var rn = new ResultNotifier();
var qn = new QueueNotifier();
function test_result_queue_chain() {
	trace(rn.wait->());
	trace(qn.wait->());
	trace(rn.wait->());
}
test_result_queue_chain();
rn.fulfill(qn);
assertTrail();
qn.push("qn1");
assertTrail("qn1");
qn.push("qn2");
assertTrail("qn2","qn1");


var qn = new QueueNotifier();
var rn = new ResultNotifier();
function test_queue_result_chain() {
	trace(qn.wait->());
	trace(qn.wait->());
	trace(qn.wait->());
}
test_queue_result_chain();
qn.push(rn);
assertTrail();
rn.fulfill("rn");
assertTrail("rn");
qn.push("qn");
qn.push(rn);
assertTrail("qn","rn");


var rn1 = new ResultNotifier();
var rn2 = new ResultNotifier();
function test_exception_chain() {
	try {
		rn1.wait->();
		trace("failed");
	} catch(e) {
		trace(e);
	}
}
test_exception_chain();
rn1.fulfill(rn2);
assertTrail();
rn2.except("ex");
assertTrail("ex");