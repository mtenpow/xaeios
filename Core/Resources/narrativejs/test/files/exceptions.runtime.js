function doThrow(c) {
	if (!c)
		assert(false, "ERROR: no context passed to doThrow");

	throw "ex";
}

function doReturn(c) {
	if (!c)
		assert(false, "ERROR: no context passed to doReturn");

	return;
}

function try_unyielded() {
	try {
		trace(1);
		throw({});
	} catch(e) {
		trace(2);
	} finally {
		trace(3);
	}
}

try_unyielded();
assertTrail(1,2,3);

function try_no_throw() {
	try {
		trace(1);
		doReturn->();
		trace(2);
	} catch(e) {
		trace(3);
	}
}
try_no_throw();
assertTrail(1,2);

function one_unguarded_catch() {
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e) {
		trace(e);
		trace(3);
	}
	trace(4);

	try {
		trace(1);
		doReturn->();
		throw("ex");
		trace(2);
	} catch(e) {
		trace(e);
		trace(3);
	}
	trace(4);
}

one_unguarded_catch();
assertTrail(1,"ex",3,4,1,"ex",3,4);

function multiple_guarded_catches() {
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "ex") {
		trace(e);
		trace(4);
	}
	trace(5);

	try {
		trace(1);
		doReturn->();
		throw("ex");
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "ex") {
		trace(e);
		trace(4);
	}
	trace(5);

	try {
		trace(1);
		doReturn->();
		throw("ex");
		trace(2);
	} catch(e if e == "ex") {
		trace(3);
	} catch(e if e == "blah") {
		trace(4);
	}
	trace(5);
}

multiple_guarded_catches();
assertTrail(1,"ex", 4,5,1,"ex",4,5,1,3,5);

function multiple_guarded_catches_with_one_unguarded_catch() {
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "ex") {
		trace(4);
	} catch(f) {
		trace(5);
	}
	trace(6);

	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "blee") {
		trace(4);
	} catch(f) {
		trace(5);
	}
	trace(6);
}

multiple_guarded_catches_with_one_unguarded_catch()
assertTrail(1,4,6,1,5,6);

function various_finally() {
	// one unguarded catch
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e) {
		trace(3);
	} finally {
		trace(4);
	}
	trace(5);

	// multiple guarded catches
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "ex") {
		trace(4);
	} finally {
		trace(5);
	}
	trace(6);

	// multiple guarded catches w/one unguarded
	try {
		trace(1);
		doThrow->();
		trace(2);
	} catch(e if e == "blah") {
		trace(3);
	} catch(e if e == "blee") {
		trace(4);
	} catch(f) {
		trace(5);
	} finally {
		trace(6);
	}
	trace(7);
	
	// finally w/no catch
	try {
		trace(1);
		try {
			trace(2);
			doThrow->();
			trace(3);
		} finally {
			trace(4);
		}
		trace(5);
	} catch(e) {
		trace(6);
	}
	trace(7);
}

various_finally();
assertTrail(1,3,4,5, 1,4,5,6, 1,5,6,7, 1,2,4,6,7)

function throw_from_catch() {
	try {
		trace(1);
		try {
			trace(2);
			doThrow->();
			trace(3);
		} catch(e) {
			trace(4);
			doThrow->();
			trace(5);
		} finally {
			trace(6);
		}
	} catch(e) {
		trace(7);
	}
	trace(8);
}

throw_from_catch();
assertTrail(1,2,4,6,7,8);

function throw_from_finally() {
	try {
		trace(1);
		try {
			trace(2);
			doThrow->();
			trace(3);
		} catch(e) {
			trace(4);
		} finally {
			trace(5);
			doThrow->();
			trace(6);
		}
	} catch(e) {
		trace(7);
	}
	trace(8);

	try {
		trace(1);
		try {
			trace(2);
			doThrow->();
			trace(3);
		} catch(e) {
			trace(4);
			doThrow->();
			trace(5);
		} finally {
			trace(6);
			doThrow->();
			trace(7);
		}
	} catch(e) {
		trace(8);
	}
	trace(9);
}

throw_from_finally();
assertTrail(1,2,4,5,7,8, 1,2,4,6,8,9);

function throw_up_multiple_frames_outer() {
	try {
		trace(1);
		throw_up_multiple_frames_inner->(5);
		trace(2);
	} catch(e if e == "ex") {
		trace(3);
	}
	trace(4);
}

function throw_up_multiple_frames_inner(i) {
	trace("i1:"+i);
	if(i == 0) {
		trace("i2");
		doThrow->();
		trace("i3");
	} else {
		trace("i4");
		arguments.callee->(i-1);
		trace("i5");
	}
	trace("i6");
}

throw_up_multiple_frames_outer();
assertTrail(1,"i1:5","i4","i1:4","i4","i1:3","i4","i1:2","i4","i1:1","i4","i1:0","i2",3,4);

function throw_into_runtime_outer() {
	throw_into_runtime_inner();
}

function throw_into_runtime_inner() {
	doThrow->();
}

try {
	throw_into_runtime_outer();
} catch(e) {
	if(e != "ex") {
		throw(e);
	} else {
		// test passed
	}
}

function nested_catch() {
	trace(1);
	try {
		trace(2);
		try {
			trace(3);
			doThrow->();
			trace(4);
		} catch(e) {
			trace(5);
			try {
				trace(6);
				doThrow->();
				trace(7);
			} catch(e) {
				trace(8);
				doThrow->();
				trace(9);
			} finally {
				trace(10);
			}
		} finally {
			trace(11);
		}
	} catch(e) {
		trace(12);
	}
	trace(13);
}
	
nested_catch();
assertTrail(1,2,3,5,6,8,10,11,12,13);

function yielding_in_clause_guard() {
	trace(1);
	try {
		trace(2);
		doThrow->();
		trace(3);
	} catch(e if doReturn->() == null) {
		trace(4);
	}
	trace(5);
}
yielding_in_clause_guard();
assertTrail(1,2,4,5);
