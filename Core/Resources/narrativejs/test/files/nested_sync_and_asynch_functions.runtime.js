function sleep(millis, c) {
	if (c.isResuming())
		return c.commence();
	
	setTimeout(function() {c.resume()}, millis);
	return c.suspend();
}

function asynch_outer() {
	var ao = "~ao";
	function synch_outer() {
		var so = "~so";
		function asynch_inner() {
			var ai = "~ai";
			function synch_inner() {
				var si = "~si";
				ao = 1;
				so = 2;
				ai = 3;
				si = 4;
				trace([ao,so,ai,si].join(""));
				return "si";
			}
			sleep->(1);
			trace(synch_inner());
			trace([ao,so,ai].join(""));
			trace("ai");
		}
		asynch_inner();
		trace([ao,so].join(""));
		return "so";
	}
	sleep->(1);
	trace(synch_outer());
	trace(ao);
	trace("ao");
}

asynch_outer();
runTimeouts(3);
assertTrail("~ao~so", "so", "~ao", "ao", "1234", "si", "123", "ai");


function test_anon() {
	(function() {
		(function() {
			sleep->(1);
			trace(1);
		})->();
		trace(2);
	})();
	sleep->(1);
	trace(3);
}

test_anon();
runTimeouts(3);
assertTrail(1,2,3);