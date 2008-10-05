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
  * The Original Code is the Narcissus JavaScript engine.
  *
  * The Initial Developer of the Original Code is
  * Brendan Eich <brendan@mozilla.org>.
  * Portions created by the Initial Developer are Copyright (C) 2004
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
 
 /*
  * Narcissus - JS implemented in JS.
  *
  * Well-known constants and lookup tables.  Many consts are generated from the
  * tokens table via eval to minimize redundancy, so consumers must be compiled
  * separately to take advantage of the simple switch-case constant propagation
  * done by SpiderMonkey.
  */
 
 /*
  * njs edit:
  * - Neil: combine jsdefs.js and jsparse.js into a single file as part of an
  *   effort to reduce namespace pollution.
  * - Neil: make opTypeName order explicit for env compatibility.  The original
  *   source relied on a SpiderMonkey specific behavior where object key
  *   iteration occurs in the same order in which the keys were defined in 
  *   the object.
 Ê* - Neil: perf optimizations for OOM+ parse speedup
 Ê* - Neil: make code x-env-compatible
 Ê* - chocolateboy 2006-06-01: add support for $ in identifiers and remove support for ` as the first character as per:
 Ê* Ê http://www.mozilla.org/js/language/es4/formal/lexer-semantics.html#N-InitialIdentifierCharacter and
 Ê* Ê http://www.mozilla.org/js/language/es4/formal/lexer-semantics.html#N-ContinuingIdentifierCharacter
  */

Narcissus = {};

(function() {

	// EDIT: remove references to global to avoid namespace pollution

	 // EDIT: add yielding op
	 var tokens = [
		 // End of source.
		 "END",
	 
		 // Operators and punctuators.  Some pair-wise order matters, e.g. (+, -)
		 // and (UNARY_PLUS, UNARY_MINUS).
		 "\n", ";",
		 ",",
		 "=",
		 "?", ":", "CONDITIONAL",
		 "||",
		 "&&",
		 "|",
		 "^",
		 "&",
		 "->",
		 "==", "!=", "===", "!==",
		 "<", "<=", ">=", ">",
		 "<<", ">>", ">>>",
		 "+", "-",
		 "*", "/", "%",
		 "!", "~", "UNARY_PLUS", "UNARY_MINUS",
		 "++", "--",
		 ".",
		 "[", "]",
		 "{", "}",
		 "(", ")",
	 
		 // Nonterminal tree node type codes.
		 "SCRIPT", "BLOCK", "LABEL", "FOR_IN", "CALL", "NEW_WITH_ARGS", "INDEX",
		 "ARRAY_INIT", "OBJECT_INIT", "PROPERTY_INIT", "GETTER", "SETTER",
		 "GROUP", "LIST",
	 
		 // Terminals.
		 "IDENTIFIER", "NUMBER", "STRING", "REGEXP",
	 
		 // Keywords.
		 "break",
		 "case", "catch", "const", "continue",
		 "debugger", "default", "delete", "do",
		 "else", "enum",
		 "false", "finally", "for", "function",
		 "if", "in", "instanceof",
		 "new", "null",
		 "return",
		 "switch",
		 "this", "throw", "true", "try", "typeof",
		 "var", "void",
		 "while", "with" // EDIT: remove trailing comma (breaks IE)
	 ];
	 
	 // Operator and punctuator mapping from token to tree node type name.
	 // NB: superstring tokens (e.g., ++) must come before their substring token
	 // counterparts (+ in the example), so that the opRegExp regular expression
	 // synthesized from this list makes the longest possible match.
	// EDIT: NB comment above indicates reliance on SpiderMonkey-specific
	//       behavior in the ordering of key iteration -- see EDIT below.
	// EDIT: add yeilding op
	 var opTypeNames = {
		 '\n':   "NEWLINE",
		 ';':    "SEMICOLON",
		 ',':    "COMMA",
		 '?':    "HOOK",
		 ':':    "COLON",
		 '||':   "OR",
		 '&&':   "AND",
		 '|':    "BITWISE_OR",
		 '^':    "BITWISE_XOR",
		 '&':    "BITWISE_AND",
		 '->':   "YIELDING",
		 '===':  "STRICT_EQ",
		 '==':   "EQ",
		 '=':    "ASSIGN",
		 '!==':  "STRICT_NE",
		 '!=':   "NE",
		 '<<':   "LSH",
		 '<=':   "LE",
		 '<':    "LT",
		 '>>>':  "URSH",
		 '>>':   "RSH",
		 '>=':   "GE",
		 '>':    "GT",
		 '++':   "INCREMENT",
		 '--':   "DECREMENT",
		 '+':    "PLUS",
		 '-':    "MINUS",
		 '*':    "MUL",
		 '/':    "DIV",
		 '%':    "MOD",
		 '!':    "NOT",
		 '~':    "BITWISE_NOT",
		 '.':    "DOT",
		 '[':    "LEFT_BRACKET",
		 ']':    "RIGHT_BRACKET",
		 '{':    "LEFT_CURLY",
		 '}':    "RIGHT_CURLY",
		 '(':    "LEFT_PAREN",
		 ')':    "RIGHT_PAREN"
	 };
	
	// EDIT: created separate opTypeOrder array to indicate the order in which
	//       to evaluate opTypeNames.  (Apparently, SpiderMonkey must iterate
	//       hash keys in the order in which they are defined, an implementation
	//       detail which the original narcissus code relied on.)
	// EDIT: add yielding op
	 var opTypeOrder = [
		 '\n',
		 ';',
		 ',',
		 '?',
		 ':',
		 '||',
		 '&&',
		 '|',
		 '^',
		 '&',
		 '->',
		 '===',
		 '==',
		 '=',
		 '!==',
		 '!=',
		 '<<',
		 '<=',
		 '<',
		 '>>>',
		 '>>',
		 '>=',
		 '>',
		 '++',
		 '--',
		 '+',
		 '-',
		 '*',
		 '/',
		 '%',
		 '!',
		 '~',
		 '.',
		 '[',
		 ']',
		 '{',
		 '}',
		 '(',
		 ')'
	 ];
	 
	 // Hash of keyword identifier to tokens index.  NB: we must null __proto__ to
	 // avoid toString, etc. namespace pollution.
	 var keywords = {__proto__: null};
	 
	 // Define const END, etc., based on the token names.  Also map name to index.
	 // EDIT: use "var " prefix to make definitions local to this function
	 var consts = "var ";
	 for (var i = 0, j = tokens.length; i < j; i++) {
		 if (i > 0)
			 consts += ", ";
		 var t = tokens[i];
		 var name;
		 if (/^[a-z]/.test(t)) {
			 name = t.toUpperCase();
			 keywords[t] = i;
		 } else {
			 name = (/^\W/.test(t) ? opTypeNames[t] : t);
		 }
		 consts += name + " = " + i;
		 this[name] = i;
		 tokens[t] = i;
	 }
	 eval(consts + ";");
	 
	 // Map assignment operators to their indexes in the tokens array.
	 var assignOps = ['|', '^', '&', '<<', '>>', '>>>', '+', '-', '*', '/', '%'];
	 
	 for (i = 0, j = assignOps.length; i < j; i++) {
		 t = assignOps[i];
		 assignOps[t] = tokens[t];
	 }
	 /* vim: set sw=4 ts=8 et tw=80: */
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
	  * The Original Code is the Narcissus JavaScript engine.
	  *
	  * The Initial Developer of the Original Code is
	  * Brendan Eich <brendan@mozilla.org>.
	  * Portions created by the Initial Developer are Copyright (C) 2004
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
	 
	 /*
	  * Narcissus - JS implemented in JS.
	  *
	  * Lexical scanner and parser.
	  */
	  
	  
	 // Build a regexp that recognizes operators and punctuators (except newline).
	 var opRegExpSrc = "^(?:";
	 
	 // EDIT: change for loop from iterating through opTypeNames keys to using
	 //       opTypeOrder array so that we're not dependent on SpiderMonkey's
	 //       key order default behavior.
	 // EDIT: change regex structure for OOM perf improvement
	 for (var i = 0; i < opTypeOrder.length; i++) {
		 var op = opTypeOrder[i];
		 if (op == '\n')
			 continue;
		 if (opRegExpSrc != "^(?:")
			 opRegExpSrc += "|";
		 
		 // EDIT: expand out this regexp for environments that don't support $&
		 //opRegExpSrc += op.replace(/[?|^&(){}\[\]+\-*\/\.]/g, "\\$&");
		 op = op.replace(/\?/g, "\\?");
		 op = op.replace(/\|/g, "\\|");
		 op = op.replace(/\^/g, "\\^");
		 op = op.replace(/\&/g, "\\&");
		 op = op.replace(/\(/g, "\\(");
		 op = op.replace(/\)/g, "\\)");
		 op = op.replace(/\{/g, "\\{");
		 op = op.replace(/\}/g, "\\}");
		 op = op.replace(/\[/g, "\\[");
		 op = op.replace(/\]/g, "\\]");
		 op = op.replace(/\+/g, "\\+");
		 op = op.replace(/\-/g, "\\-");
		 op = op.replace(/\*/g, "\\*");
		 op = op.replace(/\//g, "\\/");
		 op = op.replace(/\./g, "\\.");
		 opRegExpSrc += op;
	 }
	 opRegExpSrc += ")";
	 var opRegExp = new RegExp(opRegExpSrc);
	 
	 // A regexp to match floating point literals (but not integer literals).
	 // EDIT: change regex structure for OOM perf improvement
	 var fpRegExp = /^(?:\d+\.\d*(?:[eE][-+]?\d+)?|\d+(?:\.\d*)?[eE][-+]?\d+|\.\d+(?:[eE][-+]?\d+)?)/;
	 
	 function Tokenizer(s, f, l) {
		 this.cursor = 0;
		 this.source = String(s);
		 this.tokens = [];
		 this.tokenIndex = 0;
		 this.lookahead = 0;
		 this.scanNewlines = false;
		 this.scanOperand = true;
		 this.filename = f || "";
		 this.lineno = l ? l : 1;
	 }
	  
	 Tokenizer.prototype = {
	 
	 // EDIT: change "input" from a getter to a regular method for compatibility
	 //       with older JavaScript versions
		 input: function() {
			 return this.source.substring(this.cursor);
		 },
	 
	 // EDIT: change "done" from a getter to a regular method for compatibility
	 //       with older JavaScript versions
		 done: function() {
			 return this.peek() == END;
		 },
	 
	 // EDIT: change "token" from a getter to a regular method for compatibility
	 //       with older JavaScript versions
		 token: function() {
			 return this.tokens[this.tokenIndex];
		 },
	 
		 match: function (tt) {
			 return this.get() == tt || this.unget();
		 },
	 
		 mustMatch: function (tt) {
			 if (!this.match(tt)) {
				 throw this.newSyntaxError("Missing " + tokens[tt].toLowerCase());
			 }
			 return this.token();
		 },
	 
		 peek: function () {
			 var tt;
			 if (this.lookahead) {
				 tt = this.tokens[(this.tokenIndex + this.lookahead) & 3].type;
			 } else {
				 tt = this.get();
				 this.unget();
			 }
			 return tt;
		 },
	 
		 peekOnSameLine: function () {
			 this.scanNewlines = true;
			 var tt = this.peek();
			 this.scanNewlines = false;
			 return tt;
		 },
	 
		 get: function () {
			 var token;
			 while (this.lookahead) {
				 --this.lookahead;
				 this.tokenIndex = (this.tokenIndex + 1) & 3;
				 token = this.tokens[this.tokenIndex];
				 if (token.type != NEWLINE || this.scanNewlines)
					 return token.type;
			 }
	 
			 for (;;) {
				 var input = this.input();
				 var firstChar = input.charCodeAt(0);
				 // EDIT: check first char, then use regex
				 // valid regex whitespace includes char codes: 9 10 11 12 13 32
				 if(firstChar == 32 || (firstChar >= 9 && firstChar <= 13)) {
					 var match = input.match(this.scanNewlines ? /^[ \t]+/ : /^\s+/); // EDIT: use x-browser regex syntax
					 if (match) {
						 var spaces = match[0];
						 this.cursor += spaces.length;
						 var newlines = spaces.match(/\n/g);
						 if (newlines)
							 this.lineno += newlines.length;
						 input = this.input();
					}
				 }
	 
				 // EDIT: improve perf by checking first string char before proceeding to regex,
				 //       use x-browser regex syntax
				 if (input.charCodeAt(0) != 47 || !(match = input.match(/^\/(?:\*(?:.|\n)*?\*\/|\/.*)/)))
					 break;
				 var comment = match[0];
				 this.cursor += comment.length;
				 newlines = comment.match(/\n/g);
				 if (newlines)
					 this.lineno += newlines.length
			 }
	 
			 this.tokenIndex = (this.tokenIndex + 1) & 3;
			 token = this.tokens[this.tokenIndex];
			 if (!token)
				 this.tokens[this.tokenIndex] = token = {};
	 
			 if (!input)
				 return token.type = END;
	
			 var firstChar = input.charCodeAt(0);
			 
			 // EDIT: guard by checking char codes before going to regex
			 if ((firstChar == 46 || (firstChar > 47 && firstChar < 58)) && 
				 (match = input.match(fpRegExp))) { // EDIT: use x-browser regex syntax
				 token.type = NUMBER;
				 token.value = parseFloat(match[0]);
			 } else if ((firstChar > 47 && firstChar < 58) && 
						(match = input.match(/^(?:0[xX][\da-fA-F]+|0[0-7]*|\d+)/))) { // EDIT: change regex structure for OOM perf improvement,
																					  //       use x-browser regex syntax
				 token.type = NUMBER;
				 token.value = parseInt(match[0]);
			 } else if (((firstChar > 47 && firstChar < 58)  ||   // EDIT: add guards to check before using regex
						 (firstChar > 64 && firstChar < 91)  || 
						 (firstChar > 96 && firstChar < 123) ||   // EDIT: exclude `
						 (firstChar == 36 || firstChar == 95)) && // EDIT: allow $ + mv _ here
						(match = input.match(/^[$\w]+/))) {       // EDIT: allow $, use x-browser regex syntax
				 var id = match[0];
				 // EDIT: check the type of the value in the keywords hash, as different envs
				 //       expose implicit Object properties that SpiderMonkey does not.
				 token.type = typeof(keywords[id]) == "number" ? keywords[id] : IDENTIFIER;
				 token.value = id;
			 } else if ((firstChar == 34 || firstChar == 39) && 
						(match = input.match(/^(?:"(?:\\.|[^"])*"|'(?:[^']|\\.)*')/))) { //"){  // EDIT: change regex structure for OOM perf improvement,
																								//       use x-browser regex syntax
				 token.type = STRING;
				 token.value = eval(match[0]);
			 } else if (this.scanOperand && firstChar == 47 && // EDIT: improve perf by guarding with first char check
						(match = input.match(/^\/((?:\\.|[^\/])+)\/([gi]*)/))) { // EDIT: use x-browser regex syntax
				 token.type = REGEXP;
				 token.value = new RegExp(match[1], match[2]);
			 } else if ((match = input.match(opRegExp))) { // EDIT: use x-browser regex syntax
				 var op = match[0];
				 // EDIT: IE doesn't support indexing of strings -- use charAt
				 if (assignOps[op] && input.charAt(op.length) == '=') {
					 token.type = ASSIGN;
					 token.assignOp = eval(opTypeNames[op]);
					 match[0] += '=';
				 } else {
					 token.type = eval(opTypeNames[op]);
					 if (this.scanOperand &&
						 (token.type == PLUS || token.type == MINUS)) {
						 token.type += UNARY_PLUS - PLUS;
					 }
					 token.assignOp = null;
				 }
				 token.value = op;
			 } else {
				 throw this.newSyntaxError("Illegal token");
			 }
	
			 token.start = this.cursor;
			 this.cursor += match[0].length;
			 token.end = this.cursor;
			 token.lineno = this.lineno;
			 return token.type;
		 },
	 
		 unget: function () {
			 if (++this.lookahead == 4) throw "PANIC: too much lookahead!";
			 this.tokenIndex = (this.tokenIndex - 1) & 3;
		 },
	 
		 newSyntaxError: function (m) {
			 var e = new SyntaxError(m, this.filename, this.lineno);
			 e.lineNumber = this.lineno; // EDIT: x-browser exception handling
			 e.source = this.source;
			 e.cursor = this.cursor;
			 return e;
		 }
	 };
	 
	 function CompilerContext(inFunction) {
		 this.inFunction = inFunction;
		 this.stmtStack = [];
		 this.funDecls = [];
		 this.varDecls = [];
	 }
	 
	 var CCp = CompilerContext.prototype;
	 CCp.bracketLevel = CCp.curlyLevel = CCp.parenLevel = CCp.hookLevel = 0;
	 CCp.ecmaStrictMode = CCp.inForLoopInit = false;
	 
	 function Script(t, x) {
		 var n = Statements(t, x);
		 n.type = SCRIPT;
		 n.funDecls = x.funDecls;
		 n.varDecls = x.varDecls;
		 return n;
	 }
	 
	// EDIT: change "top" method to be a regular method, rather than defined
	//       via the SpiderMonkey-specific __defineProperty__
	
	 // Node extends Array, which we extend slightly with a top-of-stack method.
	 Array.prototype.top = function() {
		return this.length && this[this.length-1];
	 }
	 
	 function Node(t, type) {
		 // EDIT: "inherit" from Array in an x-browser way.
		 var _this = [];
		 for (var n in Node.prototype)
		 	_this[n] = Node.prototype[n];

		 _this.constructor = Node;

		 var token = t.token();
		 if (token) {
			 _this.type = type || token.type;
			 _this.value = token.value;
			 _this.lineno = token.lineno;
			 _this.start = token.start;
			 _this.end = token.end;
		 } else {
			 _this.type = type;
			 _this.lineno = t.lineno;
		 }
		 _this.tokenizer = t;
	 
		 for (var i = 2; i < arguments.length; i++) 
			_this.push(arguments[i]);
		
		 return _this;
	 }
	 
	 var Np = Node.prototype; // EDIT: don't inherit from array
	 Np.toSource = Object.prototype.toSource;
	 	
	 // Always use push to add operands to an expression, to update start and end.
	 Np.push = function (kid) {
		 if (kid.start < this.start)
			 this.start = kid.start;
		 if (this.end < kid.end)
			 this.end = kid.end;
	
		 this[this.length] = kid;
	 }
	 
	 Node.indentLevel = 0;
	 
	 Np.toString = function () {
		 var a = [];
		 for (var i in this) {
			 if (this.hasOwnProperty(i) && i != 'type' && i != 'parent' && typeof(this[i]) != 'function') {
				 // EDIT,BUG: add check for 'target' to prevent infinite recursion
				 if(i != 'target')
					 a.push({id: i, value: this[i]});
				 else
					 a.push({id: i, value: "[token: " + this[i].value + "]"});
			 }
					
		 }
		 a.sort(function (a,b) { return (a.id < b.id) ? -1 : 1; });
		 INDENTATION = "    ";
		 var n = ++Node.indentLevel;
		 var t = tokens[this.type];
		 var s = "{\n" + INDENTATION.repeat(n) +
				 "type: " + (/^\W/.test(t) ? opTypeNames[t] : t.toUpperCase());
		 for (i = 0; i < a.length; i++) {
			 s += ",\n" + INDENTATION.repeat(n) + a[i].id + ": " + a[i].value;}
		 n = --Node.indentLevel;
		 s += "\n" + INDENTATION.repeat(n) + "}";
		 return s;
	 }
	 
	 Np.getSource = function () {
		 return this.tokenizer.source.slice(this.start, this.end);
	 };
	 
	// EDIT: change "filename" method to be a regular method, rather than defined
	//       via the SpiderMonkey-specific __defineGetter__
	 Np.filename = function () { return this.tokenizer.filename; };
	 
	 String.prototype.repeat = function (n) {
		 var s = "", t = this + s;
		 while (--n >= 0)
			 s += t;
		 return s;
	 }
	 
	 // Statement stack and nested statement handler.
	 function nest(t, x, node, func, end) {
		 x.stmtStack.push(node);
		 var n = func(t, x);
		 x.stmtStack.pop();
		 end && t.mustMatch(end);
		 return n;
	 }
	 
	 function Statements(t, x) {
		 var n = Node(t, BLOCK);
		 x.stmtStack.push(n);
		 while (!t.done() && t.peek() != RIGHT_CURLY) 
			 n.push(Statement(t, x));
		 x.stmtStack.pop();
		 return n;
	 }
	 
	 function Block(t, x) {
		t.mustMatch(LEFT_CURLY);
		 var n = Statements(t, x);
		 t.mustMatch(RIGHT_CURLY);
		 return n;
	 }
	 
	 var DECLARED_FORM = 0, EXPRESSED_FORM = 1, STATEMENT_FORM = 2;
	 
	 function Statement(t, x) {
		 var i, label, n, n2, ss, tt = t.get();
	 
		 // Cases for statements ending in a right curly return early, avoiding the
		 // common semicolon insertion magic after this switch.
		switch (tt) {
		   case FUNCTION:
			 return FunctionDefinition(t, x, true,
									   (x.stmtStack.length > 1)
									   ? STATEMENT_FORM
									   : DECLARED_FORM);
	 
		   case LEFT_CURLY:
			 n = Statements(t, x);
			 t.mustMatch(RIGHT_CURLY);
			 return n;
	 
		   case IF:
			 n = Node(t);
			 n.condition = ParenExpression(t, x);
			 x.stmtStack.push(n);
			 n.thenPart = Statement(t, x);
			 n.elsePart = t.match(ELSE) ? Statement(t, x) : null;
			 x.stmtStack.pop();
			 return n;
	 
		   case SWITCH:
			 n = Node(t);
			 t.mustMatch(LEFT_PAREN);
			 n.discriminant = Expression(t, x);
			 t.mustMatch(RIGHT_PAREN);
			 n.cases = [];
			 n.defaultIndex = -1;
			 x.stmtStack.push(n);
			 t.mustMatch(LEFT_CURLY);
			 while ((tt = t.get()) != RIGHT_CURLY) {
				 switch (tt) {
				   case DEFAULT:
					 if (n.defaultIndex >= 0)
						 throw t.newSyntaxError("More than one switch default");
					 // FALL THROUGH
				   case CASE:
					 n2 = Node(t);
					 if (tt == DEFAULT)
						 n.defaultIndex = n.cases.length;
					 else
						 n2.caseLabel = Expression(t, x, COLON);
					 break;
				   default:
					 throw t.newSyntaxError("Invalid switch case");
				 }
				 t.mustMatch(COLON);
				 n2.statements = Node(t, BLOCK);
				 while ((tt=t.peek()) != CASE && tt != DEFAULT && tt != RIGHT_CURLY)
					 n2.statements.push(Statement(t, x));
				 n.cases.push(n2);
			 }
			 x.stmtStack.pop();
			 return n;
	 
		   case FOR:
			 n = Node(t);
			 n.isLoop = true;
			 t.mustMatch(LEFT_PAREN);
			 if ((tt = t.peek()) != SEMICOLON) {
				 x.inForLoopInit = true;
				 if (tt == VAR || tt == CONST) {
					 t.get();
					 n2 = Variables(t, x);
				 } else {
					 n2 = Expression(t, x);
				 }
				 x.inForLoopInit = false;
			 }
			 if (n2 && t.match(IN)) {
				 n.type = FOR_IN;
				 if (n2.type == VAR) {
					 if (n2.length != 1) {
						 throw new SyntaxError("Invalid for..in left-hand side",
											   t.filename, n2.lineno);
					 }
	 
					 // NB: n2[0].type == IDENTIFIER and n2[0].value == n2[0].name.
					 n.iterator = n2[0];
					 n.varDecl = n2;
				 } else {
					 n.iterator = n2;
					 n.varDecl = null;
				 }
				 n.object = Expression(t, x);
			 } else {
				 n.setup = n2 || null;
				 t.mustMatch(SEMICOLON);
				 n.condition = (t.peek() == SEMICOLON) ? null : Expression(t, x);
				 t.mustMatch(SEMICOLON);
				 n.update = (t.peek() == RIGHT_PAREN) ? null : Expression(t, x);
			 }
			 t.mustMatch(RIGHT_PAREN);
			 n.body = nest(t, x, n, Statement);
			 return n;
	 
		   case WHILE:
			 n = Node(t);
			 n.isLoop = true;
			 n.condition = ParenExpression(t, x);
			 n.body = nest(t, x, n, Statement);
			 return n;
	 
		   case DO:
			 n = Node(t);
			 n.isLoop = true;
			 n.body = nest(t, x, n, Statement, WHILE);
			 n.condition = ParenExpression(t, x);
			 if (!x.ecmaStrictMode) {
				 // <script language="JavaScript"> (without version hints) may need
				 // automatic semicolon insertion without a newline after do-while.
				 // See http://bugzilla.mozilla.org/show_bug.cgi?id=238945.
				 t.match(SEMICOLON);
				 return n;
			 }
			 break;
	 
		   case BREAK:
		   case CONTINUE:
			 n = Node(t);
			 if (t.peekOnSameLine() == IDENTIFIER) {
				 t.get();
				 n.label = t.token().value;
			 }
			 ss = x.stmtStack;
			 i = ss.length;
			 label = n.label;
			 if (label) {
				 do {
					 if (--i < 0)
						 throw t.newSyntaxError("Label not found");
				 } while (ss[i].label != label);
			 } else {
				 do {
					 if (--i < 0) {
						 throw t.newSyntaxError("Invalid " + ((tt == BREAK)
															  ? "break"
															  : "continue"));
					 }
				 } while (!ss[i].isLoop && (tt != BREAK || ss[i].type != SWITCH));
			 }
			 n.target = ss[i];
			 break;
	 
		   case TRY:
			 n = Node(t);
			 n.tryBlock = Block(t, x);
			 n.catchClauses = [];
			 while (t.match(CATCH)) {
				 n2 = Node(t);
				 t.mustMatch(LEFT_PAREN);
				 n2.varName = t.mustMatch(IDENTIFIER).value;
				 if (t.match(IF)) {
					 if (x.ecmaStrictMode)
						 throw t.newSyntaxError("Illegal catch guard");
					 if (n.catchClauses.length && !n.catchClauses.top().guard)
						 throw t.newSyntaxError("Guarded catch after unguarded");
					 n2.guard = Expression(t, x);
				 } else {
					 n2.guard = null;
				 }
				 t.mustMatch(RIGHT_PAREN);
				 n2.block = Block(t, x);
				 n.catchClauses.push(n2);
			 }
			 if (t.match(FINALLY))
				 n.finallyBlock = Block(t, x);
			 if (!n.catchClauses.length && !n.finallyBlock)
				 throw t.newSyntaxError("Invalid try statement");
			 return n;
	 
		   case CATCH:
		   case FINALLY:
			 throw t.newSyntaxError(tokens[tt] + " without preceding try");
	 
		   case THROW:
			 n = Node(t);
			 n.exception = Expression(t, x);
			 break;
	 
		   case RETURN:
			 if (!x.inFunction)
				 throw t.newSyntaxError("Invalid return");
			 n = Node(t);
			 tt = t.peekOnSameLine();
			 // EDIT,BUG?: rather that set n.value (which already has meaning for
			 //            nodes), set n.expression
			 if (tt != END && tt != NEWLINE && tt != SEMICOLON && tt != RIGHT_CURLY)
				 n.expression = Expression(t, x);
			 break;
	 
		   case WITH:
			 n = Node(t);
			 n.object = ParenExpression(t, x);
			 n.body = nest(t, x, n, Statement);
			 return n;
	 
		   case VAR:
		   case CONST:
			 n = Variables(t, x);
			 break;
	 
		   case DEBUGGER:
			 n = Node(t);
			 break;
	 
		   case NEWLINE:
		   case SEMICOLON:
			 n = Node(t, SEMICOLON);
			 n.expression = null;
			 return n;
	 
		   default:
			 if (tt == IDENTIFIER && t.peek() == COLON) {
				 label = t.token().value;
				 ss = x.stmtStack;
				 for (i = ss.length-1; i >= 0; --i) {
					 if (ss[i].label == label)
						 throw t.newSyntaxError("Duplicate label");
				 }
				 t.get();
				 n = Node(t, LABEL);
				 n.label = label;
				 n.statement = nest(t, x, n, Statement);
				 return n;
			 }
	 
			 n = Node(t, SEMICOLON);
			 t.unget();
			 n.expression = Expression(t, x);
			 n.end = n.expression.end;
			 break;
		 }
	 
		 if (t.lineno == t.token().lineno) {
			 tt = t.peekOnSameLine();
			 if (tt != END && tt != NEWLINE && tt != SEMICOLON && tt != RIGHT_CURLY)
				 throw t.newSyntaxError("Missing ; before statement " + tokens[tt]);
		 }
		 t.match(SEMICOLON);
		 return n;
	 }
	 
	 function FunctionDefinition(t, x, requireName, functionForm) {
		 var f = Node(t);
		 if (f.type != FUNCTION)
			 f.type = (f.value == "get") ? GETTER : SETTER;
		 if (t.match(IDENTIFIER))
			 f.name = t.token().value;
		 else if (requireName)
			 throw t.newSyntaxError("Missing function identifier");
	
		 t.mustMatch(LEFT_PAREN);
		 f.params = [];
		 var tt;
		 while ((tt = t.get()) != RIGHT_PAREN) {
			 if (tt != IDENTIFIER)
				 throw t.newSyntaxError("Missing formal parameter");
			 f.params.push(t.token().value);
			 if (t.peek() != RIGHT_PAREN)
				 t.mustMatch(COMMA);
		 }
	 
		 t.mustMatch(LEFT_CURLY);
		 var x2 = new CompilerContext(true);
		 f.body = Script(t, x2);
		 t.mustMatch(RIGHT_CURLY);
		 f.end = t.token().end;
	 
		 f.functionForm = functionForm;
		 if (functionForm == DECLARED_FORM)
			 x.funDecls.push(f);
		 return f;
	 }
	 
	 function Variables(t, x) {
		 var n = Node(t);
		 do {
			 t.mustMatch(IDENTIFIER);
			 var n2 = Node(t);
			 n2.name = n2.value;
			 if (t.match(ASSIGN)) {
				 if (t.token().assignOp)
					 throw t.newSyntaxError("Invalid variable initialization");
				 n2.initializer = Expression(t, x, COMMA);
			 }
			 n2.readOnly = (n.type == CONST);
			 n.push(n2);
			 x.varDecls.push(n2);
		 } while (t.match(COMMA));
		 return n;
	 }
	 
	 function ParenExpression(t, x) {
		 t.mustMatch(LEFT_PAREN);
		 var n = Expression(t, x);
		 t.mustMatch(RIGHT_PAREN);
		 return n;
	 }
	 
	 // EDIT: add yielding op precedence
	 var opPrecedence = {
		 SEMICOLON: 0,
		 COMMA: 1,
		 ASSIGN: 2,
		 HOOK: 3, COLON: 3, CONDITIONAL: 3,
		 OR: 4,
		 AND: 5,
		 BITWISE_OR: 6,
		 BITWISE_XOR: 7,
		 BITWISE_AND: 8,
		 EQ: 9, NE: 9, STRICT_EQ: 9, STRICT_NE: 9,
		 LT: 10, LE: 10, GE: 10, GT: 10, IN: 10, INSTANCEOF: 10,
		 LSH: 11, RSH: 11, URSH: 11,
		 PLUS: 12, MINUS: 12,
		 MUL: 13, DIV: 13, MOD: 13,
		 DELETE: 14, VOID: 14, TYPEOF: 14, // PRE_INCREMENT: 14, PRE_DECREMENT: 14,
		 NOT: 14, BITWISE_NOT: 14, UNARY_PLUS: 14, UNARY_MINUS: 14,
		 INCREMENT: 15, DECREMENT: 15,     // postfix
		 NEW: 16,
		 YIELDING: 17,
		 DOT: 18
	 };
	 
	 // Map operator type code to precedence.
	 // EDIT: slurp opPrecence items into array first, because IE includes
	 //       modified hash items in iterator when modified during iteration
	 var opPrecedenceItems = [];
	 for (i in opPrecedence) 
		opPrecedenceItems.push(i);
	 
	 for (var i = 0; i < opPrecedenceItems.length; i++) {
		var item = opPrecedenceItems[i];
		opPrecedence[eval(item)] = opPrecedence[item];
	 }
	
	 var opArity = {
		 COMMA: -2,
		 ASSIGN: 2,
		 CONDITIONAL: 3,
		 OR: 2,
		 AND: 2,
		 BITWISE_OR: 2,
		 BITWISE_XOR: 2,
		 BITWISE_AND: 2,
		 EQ: 2, NE: 2, STRICT_EQ: 2, STRICT_NE: 2,
		 LT: 2, LE: 2, GE: 2, GT: 2, IN: 2, INSTANCEOF: 2,
		 LSH: 2, RSH: 2, URSH: 2,
		 PLUS: 2, MINUS: 2,
		 MUL: 2, DIV: 2, MOD: 2,
		 DELETE: 1, VOID: 1, TYPEOF: 1,  // PRE_INCREMENT: 1, PRE_DECREMENT: 1,
		 NOT: 1, BITWISE_NOT: 1, UNARY_PLUS: 1, UNARY_MINUS: 1,
		 INCREMENT: 1, DECREMENT: 1,     // postfix
		 NEW: 1, NEW_WITH_ARGS: 2, DOT: 2, INDEX: 2, CALL: 2, YIELDING: 3,
		 ARRAY_INIT: 1, OBJECT_INIT: 1, GROUP: 1
	 };
	 
	 // Map operator type code to arity.
	 // EDIT: same as above
	 var opArityItems = [];
	 for (i in opArity)
		opArityItems.push(i);
	 
	 for (var i = 0; i < opArityItems.length; i++) {
		var item = opArityItems[i];
		opArity[eval(item)] = opArity[item];
	 }
	 
	 function Expression(t, x, stop) {
		 var n, id, tt, operators = [], operands = [];
		 var bl = x.bracketLevel, cl = x.curlyLevel, pl = x.parenLevel,
			 hl = x.hookLevel;
	 
		 function reduce() {
			 var n = operators.pop();
			 var op = n.type;
			 var arity = opArity[op];
			 if (arity == -2) {
				 // Flatten left-associative trees.
				 var left = operands.length >= 2 && operands[operands.length-2];
				 if (left.type == op) {
					 var right = operands.pop();
					 left.push(right);
					 return left;
				 }
				 arity = 2;
			 }
	 
			 // Always use push to add operands to n, to update start and end.
			 // EDIT: provide second argument to splice or IE won't work.
			 var index = operands.length - arity;
			 var a = operands.splice(index, operands.length - index);
			 for (var i = 0; i < arity; i++)
				 n.push(a[i]);
	 
			 // Include closing bracket or postfix operator in [start,end).
			 if (n.end < t.token().end)
				 n.end = t.token().end;

			 operands.push(n);
			 return n;
		 }
	 
	 loop:
		 while ((tt = t.get()) != END) {
			 if (tt == stop &&
				 x.bracketLevel == bl && x.curlyLevel == cl && x.parenLevel == pl &&
				 x.hookLevel == hl) {
				 // Stop only if tt matches the optional stop parameter, and that
				 // token is not quoted by some kind of bracket.
				 break;
			 }
			 switch (tt) {
			   case SEMICOLON:
				 // NB: cannot be empty, Statement handled that.
				 break loop;
	 
			   case ASSIGN:
			   case HOOK:
			   case COLON:
				 if (t.scanOperand)
					 break loop;
				 // Use >, not >=, for right-associative ASSIGN and HOOK/COLON.
				 while (opPrecedence[operators.top().type] > opPrecedence[tt])
					 reduce();
				 if (tt == COLON) {
					 n = operators.top();
					 if (n.type != HOOK)
						 throw t.newSyntaxError("Invalid label");
					 n.type = CONDITIONAL;
					 --x.hookLevel;
				 } else {
					 operators.push(Node(t));
					 if (tt == ASSIGN)
						 operands.top().assignOp = t.token().assignOp;
					 else
						 ++x.hookLevel;      // tt == HOOK
				 }
				 t.scanOperand = true;
				 break;
	 
			   case IN:
				 // An in operator should not be parsed if we're parsing the head of
				 // a for (...) loop, unless it is in the then part of a conditional
				 // expression, or parenthesized somehow.
				 if (x.inForLoopInit && !x.hookLevel &&
					 !x.bracketLevel && !x.curlyLevel && !x.parenLevel) {
					 break loop;
				 }
				 // FALL THROUGH
			   case COMMA:
				 // Treat comma as left-associative so reduce can fold left-heavy
				 // COMMA trees into a single array.
				 // FALL THROUGH
			   case OR:
			   case AND:
			   case BITWISE_OR:
			   case BITWISE_XOR:
			   case BITWISE_AND:
			   case EQ: case NE: case STRICT_EQ: case STRICT_NE:
			   case LT: case LE: case GE: case GT:
			   case INSTANCEOF:
			   case LSH: case RSH: case URSH:
			   case PLUS: case MINUS:
			   case MUL: case DIV: case MOD:
			   case DOT:
				 if (t.scanOperand)
					 break loop;
				 while (opPrecedence[operators.top().type] >= opPrecedence[tt])
					 reduce();
				 if (tt == DOT) {
					 t.mustMatch(IDENTIFIER);
					 operands.push(Node(t, DOT, operands.pop(), Node(t)));
				 } else {
					 operators.push(Node(t));
					 t.scanOperand = true;
				 }
				 break;
	 
			   case DELETE: case VOID: case TYPEOF:
			   case NOT: case BITWISE_NOT: case UNARY_PLUS: case UNARY_MINUS:
			   case NEW:
				 if (!t.scanOperand)
					 break loop;
				 operators.push(Node(t));
				 break;
	 
			   case INCREMENT: case DECREMENT:
				 if (t.scanOperand) {
					 operators.push(Node(t));  // prefix increment or decrement
				 } else {
					 // Use >, not >=, so postfix has higher precedence than prefix.
					 while (opPrecedence[operators.top().type] > opPrecedence[tt])
						 reduce();
					 n = Node(t, tt, operands.pop());
					 n.postfix = true;
					 operands.push(n);
				 }
				 break;
	 
			   case FUNCTION:
				 if (!t.scanOperand)
					 break loop;
				 operands.push(FunctionDefinition(t, x, false, EXPRESSED_FORM));
				 t.scanOperand = false;
				 break;
	 
			   case NULL: case THIS: case TRUE: case FALSE:
			   case IDENTIFIER: case NUMBER: case STRING: case REGEXP:
				 if (!t.scanOperand)
					 break loop;
				 operands.push(Node(t));
				 t.scanOperand = false;
				 break;
	 
			   case LEFT_BRACKET:
				 if (t.scanOperand) {
					 // Array initialiser.  Parse using recursive descent, as the
					 // sub-grammar here is not an operator grammar.
					 n = Node(t, ARRAY_INIT);
					 while ((tt = t.peek()) != RIGHT_BRACKET) {
						 if (tt == COMMA) {
							 t.get();
							 n.push(null);
							 continue;
						 }
						 n.push(Expression(t, x, COMMA));
						 if (!t.match(COMMA))
							 break;
					 }
					 t.mustMatch(RIGHT_BRACKET);
					 operands.push(n);
					 t.scanOperand = false;
				 } else {
					 // Property indexing operator.
					 operators.push(Node(t, INDEX));
					 t.scanOperand = true;
					 ++x.bracketLevel;
				 }
				 break;
	 
			   case RIGHT_BRACKET:
				 if (t.scanOperand || x.bracketLevel == bl)
					 break loop;
				 while (reduce().type != INDEX)
					 continue;
				 --x.bracketLevel;
				 break;
	 
			   case LEFT_CURLY:
				 if (!t.scanOperand)
					 break loop;
				 // Object initialiser.  As for array initialisers (see above),
				 // parse using recursive descent.
				 ++x.curlyLevel;
				 n = Node(t, OBJECT_INIT);
			   object_init:
				 if (!t.match(RIGHT_CURLY)) {
					 do {
						 tt = t.get();
						 if ((t.token().value == "get" || t.token().value == "set") &&
							 t.peek() == IDENTIFIER) {
							 if (x.ecmaStrictMode)
								 throw t.newSyntaxError("Illegal property accessor");
							 n.push(FunctionDefinition(t, x, true, EXPRESSED_FORM));
						 } else {
							 switch (tt) {
							   case IDENTIFIER:
							   case NUMBER:
							   case STRING:
								 id = Node(t);
								 break;
							   case RIGHT_CURLY:
								 if (x.ecmaStrictMode)
									 throw t.newSyntaxError("Illegal trailing ,");
								 break object_init;
							   default:
								 throw t.newSyntaxError("Invalid property name");
							 }
							 t.mustMatch(COLON);
							 n.push(Node(t, PROPERTY_INIT, id,
											 Expression(t, x, COMMA)));
						 }
					 } while (t.match(COMMA));
					 t.mustMatch(RIGHT_CURLY);
				 }
				 operands.push(n);
				 t.scanOperand = false;
				 --x.curlyLevel;
				 break;
	 
			   case RIGHT_CURLY:
				 if (!t.scanOperand && x.curlyLevel != cl)
					 throw "PANIC: right curly botch";
				 break loop;
	 
			   case YIELDING:
				 while (opPrecedence[operators.top().type] > opPrecedence[YIELDING])
					 reduce();
				 t.mustMatch(LEFT_PAREN);
				 var yielding = true;
				 // FALL THROUGH
				 
			   case LEFT_PAREN:
				 if (t.scanOperand) {
					 operators.push(Node(t, GROUP));
				 } else {
					 while (opPrecedence[operators.top().type] > opPrecedence[NEW])
						 reduce();
	 
					 // Handle () now, to regularize the n-ary case for n > 0.
					 // We must set scanOperand in case there are arguments and
					 // the first one is a regexp or unary+/-.
					 n = operators.top();
					 t.scanOperand = true;
					 if (t.match(RIGHT_PAREN)) {
						 if (n.type == NEW) {
							 --operators.length;
							 n.push(operands.pop());
						 } else {
							 n = Node(t, CALL, operands.pop(),
										  Node(t, LIST));
						 }
						 operands.push(n);
						 t.scanOperand = false;
						 n.yieldOp = yielding || false;
						 break;
					 }
					 if (n.type == NEW) {
						 n.type = NEW_WITH_ARGS;
					 } else {
						 n = Node(t, CALL);
						 operators.push(n);
					 }
					 n.yieldOp = yielding || false;
				 }
				 ++x.parenLevel;
				 break;
	 
			   case RIGHT_PAREN:
				 if (t.scanOperand || x.parenLevel == pl)
					 break loop;
				 while ((tt = reduce().type) != GROUP && tt != CALL &&
						tt != NEW_WITH_ARGS) {
					 continue;
				 }
				 if (tt != GROUP) {
					 n = operands.top();
					 if (n[1].type != COMMA)
						 n[1] = Node(t, LIST, n[1]);
					 else
						 n[1].type = LIST;
				 }
				 --x.parenLevel;
				 break;
	 
			   // Automatic semicolon insertion means we may scan across a newline
			   // and into the beginning of another statement.  If so, break out of
			   // the while loop and let the t.scanOperand logic handle errors.
			   default:
				 break loop;
			 }
		 }
	 
		 if (x.hookLevel != hl)
			 throw t.newSyntaxError("Missing : after ?");
		 if (t.scanOperand)
			 throw t.newSyntaxError("Missing operand");
	 
		 // Resume default mode, scanning for operands, not operators.
		 t.scanOperand = true;
		 t.unget();
		 while (operators.length)
			 reduce();
		 return operands.pop();
	 }
	 
	 function parse(s, f, l) {
		 var t = new Tokenizer(s, f, l);
		 var x = new CompilerContext(false);
		 var n = Script(t, x);
		 if (!t.done())
			 throw t.newSyntaxError("Syntax error");
		 return n;
	 }
	 
	 // make stuff visible to NjsCompiler
	 this.parse      = parse;
	 this.Node       = Node;
	 this.tokens     = tokens;
	 this.consts     = consts;
	 
}).call(Narcissus);
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

function NjsScriptWriter() {
	this.lines = [];
	this.infix_lookup = {};
	for( var i = 0; i < this.infix_operators.length; i++ ) {
		this.infix_lookup[this.infix_operators[i]] = true;
	}
	this.prefix_lookup = {};
	for( var i = 0; i < this.prefix_operators.length; i++ ) {
		this.prefix_lookup[this.prefix_operators[i]] = true;
	}
	this.simple_lookup = {};
	for( var i = 0; i < this.simple_tokens.length; i++ ) {
		this.simple_lookup[this.simple_tokens[i]] = true;
	}
}

NjsScriptWriter.dump = function(n) {
	var o = new NjsScriptWriter();
	o.add(n);
	print(o);
}

var njsswp = NjsScriptWriter.prototype;

njsswp.infix_operators = [
	 ',',
	 '||',
	 '&&',
	 '|',
	 '^',
	 '&',
	 '===',
	 '==',
	 '!==',
	 '!=',
	 '<<',
	 '<=',
	 '<',
	 '>>>',
	 '>>',
	 '>=',
	 '>',
	 '-',
	 '+',
	 '*',
	 '/',
	 '%',
	 '.',
	 '='
];

njsswp.prefix_operators = [
	'!',
	'~',
	'unary_plus',
	'unary_minus'
];

njsswp.simple_tokens = [
	"identifier",
	"number",
	"regexp",
	"true",
	"false",
	"null",
	"this"
];

njsswp.add = function(n) {
	if( n == null ) throw new Error("null token");
	if( arguments.length > 1 ) throw new Error("too many args");
	if( Narcissus.tokens[n.type] == null ) throw new Error("not a valid token: " + n);
	var type = Narcissus.tokens[n.type].toLowerCase();
	var method = "write_" + type;
	if( this[method] ) {
		this[method](n);
	} else if( this.infix_lookup[type] ) {
		this.write_infix_operator(n);
	} else if( this.prefix_lookup[type] ) {
		this.write_prefix_operator(n);
	} else if( this.simple_lookup[type] ) {
		this.write(n, n.value);
	} else {
		throw new Error("NjsScriptWriter Error: unknown type: " + Narcissus.tokens[n.type]);
	}
}

njsswp.addBlock = function(n) {
	// the compiler can rewrite single statements into multiple statements
	// therefore, we should put brackets around single statements to be safe.
	if(n.type == Narcissus.BLOCK) {
		this.add(n);
	} else {
		this.write(n, "{");
		this.add(n);
		this.write(null, "}");
	}
}

njsswp.write = function(n, text) {
	if (text == null) 
		throw new Error("null text: " + n);
	var lineno = n && n.lineno >= this.lines.length ? n.lineno : this.lines.length - 1;
	var line = this.lines[lineno] || [];
	line.push(text);
	this.lines[lineno] = line;
}

njsswp.last = function() {
	return this.lines.top().top();
}

njsswp.pop = function() {
	return this.lines.top().pop();
}

njsswp.toString = function() {
	var output = [];
	// Note: line numbers start at 1
	for( var i = 1; i < this.lines.length; i++ ) {
		if( this.lines[i] != null ) {
			for( var j = 0; j < this.lines[i].length; j++ ) {
				output.push(this.lines[i][j]);
			}
		}
		output.push("\n");
	}
	return output.join("");
}

njsswp.write_script = function(n,output) {
	for (var i = 0; i < n.length; i++) {
		this.add(n[i]);
	}
}

njsswp.write_infix_operator = function(n) {
	this.add(n[0]);
	if (n.type == Narcissus.ASSIGN && n[0].assignOp != null)
		this.write(n, Narcissus.tokens[n[0].assignOp]);
	this.write(n, Narcissus.tokens[n.type]); // don't use n.value -- that's incorrect for DOT
	this.add(n[1]);
}

njsswp.write_prefix_operator = function(n) {
	this.write(n, n.value);
	this.add(n[0]);
}

njsswp.write_function = function(n) {
	if(n.scoped) {
		this.write(n, n.name);
		this.write(n, " = ");
	}
	this.write(n, "function");
	if(n.name && !n.scoped) {
		this.write(n, " ");
		this.write(n, n.name);
	}
	this.write(n, "(");
	this.write(n, n.params);
	this.write(null, "){");
	this.add(n.body);
	this.write(null, "}");
	if(n.scoped) {
		this.write(null, ";");
	}
}

njsswp.write_var = function(n) {
	if(!n.scoped) this.write(n, "var ");
	for( var i = 0; i < n.length; i++ ) {
		this.write(n[i], n[i].value);
		if( n[i].initializer ) {
			this.write(n[i], "=");
			this.add(n[i].initializer);
		}
		if( i == n.length - 1 ) {
			this.write(null, ";");
		} else {
			this.write(n[i], ",");
		}
	}
}

njsswp["write_;"] = function(n) {
	if(!n.expression) 
		return;
	this.add(n.expression);
	this.write(null, ";");
}


njsswp.write_conditional = function(n) {
	this.add(n[0]);
	this.write(null, "?");
	this.add(n[1]);
	this.write(null, ":");
	this.add(n[2]);
}

njsswp["write_++"] = function(n) {
	if( n.postfix ) {
		this.add(n[0]);
		this.write(n, "++");
	} else {
		this.write(n, "++");
		this.add(n[0]);
	}
}

njsswp["write_--"] = function(n) {
	if( n.postfix ) {
		this.add(n[0]);
		this.write(n, "--");
	} else {
		this.write(n, "--");
		this.add(n[0]);
	}
}

njsswp.write_index = function(n) {
	this.add(n[0]);
	this.write(null, '[');
	this.add(n[1]);
	this.write(null, ']');
}

njsswp.write_array_init = function(n) {
	this.write(n, '[');
	for( var i = 0; i < n.length; i++ ) {
		if (i > 0) {
			this.write(null, ",");
		}
		this.add(n[i]);
	}
	this.write(null, ']');
}

njsswp.write_object_init = function(n) {
	this.write(n, '{');
	for(var i = 0; i < n.length; i++) {
		this.add(n[i]);
		if( i != n.length - 1 ) {
			this.write(n[i], ',');
		}
	}
	this.write(null, '}');
}

njsswp.write_property_init = function(n) {
	this.add(n[0]);
	this.write(n[0], ':');
	this.add(n[1]);
}

njsswp.write_block = function(n) {
	this.write(n, '{');
	for( var i = 0; i < n.length; i++ ) {
		this.add(n[i]);
	}
	this.write(null, "}");
}

njsswp.write_group = function(n) {
	this.write(n, '(');
	for( var i = 0; i < n.length; i++ ) {
		this.add(n[i]);
	}
	this.write(null, ")");
}

njsswp.write_list = function(n) {
	this.write(n, '(');
	for( var i = 0; i < n.length; i++ ) {
		this.add(n[i]);
		if( i != n.length - 1 ) {
			this.write(null, ",");
		}
	}
	this.write(null, ')');
}

njsswp.write_label = function(n) {
	this.write(n, n.label);
	this.write(n, ":");
	this.add(n.statement);
}

njsswp.write_for = function(n) {
	this.write(n, "for(");
	this.add(n.setup);
	// var statements are never associated with a semicolon, so our
	// write statements automatically insert one.  Therefore, we
	// need to check if a semicolon was already inserted for us.
	if(this.last() != ';') this.write(null, ";");
	this.add(n.condition);
	this.write(null, ";");
	this.add(n.update);
	this.write(null, ")");
	this.add(n.body);
}

njsswp.write_call = function(n) {
	this.add(n[0]);
	this.add(n[1]);
}

njsswp.write_new_with_args = function(n) {
	this.write(n, "new ");
	this.add(n[0]);
	this.add(n[1]);
}

njsswp.write_new = function(n) {
	this.write(n, "new ");
	this.add(n[0]);
	this.write(null, "()");
}

njsswp.write_string = function(n) {
	var value = n.value.replace(/(\\|")/g, "\\$1");
	value = value.replace(/\n/g, "\\n");
	this.write(n, '"');
	this.write(n, value);
	this.write(n, '"');
}

njsswp.write_switch = function(n) {
	this.write(n, "switch(");
	this.add(n.discriminant);
	this.write(null, "){");
	for( var i = 0; i < n.cases.length; i++ ) {
		this.add(n.cases[i]);
	}
	this.write(null, "}");
}

njsswp.write_case = function(n) {
	this.write(n, "case ");
	this.add(n.caseLabel);
	this.write(null, ":");
	this.add(n.statements);
}

njsswp.write_default = function(n) {
	this.write(n, "default:");
	this.add(n.statements);
}

njsswp.write_delete = function(n) {
	this.write(n, "delete ");
	for( var i = 0; i < n.length; i++ ) {
		this.add(n[i]);
	}
}

njsswp.write_while = function(n) {
	this.write(n, "while(");
	this.add(n.condition);
	this.write(null, ")");
	this.add(n.body);
}

njsswp.write_do = function(n) {
	this.write(n, "do");
	this.add(n.body);
	this.write(n.condition, " while(");
	this.add(n.condition);
	this.write(null, ");");
}

njsswp.write_if = function(n) {
	this.write(n, "if(");
	this.add(n.condition);
	this.write(null, ")");
	this.addBlock(n.thenPart);
	if(n.elsePart != null ) {
		this.write(n.elsePart, " else ");
		this.add(n.elsePart);
	}
}

njsswp.write_typeof = function(n) {
	this.write(n, "typeof ");
	this.add(n[0]);
}

njsswp.write_try = function(n) {
	this.write(n, "try ");
	this.add(n.tryBlock);
	for( var i = 0; i < n.catchClauses.length; i++ ) {
		var clause = n.catchClauses[i];
		this.write(clause, " catch(");
		this.write(null, clause.varName);
		if (clause.guard) {
			this.write(null, " if(");
			this.add(clause.guard);
			this.write(null, ")");
		}
		this.write(null, ")");
		this.add(clause.block);
	}
	if( n.finallyBlock != null ) {
		this.write(n.finallyBlock, " finally ");
		this.add(n.finallyBlock);
	}
}

njsswp.write_throw = function(n) {
	this.write(n, "throw(");
	this.add(n.exception);
	this.write(n, ");");
}

njsswp.write_for_in = function(n) {
	this.write(n, "for(");
	if( n.varDecl == null ) {
		this.add(n.iterator);
	} else {
		this.add(n.varDecl);
		// variable writes automatically add a semicolon,
		// we need to remove it.
		this.pop();
	}
	this.write(null, " in ");
	this.add(n.object);
	this.write(null, ")");
	this.add(n.body);
}

njsswp.write_with = function(n) {
	this.write(n, "with(");
	this.add(n.object);
	this.write(null, ")");
	this.add(n.body);
}

njsswp.write_void = function(n) {
	this.write(n, "void ");
	this.add(n[0]);
}

njsswp.write_break = function(n) {
	this.write(n, "break;");
}

njsswp.write_continue = function(n) {
	this.write(n, "continue;");
}

njsswp.write_debugger = function(n) {
	this.write(n, "debugger;");
}

njsswp.write_return = function(n) {
	this.write(n, "return");
	if( n.expression ) { // yes, value has two possible meanings...
		this.write(null, " ");
		this.add(n.expression);
	}
	this.write(null, ";");
}

njsswp.write_instanceof = function(n) {
	this.add(n[0]);
	this.write(n, ' instanceof ');
	this.add(n[1]);
}
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




































function sleep(millis){var njf1=njen(this,arguments,"millis");nj:while(1){switch(njf1.cp){case 0:
njf1._en=new EventNotifier();
setTimeout(njf1._en,njf1._millis);njf1.pc(1,
njf1._en,"wait",[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}break nj;}}}


function fetch(url,timeout){var njf1=njen(this,arguments,"url","timeout");nj:while(1){try{switch(njf1.cp){case 0:
njf1._en=new EventNotifier();
njf1._http=NjsRuntime.createXmlHttp();

njf1._http.open("GET",njf1._url,true);
njf1._http.onreadystatechange=njf1._en;njf1.ecp=1;

njf1._http.send(null);case 3:
njf1.cp=(njf1._http.readyState!=4)?4:5;break;case 4:
njf1._startTime=new Date().getTime();njf1.pc(6,
njf1._en,"wait",[njf1._timeout]);case 6:with(njf1)if((rv6=f.apply(c,a))==NJSUS){return fh;}
njf1._timeout-=new Date().getTime()-njf1._startTime;njf1.cp=3;break;case 5:njf1.cp=2;break;case 1:njf1.ecp=null;njf1.thr=false;njf1._e = njf1.ex;


return null;njf1.cp=2;break;case 2:


return njf1._http.responseText;break nj;}}catch(ex){njf1.doex(ex)}}}
