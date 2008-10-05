function foo() {
	var x = "foo";
	var y = "foo";
	var z = "foo";
	
	function bar() {
		var x = "bar";
		var y = "bar";
		
		function baz() {
			var x = "baz";
			trace(x);
			trace(y);
			trace(z);
			bee->();
		}
		
		trace(x);
		trace(y);
		trace(z);
		baz->();
	}
	
	trace(x);
	trace(y);
	trace(z);
	bar->();
}

function bee() {
}

foo();
assertTrail("foo","foo","foo", "bar", "bar", "foo", "baz", "bar", "foo");

function doNothing(c) {
	return;
}

var constructor = "foo";
function test_constructor_identifier() {
	doNothing->();
	trace(constructor);
}
test_constructor_identifier();

assertTrail("foo");


function test_sub_identifier_in_scope() {
	doNothing->();
	var x = "foo";
	var y = {x:"bar"};
	trace(y.x);
	
	var x = 1;
	var x = 2;
}
test_sub_identifier_in_scope();
assertTrail("bar");

