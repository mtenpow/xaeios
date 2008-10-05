var en = EventNotifier();
function comeback(frame) {
	return en.wait->();
}

(function() {
	while(true) {
		trace("while1:1");
		comeback->();
		break;
		trace("while1:2");
	}
	trace("while1:3");
})();
en();
assertTrail("while1:1","while1:3");


(function() {
	var i = 0;
	while(i < 1) {
		i++;
		trace("while2:1");
		comeback->();
		trace("while2:2");
		if(true)
			continue;
		trace("while2:3");
	}
	trace("while2:4");
})();
en();
assertTrail("while2:1","while2:2","while2:4");


(function() {
	do {
		trace("do1:1");
		comeback->();
		trace("do1:2");
		break;
		trace("do1:3");
	} while(true);
	trace("do1:4");
})();
en();
assertTrail("do1:1","do1:2","do1:4");


(function() {
	var i = 0;
	do {
		i++;
		trace("do2:1");
		comeback->();
		trace("do2:2");
		if (i == 1)
			continue;
		trace("do2:3");
	} while(i <= 1);
	trace("do2:4");
})();
en();en();
assertTrail("do2:1","do2:2","do2:1","do2:2","do2:3","do2:4");


(function() {
	for(var i = 0; i < 3; i++) {
		trace("for1:1");
		comeback->();
		if (i == 0)
			continue;
		trace("for1:2");
		break;
		trace("for1:3");
	}
	trace("for1:4");
})();
en();en();en();
assertTrail("for1:1","for1:1","for1:2","for1:4");


(function() {
	var obj = { x: 1, y: 2, z: 3 };
	var i = 0;
	for (var n in obj) {
		i++;
		trace("forin1:1");
		comeback->();
		if (i == 1)
			continue;
		trace("forin1:2");
		break;
		trace("forin1:3");
	}
	trace("forin1:4");
})();
en();en();en();
assertTrail("forin1:1","forin1:1","forin1:2","forin1:4");
	