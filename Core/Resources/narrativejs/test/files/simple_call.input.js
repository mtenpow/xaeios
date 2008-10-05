function foo() {
	var a = doSomething1();
	var b = bar->(a);
	doSomething2(b);
}

function bar() {
	var c = doSomething1();
	foo->(c)
	doSomething2(d);
}