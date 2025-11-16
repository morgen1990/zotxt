.PHONY: clean test unittest dist

VERSION=$(shell jq .version manifest.json -r)

dist: test zotxt-$(VERSION).xpi ;

notest: zotxt-$(VERSION).xpi ;

zotxt-$(VERSION).xpi: manifest.json background.js resource/translators/EasyKeyExporter.js 
	zip -r zotxt-$(VERSION).xpi manifest.json background.js resource/

clean:
	rm -f zotxt-*.xpi

unittest:
	npm test

test: unittest
	cd test && ruby test.rb
