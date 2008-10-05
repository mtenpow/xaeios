var obj = {
	ptr: 7
};

var coro;

function go(arg, frame) {
	if (frame.isResuming()) {
		coro = null;
		return frame.commence();
	}
	
	trace(arg);
	coro = frame;
	return frame.suspend();
}

function doSwitch(a,obj) {
	go->("-");
	switch(a) {
		case 1:
			go->("a1");
			break;
		case "2":
			go->("a2");
			break;
		
		case 3:
		case 4:
			go->("a3-4");
			break;
		
		case 5:
			go->("a5");
		case 6:
			go->("a6");
			break;
		
		case obj.ptr:
			go->("obj.ptr");
			switch (obj.switcher) {
				default:
					go->("obj-default");
					break;
					
				case 2:
					go->("obj2");
					break;
					
				case 1:
					go->("obj1");
					break;
			}
			break;
		
		default:
			go->("a-default");
	}
	go->("-");
	
}

function runSwitch(a,b) {
	obj.switcher = b;
	doSwitch(a,obj);
	while (coro != null) {
		coro.resume();
	}
}

runSwitch(1);
assertTrail("-","a1","-");

runSwitch("2");
assertTrail("-","a2","-");

runSwitch(3);
assertTrail("-","a3-4","-");

runSwitch(4);
assertTrail("-","a3-4","-");

runSwitch(5);
assertTrail("-","a5","a6","-");

runSwitch(6);
assertTrail("-","a6","-");
 
runSwitch(7,1);
assertTrail("-","obj.ptr","obj1","-");

runSwitch(7,2);
assertTrail("-","obj.ptr","obj2","-");

runSwitch(7,null);
assertTrail("-","obj.ptr","obj-default","-");

runSwitch(null);
assertTrail("-","a-default","-");
