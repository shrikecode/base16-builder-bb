.DEFAULT_GOAL := build
.DESTDIR ?=

build:
	rm bin/* || true
	cp ./native-image.properties ./vendor/babashka/resources/META-INF/native-image/babashka/babashka/native-image.properties
	bb native-image
	cd vendor/babashka && git add resources/META-INF/native-image/babashka/babashka/native-image.properties && git reset --hard HEAD

install:
	cp ./bin/base16-builder-bb ${DESTDIR}/usr/local/bin/base16-builder-bb
