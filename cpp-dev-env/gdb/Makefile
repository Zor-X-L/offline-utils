GDB_VER = 7.12.1

GNU_MIRROR = http://mirrors.ustc.edu.cn/gnu
#GNU_MIRROR = https://mirrors.tuna.tsinghua.edu.cn/gnu

.PHONY: download install clean distclean

download:
	wget -N $(GNU_MIRROR)/gdb/gdb-$(GDB_VER).tar.xz

install:
	tar -xf gdb-$(GDB_VER).tar.xz
	cd gdb-$(GDB_VER) && \
		./configure --prefix=$(PREFIX) --disable-nls
	$(MAKE) -C gdb-$(GDB_VER)
	$(MAKE) -C gdb-$(GDB_VER) install

clean:
	rm -rf gdb-$(GDB_VER)

distclean: clean
	rm -f gdb-$(GDB_VER).tar.xz
