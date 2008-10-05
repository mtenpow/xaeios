function args_on_multiple_lines() {
	foo->(
		1,
		2,
		3);
	arguments;
}

function continuation_arg() {
	foo->(bar->(1,2,3));
}

function continuate_arg_on_separate_line() {
	foo->(
		bar->());
}

function continuation_args_multiple_lines() {
	bar->(
		baz->(1,2,3), 
		bee->(1,2), 
		blah->());
}