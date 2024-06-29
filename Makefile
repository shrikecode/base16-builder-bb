.DEFAULT_GOAL := build
.DESTDIR ?=

build:
	rm bin/* || true
	bb uberscript bin/base16-builder-bb-raw -m base16.core/-main
	echo "#!/usr/bin/env bb" > bin/base16-builder-bb
	cat bin/base16-builder-bb-raw >> bin/base16-builder-bb
	chmod +x bin/base16-builder-bb
	rm bin/base16-builder-bb-raw

install:
	cp ./bin/base16-builder-bb ${DESTDIR}/usr/local/bin/base16-builder-bb
