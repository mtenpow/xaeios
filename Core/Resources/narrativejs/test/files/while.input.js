function while_loop() {
	foo();
	while(cond->()) {
		bar();
		baz->();
		bee();
	}
	boo();
}

function do_while_loop() {
	foo();
	do {
		bar();
		baz->();
		bee();
	} while(cond->());
	boo();
}

// bugs found during development
function test_identifier_resolution() {
	var x = foo->();
	while(x)
		x++;

	do {
		x++;
	} while(x);
}