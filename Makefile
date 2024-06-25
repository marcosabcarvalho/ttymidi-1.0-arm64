all:
	gcc src/ttymidi.c -o ttymidi -lasound

clean:
	rm -f ttymidi

install:
	install -m 0755 ttymidi /usr/local/bin

uninstall:
	rm -f /usr/local/bin/ttymidi

package: all
	mkdir -p ttymidi-1.0-arm64/DEBIAN
	mkdir -p ttymidi-1.0-arm64/usr/local/bin
	echo "Package: ttymidi" > ttymidi-1.0-arm64/DEBIAN/control
	echo "Version: 1.0" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Section: sound" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Priority: optional" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Architecture: arm64" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Depends: libasound2 (>= 1.0.16), libasound2-dev (>= 1.0.16)" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Maintainer: Marcos Antonio <marcosabcarvalho@gmail.com>" >> ttymidi-1.0-arm64/DEBIAN/control
	echo "Description: ttyMIDI allows external serial devices to interface with the ALSA sequencer." >> ttymidi-1.0-arm64/DEBIAN/control
	cp ttymidi ttymidi-1.0-arm64/usr/local/bin/
	dpkg-deb --build ttymidi-1.0-arm64

