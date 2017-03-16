export PREFIX = $(HOME)/opt/cpp-dev-env

.PHONY: prepare download install clean distclean \
	download-gcc install-gcc clean-gcc distclean-gcc \
	download-gdb install-gdb clean-gdb distclean-gdb

prepare:
	mkdir -p $(PREFIX)
	echo PREFIX=$(PREFIX) > $(PREFIX)/enable.sh
	cat enable.sh >> $(PREFIX)/enable.sh
	@echo use . $(PREFIX)/enable.sh to enable cpp-dev-env

download: download-gcc download-gdb download-librdkafka

install: install-gcc install-gdb install-librdkafka

clean: clean-gcc clean-gdb clean-librdkafka

distclean: distclean-gcc distclean-gdb distclean-librdkafka

download-gcc:
	$(MAKE) -C gcc download

install-gcc:
	$(MAKE) -C gcc install

clean-gcc:
	$(MAKE) -C gcc clean

distclean-gcc:
	$(MAKE) -C gcc distclean

download-gdb:
	$(MAKE) -C gdb download

install-gdb:
	$(MAKE) -C gdb install

clean-gdb:
	$(MAKE) -C gdb clean

distclean-gdb:
	$(MAKE) -C gdb distclean

download-librdkafka:
	$(MAKE) -C librdkafka download

install-librdkafka:
	$(MAKE) -C librdkafka install

clean-librdkafka:
	$(MAKE) -C librdkafka clean

distclean-librdkafka:
	$(MAKE) -C librdkafka distclean

