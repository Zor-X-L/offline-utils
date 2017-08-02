CATCH_VER = 1.8.2
FAKEIT_VER = 2.0.3
SPDLOG_VER = 0.12.0

.PHONY: download clean distclean

download:
	wget -c https://github.com/philsquared/Catch/archive/v$(CATCH_VER).tar.gz \
		-O Catch-$(CATCH_VER).tar.gz
	wget -c https://github.com/eranpeer/FakeIt/archive/$(FAKEIT_VER).tar.gz \
		-O FakeIt-$(FAKEIT_VER).tar.gz
	wget -c https://github.com/gabime/spdlog/archive/v$(SPDLOG_VER).tar.gz \
		-O spdlog-$(SPDLOG_VER).tar.gz

clean:
	rm -rf Catch-$(CATCH_VER)
	rm -rf FakeIt-$(FAKEIT_VER)
	rm -rf spdlog-$(SPDLOG_VER)

distclean:
	rm -f Catch-$(CATCH_VER).tar.gz
	rm -f FakeIt-$(FAKEIT_VER).tar.gz
	rm -f spdlog-$(SPDLOG_VER).tar.gz
