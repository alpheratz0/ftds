VERSION = 1.0.1

CC      = cc
INCS    = -I/usr/include/freetype2
CFLAGS  = -std=c99 -pedantic -Wall -Wextra -Os ${INCS} -DVERSION=\"${VERSION}\"
LDLIBS  = -lxcb -lfreetype -lxcb-image -lfontconfig
LDFLAGS = -s ${LDLIBS}

PREFIX    = /usr/local
MANPREFIX = ${PREFIX}/share/man

all: fontdisplay

.c.o:
	${CC} -c ${CFLAGS} $<

fontdisplay: fontdisplay.o
	${CC} -o $@ $< ${LDFLAGS}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f fontdisplay ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/fontdisplay
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp -f fontdisplay.1 ${DESTDIR}${MANPREFIX}/man1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/fontdisplay.1

dist: clean
	mkdir -p fontdisplay-${VERSION}
	cp -R LICENSE Makefile README fontdisplay.1 fontdisplay.c fontdisplay-${VERSION}
	tar -cf fontdisplay-${VERSION}.tar fontdisplay-${VERSION}
	gzip fontdisplay-${VERSION}.tar
	rm -rf fontdisplay-${VERSION}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/fontdisplay
	rm -f ${DESTDIR}${MANPREFIX}/man1/fontdisplay.1

clean:
	rm -f fontdisplay fontdisplay.o fontdisplay-${VERSION}.tar.gz

.PHONY: all clean install uninstall dist
