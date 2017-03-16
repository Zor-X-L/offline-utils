VER = 0.9.4

.PHONY: download install clean distclean

download:
	wget -N https://github.com/edenhill/librdkafka/archive/v$(VER).tar.gz

install:
	tar -xf v$(VER).tar.gz
	cd librdkafka-$(VER) && \
		./configure --prefix=$(PREFIX) --libdir=$(PREFIX)/lib64 --enable-static
	$(MAKE) -C librdkafka-$(VER)
	$(MAKE) -C librdkafka-$(VER) install

clean:
	rm -rf librdkafka-$(VER)

distclean: clean
	rm -f v$(VER).tar.xz
