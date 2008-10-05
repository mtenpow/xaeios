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

NJS_CODE = Narcissus.REGEXP; // fake node type for njs code segment

function NjsCompiler(options) {
	this.nodeSequence = 0;
	this.options = options || {};
	this.parseBooleanOptions("exceptions", true);
}

NjsCompiler.load = function(url, options) {
	var c = new NjsCompiler(options);

	var http = NjsRuntime.createXmlHttp();
	http.open('GET', url, false);
	try {
		http.send(null);
	} catch(e) {
		return null;
	}

	var text = http.responseText;
	if (text == null) 
		throw new Error("Unable to load URL: " + url);
	
	NjsGlobal.eval(c.compile(text, url));
}

var njscp = NjsCompiler.prototype;

njscp.parseBooleanOptions = function (/*...*/) {
	var options = this.options;
	for (var i = 0; i < arguments.length; i += 2) {
		var name = arguments[i];
		var value = options[name];
		if (value == null) {
			options[name] = arguments[i+1];
		} else {
			if (typeof(value) == "string")
				value = value.toLowerCase();
	
			options[name] = value == "yes" || value == "true" || value == "on" || value == "1";
		}
	}
}

njscp.compile = function (/*string*/ code, /*string*/ scriptName) {
	var n = Narcissus.parse(code, scriptName, 1); 
	this.treeify(n);

	var resolver = new NjsScopeResolver();
	resolver.push(n, false);
	
	n = this.assemble(n, resolver, this.options);

	var writer = new NjsScriptWriter();
	writer.add(n);
	return writer.toString();
}

njscp.treeify = function(n) {
	if (n.type == Narcissus.SWITCH) {
		// hack.  *sigh*  n.cases is an array, not a Node.  So we have
		// to fool our treeification process into thinking this node
		// has Node children.
		for (var i = 0; i < n.cases.length; i++) {
			n[i] = n.cases[i];
		}
		n.length = n.cases.length;
	}
	
	if (n.type == Narcissus.TRY) {
		// another hack.  catchClauses is a regular array.
		for (var i = 0; i < n.catchClauses.length; i++) {
			n["catch" + i] = n.catchClauses[i];
		}
	}
	
	// for-in constructs will use the identifier node within its varDecl
	// as the iterator value, which means it may get operated on twice
	// during the treeification process.
	if( n.treeified )
		return;

	n.treeified = true;
	
	for (var i in n) {
		if (n[i] != null &&
		    typeof(n[i]) == 'object' &&
		    n[i].constructor == Narcissus.Node &&
			i != "target" &&
			i != "parent") 
		{
			var child = n[i];

			// set this before treeification so that our parent is available
			// in the post-treeification below.
			child.parent = n;

			this.treeify(child);

			if ((child.yielding || child.yieldOp) && child.type != Narcissus.FUNCTION)
				n.yielding = true;			
			
			if (n.yieldOp)
				n.yielding = true;
		}
	}
	
	if (n.type == Narcissus.TRY) {
		n = n.parent;
		while (n != null && n.type != Narcissus.FUNCTION)
			n = n.parent;
		
		if (n != null)
			n.hasTry = true;
	}
}

njscp.noderize = function(opts) {
	var n = new Array();
	n.nodeID = this.nodeSequence++;
	n.toString = Narcissus.Node.prototype.toString;
	if (opts) {
		for (var i in opts) {
			n[i] = opts[i];
		}
	}
	n.isNode = true;
	return n;
}

njscp.assemble = function(root, scopeResolver, options) {
	// make consts names available to execute()
	eval(Narcissus.consts);

	// declare these locally so they can be used within closures
	var noderize = NjsCompiler.prototype.noderize; 
	var assemble = NjsCompiler.prototype.assemble;
	
	var codePtrSequence = 0;
	var conditionSequence = 0;

	var stack = [];
	var exPtrStack = [];
		
	var statements = [];
	while (root.length) {
		tailFrame = null;
		statements.push(execute(root.shift()));
	}

	for( var i = 0; i < statements.length; i++ ) {
		if (statements[i])
			root.push(statements[i]);
	}

	return root;
	
	function execute(node) {
		if (node == null)
			return null;

		stack.push(node);
		
		switch(node.type) {
		  case SCRIPT:
			throw new Error("what's a script doing in a statement?");

		  case FUNCTION:
		  	if (scopeResolver.isYielding() && node.name) {
		  		node.scoped = true;
		  		node.name = scopeResolver.addSymbol(node.name);
		  	}
			if (isYielding(node.body)) {
				scopeResolver.push(node.body, true);
				var params = '';
				for (var i = 0; i < node.params.length; i++) {
					params += ',"' + node.params[i] + '"';
					scopeResolver.addSymbol(node.params[i]);
				}
				
				var openNodes = [
					codeNode('var ~=njen(this,arguments~);',
					         scopeResolver.getCurrentFrame(),
				             params),
				    codeNode('nj:while(1){'),
				    (!options.exceptions ?
						codeNode("~.noex=1;", scopeResolver.getCurrentFrame()) :
				        node.hasTry ?
				          codeNode('try{') :
				          codeNode('')),
				    codeNode('switch(~.cp){case 0:', scopeResolver.getCurrentFrame())
				];

				while (openNodes.length)
					node.body.unshift(openNodes.pop());

				node.body.push(codeNode("break nj;}"));
				if (options.exceptions && node.hasTry)
					node.body.push(codeNode("}catch(ex){~.doex(ex)}",
					                        scopeResolver.getCurrentFrame(),
					                        scopeResolver.getCurrentFrame(),
					                        scopeResolver.getCurrentFrame()));
				node.body.push(codeNode("}"));

				assemble(node.body, scopeResolver, options);

				scopeResolver.pop();
			} else {
				scopeResolver.push(node.body, false);
				assemble(node.body, scopeResolver, options);
				scopeResolver.pop();
			}
			break;
  		  
		  case NEW: case NEW_WITH_ARGS: case CALL:
			// execute our identifier and args *first*
			node[0] = execute(node[0]);
						
			if (node[1]) // new (without args) doesn't have a list
				node[1] = execute(node[1]);
			
			if (!node.yieldOp)
				break;
			
			codePtrSequence++;
			
			// figure out who/what are being called
			var caller;
			var callee;
			if (node[0].type == DOT) {
				caller = node[0][0];
				callee = codeNode('"' + node[0][1].value + '"');
			} else if(node[0].type == INDEX) {
				caller = node[0][0];
				callee = node[0][1];
			} else if(node.type != CALL) {
				caller = codeNode("NJNEW");
				callee = node[0];
			} else {
				caller = codeNode("null");
				callee = node[0];
			}
			
			// new (without args) doesn't have a list. build one.
			if (!node[1]) {
				node[1] = noderize({type: LIST});
				node.type = NEW_WITH_ARGS;
			}

			// turn the call list into an array
			node[1].type = ARRAY_INIT;
			
			// create our new child frame
			statements.push(noderize({
				type: SEMICOLON,
				expression: noderize({
					type: CALL,
					0: codeNode("~.pc", scopeResolver.getCurrentFrame()),
					1: noderize({
						type: LIST,
						0: codeNode(codePtrSequence),
						1: caller,
						2: callee,
						3: node[1]
					})
				})
			}));

			// set up our re-entry point
			newCodeSegment(codePtrSequence);
							 
			// remove the call node from the stack,
			// replace it with rv if necessary
			if (stack.length > 1 && stack[stack.length-2].type == SEMICOLON) {
				// simple semicolon expression.  don't bother
				// with retval -- there aren't any dependencies
				replaceNode(null);
			} else {
				if (node.type == CALL) {
					replaceNode(codeNode("~.rv~", 
										 scopeResolver.getCurrentFrame(),
										 codePtrSequence));
				} else {
					replaceNode(codeNode("~.c", scopeResolver.getCurrentFrame()));
				}
			}

			var checkRetNode = noderize({
				type: WITH,
				object: codeNode(scopeResolver.getCurrentFrame()),
				body: noderize({
					type: IF,
					condition: noderize({
						type: EQ,
						0: noderize({
							type: GROUP,
							0: codeNode("rv~=f.apply(c,a)", codePtrSequence)
						}),
						1: codeNode("NJSUS")
					}),
					thenPart: noderize({
						type: SEMICOLON,
						expression: codeNode("return fh")
					})
				})
			});
			
			// add our call as a statement at the top level
			statements.push(checkRetNode);

			break;

 		  case IF:
 		  	node.condition = execute(node.condition);
			if (isYielding(node.thenPart) ||
				(node.elsePart && isYielding(node.elsePart)))
			{				
				var thenPtr = ++codePtrSequence;
				if (node.elsePart)
					var elsePtr = ++codePtrSequence;
				var endPtr = ++codePtrSequence;
				newConditional(node.condition, thenPtr, elsePtr || endPtr);
				newCodeSegment(thenPtr);
				
				// thenPart
				execBlock(node.thenPart);
				gotoCodeSegment(endPtr);

				// elsePart
				if (node.elsePart) {
					newCodeSegment(elsePtr);
					execBlock(node.elsePart);
					gotoCodeSegment(endPtr);
				}
				
				// end if
				newCodeSegment(endPtr);

				replaceNode(null);
			} else {
				// make sure we catch any breaks or continues
				node.thenPart = execute(node.thenPart);
				if (node.elsePart)
					node.elsePart = execute(node.elsePart);
			}
			break;

  		  case FOR_IN: // varDecl/iterator, object, body
			if (node.varDecl == null) {
				node.iterator = execute(node.iterator);
			} else {
				node.varDecl = execute(node.varDecl);
			}
			node.object = execute(node.object);
			
			if (!isYielding(node.body)) {
				node.body = execute(node.body);
				break;
			}
			
			// grab all items from the object and stick them in a local array
			var iterId = codePtrSequence;
			var scopeId = scopeResolver.getCurrentFrame();
			statements.push(noderize({
				type: NJS_CODE, 
				value: subst("~.iter~=njkeys(", scopeId, iterId),
				lineno: node.object.lineno
			}));
			statements.push(node.object);
			addCode(");");

			// change the FOR_IN into a regular FOR
			node.type = FOR;
			node.setup = codeNode("~.ctr~=0;", scopeId, iterId);
			node.condition = codeNode("~.ctr~<~.iter~.length",
				                      scopeId, iterId, scopeId, iterId);
			node.update = codeNode("~.ctr~++", scopeId, iterId);
			var initializer = codeNode("~.iter~[~.ctr~]",
				                       scopeId, iterId, scopeId, iterId);

			// make sure our body is a block so we can add a statement to it
			if (node.body.type != BLOCK) 
				node.body = noderize({type: BLOCK, 0: node.body, yielding: true});

			if (node.varDecl == null) {
				// iterator -- create an assignment
				node.body.unshift(noderize({
					type: SEMICOLON, 
					expression: noderize({
						type: ASSIGN,
						0: node.iterator,
						1: initializer
					})
				}));
			} else {
				// varDecl -- use the initializer
				node.varDecl[0].initializer = initializer;
				node.body.unshift(node.varDecl);
			}
			node.iterator = null;
			node.varDecl = null;
			// FALL THROUGH
			
		  case FOR:
			node.setup = execute(node.setup);
			if (!isYielding(node.body) && !isYielding(node.update))  {
				node.condition = execute(node.condition);
				node.update    = execute(node.update);
				node.body      = execute(node.body);
				break;
			}
			
			// turn it into a WHILE statement
			node.type = WHILE;
			
			// move the setup before the while
			if(node.setup.type != VAR  && node.setup.type != NJS_CODE)
				node.setup = noderize({type: SEMICOLON, expression: node.setup});

			statements.push(node.setup);
			node.setup = null;

			// make sure our body is a block so we can add a statement to it
			if (node.body.type != BLOCK)
				node.body = noderize({type: BLOCK, 0: node.body});

			node.updatePtr = ++codePtrSequence;
			node.body.push(newCodeSegmentNode(node.updatePtr));
						
			// make sure the proper update happens in the block
			node.body.push(noderize({type: SEMICOLON, expression: node.update}));
			node.update = null; 		  		

			// FALL THROUGH

 		  case WHILE:
 		  	if (isYielding(node)) {
 		  		node.continuePtr = ++codePtrSequence;
 		  		newCodeSegment(node.continuePtr);
 		  		node.condition = execute(node.condition);

 		  		var bodyPtr  = ++codePtrSequence;
 		  		node.breakPtr = ++codePtrSequence;
 		  		newConditional(node.condition, bodyPtr, node.breakPtr);
 		  		newCodeSegment(bodyPtr);
 		  		execBlock(node.body);
 		  		gotoCodeSegment(node.continuePtr);
 		  		newCodeSegment(node.breakPtr);

				replaceNode(null);
 		  	} else {
 		  		node.condition = execute(node.condition);
 		  		node.body = execute(node.body);
 		  	}
 		  	break;
 		  
 		  case DO:
 		  	if (isYielding(node)) {
 		  		node.continuePtr = ++codePtrSequence;
				node.breakPtr = ++codePtrSequence;
 		  		newCodeSegment(node.continuePtr);
 		  		execBlock(node.body);

 		  		newConditional(execute(node.condition), node.continuePtr, node.breakPtr);
 		  		newCodeSegment(node.breakPtr);

 		  		replaceNode(null);
 		  	} else {
 		  		node.condition = execute(node.condition);
 		  		node.body = execute(node.body);
 		  	}
 		    break;
		  
		  case BREAK:
			if (node.target.breakPtr != null) {
				replaceNode(codeNode("~.cp=~;break;", 
					                 scopeResolver.getCurrentFrame(),
					                 node.target.breakPtr));
			}
			break;
		  	
		  case CONTINUE:
			if (node.target.continuePtr != null) {
				replaceNode(codeNode("~.cp=~;break;", 
					                 scopeResolver.getCurrentFrame(),
					                 node.target.updatePtr || node.target.continuePtr));
			}
			break;
		  
		  case SWITCH:
			if (!isYielding(node))
				break;
			
			node.breakPtr = ++codePtrSequence;
			var conditional = null;
			if (node.defaultIndex >= 0) {
				node[node.defaultIndex].codePtr = ++codePtrSequence;
				conditional = codeNode(node[node.defaultIndex].codePtr);
			} else {
				conditional = codeNode(node.breakPtr);
			}
			
			for (var i = node.length - 1; i >= 0; i--) {
				if (i == node.defaultIndex)
					continue;
				
				// adjust the line numbering of the case label nodes
				removeLineNumbers(node[i].caseLabel);
				
				node[i].codePtr = ++codePtrSequence;
				conditional = noderize({
					type: CONDITIONAL,
					0: noderize({
						type: EQ,
						0: node.discriminant,
						1: node[i].caseLabel
					}),
					1: codeNode(node[i].codePtr),
					2: conditional
				});
			}
			
			statements.push(noderize({
				type: SEMICOLON,
				expression: noderize({
					type: ASSIGN,
					0: codeNode("~.cp", scopeResolver.getCurrentFrame()),
					1: execute(conditional)
				})
			}));
			statements.push(codeNode("break;"));
			
			for (var i = 0; i < node.length; i++) {
				newCodeSegment(node[i].codePtr);
				execBlock(node[i].statements);
			}
			
			newCodeSegment(node.breakPtr);
			
			replaceNode(null);
			break;
			
		  case WITH:
		    if (isYielding(node))
		  		throw new Error("yielding within " + Narcissus.tokens[node.type].toUpperCase() + " not supported");
			break;

		  case TRY:
		 	if (!isYielding(node))
		 		break;
		 	
		 	if (!options.exceptions)
		 		throw new Error("yielding within try/catch/finally not allowed when the exceptions are turned off in the compiler");

			//   set codeptr for catches, finally, endptr
			for (var i = 0; i < node.catchClauses.length; i++) {
				node.catchClauses[i].codePtr = ++codePtrSequence;
			}
			
			if (node.finallyBlock)
				node.finallyBlock.codePtr = ++codePtrSequence;

			var endPtr = ++codePtrSequence;
			
			// set exception codePtr
			var exCodePtr = node.catchClauses.length ?
			                node.catchClauses[0].codePtr :
			                node.finallyBlock.codePtr;
			
			addCode("~.ecp=~;", scopeResolver.getCurrentFrame(), exCodePtr);
			exPtrStack.push(exCodePtr);
			execBlock(node.tryBlock);
			node.finallyBlock ? gotoCodeSegment(node.finallyBlock.codePtr) :
			                    gotoCodeSegment(endPtr);
			exPtrStack.pop();

			for (var i = 0; i < node.catchClauses.length; i++) {
				var clause = node.catchClauses[i];
				newCodeSegment(clause.codePtr);

				if (i == 0) {
					// first catch block
					// set exception codePtr appropriately
					addCode("~.ecp=~;", scopeResolver.getCurrentFrame(),
						                node.finallyBlock ? 
						                node.finallyBlock.codePtr :
						                (exPtrStack.top() || "null"));
					// reset throwing flag to prevent infinite loopage
					addCode("~.thr=false;", scopeResolver.getCurrentFrame());
				}

				// set our exception var.  This will override any masked
				// variables with the same name.  Technically this is
				// incorrect behavior.  I should fix this, but I'm too 
				// lazy right now.
				scopeResolver.addSymbol(clause.varName)
				addCode("~ = ~.ex;", scopeResolver.getSymbol(clause.varName),
				                        scopeResolver.getCurrentFrame());

				if (clause.guard) {
					clause.guard = execute(clause.guard);
					statements.push(noderize({
						type: NJS_CODE,
						value: "if(!(",
						lineno: clause.guard.lineno
					}));
					statements.push(clause.guard);
					addCode(")) {");

					// handle missed guard clause carefully						
					if (i < node.catchClauses.length - 1) {
						gotoCodeSegment(node.catchClauses[i+1].codePtr);
					} else if (node.finallyBlock) {
						gotoCodeSegment(node.finallyBlock.codePtr);
					} else if (exPtrStack.length) {
						gotoCodeSegment(exPtrStack.top());
					} else {
						addCode("throw ~;", scopeResolver.getSymbol(clause.varName));
					}
					
					addCode("}");
				}
			
				if (node.finallyBlock)
					exPtrStack.push(node.finallyBlock.codePtr);
				execBlock(clause.block);
				if (node.finallyBlock)
					exPtrStack.pop();
				
				// handle successful execution of catch clause
				if (node.finallyBlock) {
					gotoCodeSegment(node.finallyBlock.codePtr);
				} else {
					gotoCodeSegment(endPtr);
				}
			}
			
			if (node.finallyBlock) {
				newCodeSegment(node.finallyBlock.codePtr);

				// set the exception code pointer
				addCode("~.ecp=~;", scopeResolver.getCurrentFrame(), 
								    exPtrStack.top() || "null");

				execBlock(node.finallyBlock);

				// if we're throwing, rethrow, otherwise goto endPtr
				addCode("if(~.thr){", scopeResolver.getCurrentFrame());
				if (exPtrStack.length) {
					gotoCodeSegment(exPtrStack.top());
				} else {
					addCode("~.except(~.ex);return;",
						scopeResolver.getCurrentFrame(),
						scopeResolver.getCurrentFrame());
				}
				addCode("}else{");
				gotoCodeSegment(endPtr);
				addCode("}");
			}

			newCodeSegment(endPtr);
			
			replaceNode(null);
			break;
			
		  case DEBUGGER: case LABEL: case NULL:
		  case THIS: case TRUE: case FALSE: case NUMBER:
		  case STRING: case REGEXP: case NJS_CODE:
			// nothing to do
			break;
		
		  case IDENTIFIER:
			node.value = scopeResolver.getSymbol(node.value);
		    node.initializer = execute(node.initializer);
		  	break;
			
		  case THROW:
			node.exception = execute(node.exception);
			break;
 
		  case RETURN:
		  case SEMICOLON:
			node.expression = execute(node.expression);
			break;
		  
		  case OR: case AND:
		  	// because of the "guarding" nature of boolean comparisons, we need to
		  	// pull out comparisons with right-side yields into their own
		  	// statements and transform them separately.
		  	var left = node[0];
		  	var right = node[1];
		  	
		  	node[0] = left = execute(left);
		  	if (!isYielding(right)) {
		  		node[1] = execute(right);
		  		break;
		  	}

			var condVar = "c" + conditionSequence++;
			
			// put the left in it's own assign statement
			statements.push(noderize({
				type: SEMICOLON,
				expression: noderize({
					type: ASSIGN,
					0: codeNode("var ~", condVar),
					1: left
				})
			}));
			
			// create a boolean node that indicates whether or not the left guards
			// against execution of the right
			cond = codeNode(condVar);
			if (node.type == OR) {
				cond = noderize({
					type: NOT,
					value: "!",
					0: cond
				});
			}
			
			// create an if node that checks the guarded value and executes
			// the right if appropriate
			var guard = noderize({
				type: IF,
				condition: cond,
				thenPart: noderize({
					type: SEMICOLON,
					expression: noderize({
						type: ASSIGN,
						0: codeNode(condVar),
						1: right,
						yielding: true
					}),
					yielding: true
				}),
				yielding: true
			});
			
			// execute the if node as if it were top-level
			var tmpStack = stack;
			stack = [];
			statements.push(execute(guard));
			stack = tmpStack;
			
			// finally, hand back the result of the guarding process
			node.type = NJS_CODE;
			node.value = condVar;
		  	break;
		  	
		  case VAR:
		  	if(scopeResolver.isYielding())
		  		node.scoped = true;
		  	// FALL THROUGH
		  
		  case COMMA: case ASSIGN: case CONDITIONAL:
		  case BITWISE_OR: case BITWISE_XOR: case BITWISE_AND:
		  case EQ: case NE: case STRICT_EQ: case STRICT_NE:
		  case LT: case LE: case GE: case GT:
		  case IN: case INSTANCEOF:
		  case LSH: case RSH: case URSH:
		  case PLUS: case MINUS: case MUL: case DIV: case MOD:
		  case DELETE: case VOID: case TYPEOF: 
		  case NOT: case BITWISE_NOT:
		  case UNARY_PLUS: case UNARY_MINUS: case INCREMENT: case DECREMENT:
		  case INDEX: case LIST:
		  case ARRAY_INIT: case OBJECT_INIT:
		  case GROUP: case BLOCK:
			for (var i = 0; i < node.length; i++) {
				node[i] = execute(node[i]);
			}
			break;

		  case DOT:
			// don't execute node[1] because it might resolve to a scoped var
		  	node[0] = execute(node[0]);
		  	break;

		  case PROPERTY_INIT:
			// don't execute node[0] because it might resolve to a scoped var
		  	node[1] = execute(node[1]);
		  	break;

		  default:
			throw new Error("PANIC: unknown node type " + Narcissus.tokens[node.type]);
		}
		
		return stack.pop();
	}
	
	function subst(str /*, ... */) {
		for(var i = 1; i < arguments.length; i++) {
			str = str.replace("~", arguments[i]);
		}
		return str;
	}

	function replaceNode(node) {
		stack.pop();
		stack.push(node);
	}
	
	function execBlock(set) {
		if (set.type == BLOCK) {

			for (var i = 0; i < set.length; i++) {
				statements.push(execute(set[i]));
			}
			return set;
		} else {
			set = execute(set);
			statements.push(set);
			return set;
		}
	}
	
	function newCodeSegment(id) {
		statements.push(newCodeSegmentNode(id));
	}
	
	function newCodeSegmentNode(id) {
		return codeNode("case ~:", id)
	}
	
	function gotoCodeSegment(id) {
		addCode("~.cp=~;break;",
		        scopeResolver.getCurrentFrame(),
		        id);
	}

	function newConditional(node, thenPtr, elsePtr) {
		// turn the if(cond) into something like:
		//   njf0.cp = (cond) ? 1 : 2; break; case 1:
		statements.push(noderize({
			type: NJS_CODE,
			value: subst("~.cp=(", scopeResolver.getCurrentFrame()),
			lineno: node.lineno
		}));
		statements.push(node);
		addCode(")?~:~;break;", thenPtr, elsePtr);
	}
	
	function addCode(str/*, ...*/) {
		statements.push(codeNode.apply(this, arguments));
	}
	
	function codeNode(str/*, ...*/) {
		return noderize({
			type: NJS_CODE,
			value: subst.apply(this, arguments)
		})
	}

	function isYielding(node) {
		return node != null && node.yielding;
	}
	
	function removeLineNumbers(node) {
		delete node.lineno;
		for (n in node) {
			if (node[n] != null 
			    && typeof(node[n]) == "object" 
			    && n != "parent"
			    && node[n].isNode) 
			{
				removeLineNumbers(node[n]);
			}
		}
	}
}


function NjsScopeResolver() {
	this.scopes = [];
	this.yieldingStatus = [];
}

var nsrp = NjsScopeResolver.prototype;

nsrp.push = function(n, isYielding) {
	this.scopes.push({});
	this.yieldingStatus.push(isYielding);
	if(n.varDecls) {
		for(var i = 0; i < n.varDecls.length; i++) {
			this.addSymbol(n.varDecls[i].value);
		}
	}
	if(n.funDecls) {
		for(var i = 0; i < n.funDecls.length; i++) {
			this.addSymbol(n.funDecls[i].name);
		}
	}
}
nsrp.pop = function() {
	this.yieldingStatus.pop();
	return this.scopes.pop();
}

// we need to namespace all symbols so that we don't
// accidentally run across native object members
// (such as "constructor")
nsrp.addSymbol = function(name) {
	this.scopes.top()['_' + name] = true;
	return this.getSymbol(name);
}
nsrp.getSymbol = function(name) {		
	for(var i = this.scopes.length - 1; i >= 0; i--) {
		if(this.scopes[i]['_' + name] || name == "arguments") {
			if(this.yieldingStatus[i]) {
				return "njf" + i + "._" + name;
			} else {
				return name;
			}
		}
	}
	// global identifier
	return name;
}
nsrp.getCurrentFrame = function() {
	var id = this.scopes.length - 1;
	if (id < 0) {
		throw new Error("compiler error: empty scope resolver");
	}
	return "njf" + id;
}
nsrp.isYielding = function() {
	if(this.scopes.length == 0)
		return false;
	
	return this.yieldingStatus.top();
}

nsrp.dump = function() {
	for (var i= this.scopes.length - 1; i >= 0; i--) {
		var list = "frame " + i + ": ";
		for (var n in this.scopes[i]) 
			list += n + ", ";

		print(list);
	}
}
