function ttrace(val) {
	trace(val);
	return true;
}

function ftrace(val) {
	trace(val);
	return false;
}

function retval(val) {
	return val;
}

function test1() {
	if (ttrace->('a') && ttrace->(2)) {
		trace(3);
	}
	if (ttrace->('b') && ftrace->(2)) {
		trace(3);
	}
	if (ftrace->('c') && ttrace->(2)) {
		trace(3);
	}
	
	if (ttrace->('d') || ttrace->(2)) {
		trace(3);
	}
	if (ftrace->('e') || ttrace->(2)) {
		trace(3);
	}
	if (ftrace->('f') || ftrace->(2)) {
		trace(3);
	}
}
test1();
assertTrail('a',2,3, 'b',2, 'c', 'd',3, 'e',2,3, 'f',2);

function test2() {
	if (ttrace->('a') && ftrace->(2) && ttrace->(3)) {
		trace(4);
	}
	
	if (ftrace->('b') || ttrace->(2) || ttrace->(3)) {
		trace(4);
	}

	if (ttrace->('c') && ttrace->(2) || ttrace->(3)) {
		trace(4);
	}

	if (ftrace->('d') && ttrace->(2) || ftrace->(3) && ttrace(4)) {
		trace(5);
	}
}
test2();
assertTrail('a',2, 'b',2,4, 'c',2,4, 'd',3);

function test3() {
	trace(retval->(1) && retval->(2) && retval->(3) && retval->(4));
	trace(retval->(0) && retval->(1) && retval->(2) && retval->(3));
	trace(retval->(0) || retval->(false) || retval->(1));
	trace(retval->(1) || retval->(2) || retval->(3));
	trace(retval->(0) && retval->(1) || retval->(false) && retval->(2));
}
test3();
assertTrail(4,0,1,1,false);


