function sleep(millis) {
	var notifier = new EventNotifier();
	setTimeout(notifier, millis);
	notifier.wait->();
}    

function animate(element, property, endValue, duration, frequency) {    
	// calculate animation variables
	var frameCount = Math.ceil(duration/frequency);
	var startValue = parseInt(element.style[property], 10);
	var distance = endValue - startValue;
	var jumpSize = Math.ceil(distance/frameCount);

	// do the animation
	for (var i = 0; i < frameCount - 1; i++) {
		var nextValue = startValue + (jumpSize * i);
		element.style[property] = nextValue + "px";
		// note the yielding operation
		sleep->(frequency);
	}

	element.style[property] = endValue + "px";
}

function waitForClick(element) {
	var notifier = new EventNotifier();
	element.onclick = notifier;
	notifier.wait->();
}    

function run() {
	var theButton = document.getElementById("theButton");
	while(true) {
		theButton.innerHTML = "go right";
		
		// move the button to the right (note the blocking operations)
		waitForClick->(theButton);
		theButton.innerHTML = "-->";
		animate->(theButton, "left", 200, 1000, 20);

		theButton.innerHTML = "go left";

		// move the button to the left (again note the blocking operations)
		waitForClick->(theButton);
		theButton.innerHTML = "<--";
		animate->(theButton, "left", 0, 1000, 20);
	}
}
spawn(run());
