COMPILER_SRC=$(addprefix src/, Narcissus.js NjsCompiler.js NjsScriptWriter.js)
RUNTIME_SRC=src/NjsRuntime.js src/helpers.js
PACKAGE=com/neilmix/narrativejs
JAVA_SRC=$(shell find src/com -name "*.java")
JAVA_CLASSES=$(addsuffix .class, $(basename $(JAVA_SRC)))
NJS_JAR=lib/narrativejs.jar
JS_SHELL=java -cp ../lib/js.jar org.mozilla.javascript.tools.shell.Main

default: $(NJS_JAR) deploy

deploy: deploy/njs_runtime.js deploy/njs_compile.js

deploy/njs_compile.js: $(RUNTIME_SRC) $(COMPILER_SRC)
	mkdir -p deploy
	cat $(COMPILER_SRC) $(RUNTIME_SRC) > deploy/njs_compile.js

deploy/njs_runtime.js: $(RUNTIME_SRC)
	mkdir -p deploy
	cat $(RUNTIME_SRC) > deploy/njs_runtime.js

src/helpers.js: src/helpers.njs
	java -classpath lib/js.jar:lib/narrativejs.jar com.neilmix.narrativejs.CompilerMain $<

$(NJS_JAR): $(JS_SRC) $(JAVA_CLASSES)
	cat $(COMPILER_SRC) src/compiler_main.js > lib/build/$(PACKAGE)/Compiler.js
	jar cf lib/narrativejs.jar -C lib/build com

%.class: %.java lib/js.jar
	mkdir -p lib/build/$(PACKAGE);
	javac -classpath lib/js.jar -d lib/build $<

.PHONY: test

test: test_compiler test_runtime

test_compiler:
	cd test && $(JS_SHELL) test_compiler.js

test_runtime:
	cd test && $(JS_SHELL) test_runtime.js

clean:
	rm -fr deploy
	rm -fr $(NJS_JAR)
	rm -fr lib/build
	rm -fr src/helpers.js
