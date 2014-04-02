COFFEE=coffee

JS_COMPONENTS=build/hello.js build/goodbye.js
JS_EXTERNALS=bower_components/zepto/zepto.min.js
CSS_SOURCES=bower_components/pure/pure-min.css style.css

all: site/index.html site/ide.js site/ide.css

bower_components: bower.json
	bower install

build/%.js: src/%.litcoffee | build
	$(COFFEE) --compile --map -o build $<

build:
	mkdir -p build

site:
	mkdir -p site

site/index.html: index.html | site
	cp $< $@

site/ide.js: $(JS_COMPONENTS) bower_components | site
	cat $(JS_EXTERNALS) $(JS_COMPONENTS) > $@
	cp $(JS_COMPONENTS:.js=.map) site/
	rm -rf site/src
	cp -R src site/src

site/ide.css: $(CSS_SOURCES) | site
	cat $(CSS_SOURCES) > $@

clean:
	rm -rf bower_components build site

.PHONY: all clean

