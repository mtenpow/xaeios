function test_simple() {
	if(true) {
		foo();
		bar->();
		baz();
	}
	bee();
}

function test_else() {
	if(true) {
		foo();
		bar->();
		baz();
	} else {
		baz();
		bar->();
		foo();
	}
	bee();
}

function test_mismatch() {
	if(true) {
		foo();
		baz();
	} else {
		foo();
		bar->();
		baz();
	}
	bee();
}

function test_condition() {
	if(foo->()) {
		bar();
		baz->();
		bee();
	}
	blah();
}

