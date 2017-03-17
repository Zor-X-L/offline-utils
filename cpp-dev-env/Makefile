export PREFIX = $(HOME)/opt/cpp-dev-env

.PHONY: prepare download install clean distclean \
	download-librdkafka install-librdkafka clean-librdkafka distclean-librdkafka

prepare:
	mkdir -p $(PREFIX)
	rm -f $(PREFIX)/enable.sh
	echo scl enable devtoolset-6 \'bash $(PREFIX)/_enable.sh\' > $(PREFIX)/enable.sh
	chmod +x $(PREFIX)/enable.sh
	rm -f $(PREFIX)/_enable.sh
	echo PREFIX=$(PREFIX) > $(PREFIX)/_enable.sh
	cat _enable.sh >> $(PREFIX)/_enable.sh
	@echo use . $(PREFIX)/enable.sh to enable cpp-dev-env

download: download-librdkafka

install: install-librdkafka

clean: clean-librdkafka

distclean: distclean-librdkafka

download-librdkafka:
	$(MAKE) -C librdkafka download

install-librdkafka:
	$(MAKE) -C librdkafka install

clean-librdkafka:
	$(MAKE) -C librdkafka clean

distclean-librdkafka:
	$(MAKE) -C librdkafka distclean

