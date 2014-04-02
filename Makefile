COFFEE=coffee

JS_COMPONENTS=init
JS_EXTERNALS=bower_components/zepto/zepto.js \
             bower_components/ace-builds/src-noconflict/ace.js \
             bower_components/ace-builds/src-noconflict/mode-python.js \
             bower_components/ace-builds/src-noconflict/theme-textmate.js \
             bower_components/firebase/firebase.js \
             bower_components/firepad/dist/firepad.js
CSS_SOURCES=bower_components/pure/pure-min.css \
            bower_components/firepad/dist/firepad.css \
            style.css
#COMPRESSION_OPTIONS=--compress --mangle
COMPRESSION_OPTIONS=

all: site/index.html site/ide.js site/ide.css

bower_components: bower.json
	bower install

build/%.js: src/%.litcoffee | build
	$(COFFEE) --compile --map -o build/$(patsubst src/%,%,$(dir $<)) $<

build/source.map: $(JS_COMPONENTS:%=build/%.js)
	mapcat $(JS_COMPONENTS:%=build/%.map) -m $@ -j $(@:.map=.js)

build:
	mkdir -p build

site:
	mkdir -p site

site/index.html: index.html | site
	cp $< $@

site/ide.js: build/source.map bower_components | site
	cd site ; \
		uglifyjs $(JS_EXTERNALS:%=../%) ../build/source.js \
		--in-source-map ../build/source.map \
		--source-map-root src \
		$(COMPRESSION_OPTIONS) \
		--output ide.js \
		--source-map ide.map
	rm -rf site/src
	cp -R src site/src

site/ide.css: $(CSS_SOURCES) | site
	cat $(CSS_SOURCES) > $@

clean:
	rm -rf bower_components build site

.PHONY: all clean

