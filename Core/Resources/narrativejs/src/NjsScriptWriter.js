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
