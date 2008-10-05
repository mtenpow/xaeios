/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is the Narrative JavaScript compiler.
 *
 * The Initial Developer of the Original Code is
 * Neil Mix (neilmix -at- gmail -dot- com).
 * Portions created by the Initial Developer are Copyright (C) 2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */


/* ----------------------------------------------------
                     public
   ---------------------------------------------------- */

NJS_TIMEOUT   = { toString: function() { return "NJS_TIMEOUT"} };
NJS_INTERRUPT = { toString: function() { return "NJS_INTERRUPT"} };

// use xNotifier = function() notation rather than function xNotifier()
// notation to sidestep a Safari closures bug.

EventNotifier = function(retval) {
	var n = function(value) {
		if (retval != null) {
			n.action(retval);
		} else if(typeof(value) != 'undefined') {
			n.action(value);
		} else if(typeof(event) == "object") {
			n.action(event);
		} else {
			n.action();
		}
	}
	n.constructor = EventNotifier;
	NjsRuntime.initNotifier(n);
	n.action      = n.notifyAll;
	n.persistence = n.ephemeral;
	n.returnType  = n.eventArgument;
	return n;
}

ResultNotifier = function() {
	this.constructor = ResultNotifier;
	NjsRuntime.initNotifier(this);
	this.action      = this.notifyAll;
	this.fulfill     = this.action;
	this.persistence = this.permanent;
	this.returnType  = this.firstArgument;
}

ResultNotifier.prototype.hasValue = function() {
	return this.results.length > 0;
}

ResultNotifier.prototype.value = function() {
	if (arguments.length) {
		return this.wait(arguments[0], arguments[1]);
	} else {
		if (this.results.length) {
			var result = this.results[0];
			if (result[1]) {
				throw result[0];
			} else {
				return result[0];
			}
		} else {
			throw new Error("Can't return value because notifier hasn't been fulfilled");
		}
	}
}

QueueNotifier = function() {
	this.constructor = QueueNotifier;
	NjsRuntime.initNotifier(this);
	this.action      = this.notifyOne;
	this.push        = this.action;
	this.persistence = this.queued;
	this.returnType  = this.firstArgument;
	this.shift       = this.wait;
}

QueueNotifier.prototype.size = function() {
	return this.results.length;
}

function isNotifier(n) {
	return n != null &&
	       (typeof(n) == "object" || typeof(n) == "function") &&
	       (n.constructor == EventNotifier ||
	        n.constructor == ResultNotifier ||
	        n.constructor == QueueNotifier);
}

function spawn(value) {
	if (isNotifier(value) && value.constructor == ResultNotifier) {
		return value;
	} else {
		var n = new ResultNotifier();
		n.fulfill(value);
		return n;
	}
}

/* ----------------------------------------------------
                     private
   ---------------------------------------------------- */

/* ----------------------------------------------------
                      NjsRuntime
   ---------------------------------------------------- */

NjsRuntime = {
};

// these methods are shortcuts (small names for smaller compilations sizes)
// for the NjsRuntime equivalents.

function njen(/*...*/) {
	return NjsRuntime.enterFrame.apply(NjsRuntime, arguments);
}

function njkeys(obj) {
	var keys = [];
	for(var n in obj) {
		keys.push(n);
	}
	return keys;
}

// global decl
NjsGlobal = this;

// deprecated
NjsRuntime.createNotifier = function() {
	var n = function(value) {
		n.action(value);
	}
	n.constructor = EventNotifier;
	this.initNotifier(n);	
	
	n.action      = n.notifyAll;
	n.persistence = n.ephemeral;
	n.returnType  = n.allArguments;
	return n;
}

// deprecated
NjsRuntime.createDomNotifier = function() {
	return EventNotifier();
}

NjsRuntime.initNotifier = function(n) {
	for (var m in this.notifierMethods) {
		n[m] = this.notifierMethods[m];
	}
	
	n.waiting  = [];
	n.results  = [];
}

NjsRuntime.notifierMethods = {
	notifyOne: function(value) {
		if ((value = this.chainNotification(value)) == NjsRuntime.SUSPEND)
			return;

		var waiter = null;
		do {
			var waiter = this.waiting.shift();
			if (waiter) {
				waiter = [waiter];
				break;
			}
		} while (waiter == null && this.waiting.length);
		this.notify(waiter || [], value);
	},

	notifyAll: function(value) {
		if ((value = this.chainNotification(value)) == NjsRuntime.SUSPEND)
			return;

		// replace our waiting array before doing any callbacks to
		// prevent accidental duplicate resumes of the coroutines
		var waiters = [];
		for (var i = 0; i < this.waiting.length; i++) {
			if (this.waiting[i]) {
				waiters.push(this.waiting[i]);
			}
		}
		this.waiting = [];
		this.notify(waiters, value);
	},
	
	interrupt: function() {
		this.except(NJS_INTERRUPT);
	},

	chainNotification: function(value) {
		if (!this.isException) {
			while (isNotifier(value)) {
				value = value.wait(this);
			}
		}
		return value;
	},

	notify: function(waiters, value) {
		var result;
		if (this.isException) {
			result = [value, true];
			this.isException = false;
		} else {
			result = [this.returnType(value), false];
		}
		
		// do this before delivery to prevent race conditions
		// and to give persistence an opportunity to raise errors.
		this.persistence(waiters.length, result);

		for (var i = 0; i < waiters.length; i++) {
			if (result[1]) {
				waiters[i].except(result[0]);
			} else {
				waiters[i].resume(result[0]);
			}
		}
	},
			
	wait: function(timeLimit, frame) {		
		if (frame == null) {
			frame = timeLimit;
			timeLimit = null;
		}
		
		if (frame == null)
			throw new Error("You must use the -> operator when calling this method");

		if (frame.isResuming())
			return frame.commence();
		
		if (this.results.length) {
			var result = this.results[0];
			this.persistence(1, null);
			if (result[1]) {
				throw result[0];
			} else {
				return result[0];
			}
		}

		this.waiting.push(frame);
		if (timeLimit && NjsGlobal.setTimeout) {
			var _this = this;
			NjsGlobal.setTimeout(function() { 
				_this.checkTimeout(frame); 
			}, timeLimit);
		}
		
		return frame.suspend();
	},
	
	checkTimeout: function(frame) {
		for (var i = 0; i < this.waiting.length; i++) {
			if (this.waiting[i] == frame) {
				this.waiting[i] = null;
				frame.except(NJS_TIMEOUT);
			}
		}
	},
	
	ephemeral: function(count, result) {
		// do nothing
	},
	
	permanent: function(count, result) {
		if (result) {
			if (this.results.length) {
				throw new Error("This notifier already has a return value");
			} else {
				this.results.push(result);
			}
		}
	},
	
	queued: function(count, result) {
		if (count && result == null) {
			this.results.shift();
		} else if (!count && result != null) {
			this.results.push(result);
		} else if(!count && result == null) {
			throw new Error("Internal error.  Sorry.");
		}
	},
	
	eventArgument: function(value) {
		if (typeof(value) != 'undefined') {
			return value;
		} else if (typeof(event) != "undefined") {
			return event;
		} else {
			return value; // undefined
		}
	},
	
	firstArgument: function(value) {
		return value;
	},
	
	// for backward "compatibility" only!
	allArguments: function(value) {
		return [value];
	},

	// methods that make a notifier look like a coroutine
	
	except: function(ex) {
		this.isException = true;
		if (this.action == this.interrupt) {
			this.notifyAll(ex);
		} else {
			this.action(ex);
		}
	},

	resume: function(retval) {
		this.action(retval);
	},
	
	isResuming: function() {
		return false;
	},
	
	suspend: function() {
		return NjsRuntime.SUSPEND;
	}
};


// default frame state
NjsRuntime.CALL    = { toString: function() { return "NjsRuntime.CALL" } };

// returned value when a coroutine is suspended, and state of the top frame when suspended
NjsRuntime.SUSPEND = { toString: function() { return "NjsRuntime.SUSPEND" } };

// frame state when resuming a coroutine
NjsRuntime.RESUME  = { toString: function() { return "NjsRuntime.RESUME" } };

// frame state for the top frame when returning a value into a coroutine
NjsRuntime.RETURN  = { toString: function() { return "NjsRuntime.RETURN" } };

// frame state for the top frame when throwing an exception into a coroutine
NjsRuntime.THROW   = { toString: function() { return "NjsRuntime.THROW" } };

NJSUS = NjsRuntime.SUSPEND; // shortcut to reduce code bloat

// special identifer for constructors
NjsRuntime.NEW = { toString: function() { return "NjsRuntime.NEW" } };
NJNEW = NjsRuntime.NEW;


NjsRuntime.resume = function(frame) {
	while(frame.pf != null) {
		frame = frame.pf;
	}
	
	if (frame.fh.onResume)
		frame.fh.onResume();

	var retval = frame._arguments.callee.call(frame.frameThis, frame);
	if (frame.state == this.SUSPEND) {
		if (frame.fh.onSuspend)
			frame.fh.onSuspend();
	} else {
		frame.fh.fulfill(retval);
	}
}

NjsRuntime.enterFrame = function(frameThis, args /*, ... argNames ... */) {
	var index = args.length - 1;
	var frame = args[index];
	if (frame == null || typeof(frame) != "object" || frame.constructor != NjsCoroutineFrame) {
		// this is a new "thread"
		frame = new NjsCoroutineFrame(null, args);
		frame.fh = new ResultNotifier(); // will eventually be a scheduler or future object
	} else {
		// remove the frame from the arguments
		delete args[index];
		args.length = index;

		if (frame.state == this.CALL) {
			// the method is being invoked by another frame, and thus the frame
			// we've been given is the parent frame
			frame.a.pop();
			frame.a = [frame];
			frame = frame.cf;
		} else if (frame.state == this.SUSPEND) {
			// bottom frame in a resuming a coroutine
			if (frame.cf == null)
				throw new Error("null child frame");
			frame.state = this.RESUME;
		} else if (frame.state == this.RESUME) {
			// we're a frame in a resuming coroutine
			if (frame.cf == null)
				throw new Error("null child frame");

			frame.state = this.CALL;
			frame = frame.cf;
			
			if (frame.state == this.RESUME || frame.state == this.CALL)
				throw new Error("Invalid state while resuming: " + frame.state);

			if (frame.state == this.SUSPEND)
				frame.state = this.RESUME;

		} else if (frame.cf != null) {
			throw new Error("Invalid resume state for a frame that has children: " + frame.state);
		}
	}
	
	if (frame.frameThis == null) {
		// this a new frame entry.  We need to init the frame context
		frame.frameThis  = frameThis;
		
		for( var i = 2; i < arguments.length; i++ ) {
			// _arguments is set either above or in frame.pc()
			frame['_' + arguments[i]] = frame._arguments[i-2];
		}
	}
	return frame;
}

/* ----------------------------------------------------
                  NjsCoroutineFrame
   ---------------------------------------------------- */

function NjsCoroutineFrame(parentFrame, args) {
	this.pf = parentFrame;
	this._arguments = args;
}

NjsCoroutineFrame.prototype = {
	constructor: NjsCoroutineFrame,
	state:       NjsRuntime.CALL,
	pf:          null,     // parent frame
	cf:          null,     // child frame
	cp:          0,        // current code pointer
	ecp:         null,     // exception code pointer
	thr:         false,    // is throwing an exception
	fh:          NjsRuntime.SUSPEND, // frame handle, only set if it's the bottom frame
	//retval:    undefined // return value on resume
	//exception: undefined // exception thrown on resume

	pc: function(cp, caller, callee, args) { // prepare call
		args.push(this);
		var frame = new this.constructor(this, args);
		if (caller == NjsRuntime.NEW) {
			this.c = {};
			for (var n in callee.prototype) {
				this.c[n] = callee.prototype[n];
			}
			this.c.constructor = callee;
			this.f = callee;
		} else {
			this.c = caller;
			this.f = caller ? caller[callee] : callee;
		}
		this.a = args;
		args.callee = this.f;
		
		this["rv" + cp] = undefined;
		this.cf = frame;
		this.cp = cp;
	},
	
	suspend: function() {
		if (this.state != NjsRuntime.CALL)
			throw new Error("Invalid state when calling suspend: " + this.state + " -- did you forget to commence()?");

		this.state = NjsRuntime.SUSPEND;
		this.cf = null; // null out pre-created child frame to appease assertions
		var p = this.pf;
		while (p != null) {
			p.state = NjsRuntime.SUSPEND;
			p = p.pf;
		}
		return NjsRuntime.SUSPEND;
	},
	resume: function(retval) {
		if (this.state != NjsRuntime.SUSPEND)
			throw new Error("Invalid state when calling resume: " + this.state + " -- did you forget to suspend()?");

		this.state  = NjsRuntime.RETURN;
		this.retval = retval;
		NjsRuntime.resume(this);
	},
	except: function(exception) {
		if (this.state != NjsRuntime.SUSPEND)
			throw new Error("Invalid state when calling except: " + this.state + " -- did you forget to suspend()?");

		this.state = NjsRuntime.THROW;
		this.exception = exception;
		NjsRuntime.resume(this);
	},
	isResuming: function() {
		return this.state != NjsRuntime.CALL;
	},
	commence: function() {
		if(this.state == NjsRuntime.RETURN) {
			this.state = NjsRuntime.CALL;
			return this.retval;
		} else if(this.state == NjsRuntime.THROW) {
			this.state = NjsRuntime.CALL;
			this.thr   = true;
			if (this.noex) { // flag set by compiled code at runtime
				return this.exception;
			} else {
				throw this.exception;
			}
		} else {
			throw new Error("Invalid state when calling commence: " + this.state + " -- did you check isResuming() first?");
		}
	},
	doex: function(exception) {
		if (this.ecp == null)
			throw exception;

		this.thr = true;
		this.ex  = exception;
		this.cp  = this.ecp;
	}
};

// stubbed out time function for testing purposes
NjsRuntime.getEpoch = function() {
	return new Date().getTime();
}

NjsRuntime.createXmlHttp = function() {
    var http = null;
	try{ http = new XMLHttpRequest(); }catch(e){}
	if (!http) try{ http = new ActiveXObject('Msxml2.XMLHTTP') }catch(e){}
	if (!http) try{ http = new ActiveXObject('Microsoft.XMLHTTP') }catch(e){}
	if (!http) try{ http = new ActiveXObject('Msxml2.XMLHTTP.4.0') }catch(e){}
	if (!http) throw new Error("XmlHTTP not available");
	return http;
}
