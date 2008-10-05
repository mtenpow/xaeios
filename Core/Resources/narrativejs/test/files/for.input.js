function for_block() {
	var x = 1;
	for (var i = foo->() + x; i < bar->() + x; i++) {
		x = 2;
		baz();
		bee->();
		blah();
	}
	bang();
}

function for_in_block_varDecl() {
	for (var i = dumb->() in x.foo->()) {
		bar();
		baz->();
		bee();
	}
	blah();
}

function for_in_block_iterator() {
	for (i in foo) {
		bar();
		baz->();
		bee();
	}
	blah();
}

// bug found during development
function test_identifier_resolution() {
	var x = bar->();
	for(var i in x)
		x++
	
	for(var i = x; i < x + 1; i += x) 
		x++;
}
