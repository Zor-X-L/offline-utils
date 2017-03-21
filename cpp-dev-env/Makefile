export PREFIX = $(HOME)/opt/cpp-dev-env

.PHONY: prepare download install clean distclean \
	download-% install-% clean-% distclean-%

prepare:
	mkdir -p $(PREFIX)
	rm -f $(PREFIX)/enable.sh
	echo scl enable devtoolset-6 \'bash $(PREFIX)/_enable.sh\' > $(PREFIX)/enable.sh
	chmod +x $(PREFIX)/enable.sh
	rm -f $(PREFIX)/_enable.sh
	echo PREFIX=$(PREFIX) > $(PREFIX)/_enable.sh
	cat _enable.sh >> $(PREFIX)/_enable.sh
	@echo use . $(PREFIX)/enable.sh to enable cpp-dev-env

download: download-librdkafka download-poco

install: install-librdkafka install-poco

clean: clean-librdkafka clean-poco

distclean: distclean-librdkafka distclean-poco

download-%:
	$(MAKE) -C $(lastword $(subst -, ,$@)) download

install-%:
	$(MAKE) -C $(lastword $(subst -, ,$@)) install

clean-%:
	$(MAKE) -C $(lastword $(subst -, ,$@)) clean

distclean-%:
	$(MAKE) -C $(lastword $(subst -, ,$@)) distclean

