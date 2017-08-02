GMP_VER = 4.3.2
ISL_VER = 0.15
MPC_VER = 0.8.1
MPFR_VER = 2.4.2
BINUTILS_VER = 2.27
GCC_VER = 6.3.0

GNU_MIRROR = http://mirrors.ustc.edu.cn/gnu
#GNU_MIRROR = https://mirrors.tuna.tsinghua.edu.cn/gnu
SOURCEWARE_MIRROR = http://mirrors.kernel.org/sourceware

.PHONY: download install clean distclean

download:
	wget -N $(SOURCEWARE_MIRROR)/gcc/infrastructure/gmp-$(GMP_VER).tar.bz2
	wget -N $(SOURCEWARE_MIRROR)/gcc/infrastructure/isl-$(ISL_VER).tar.bz2
	wget -N $(SOURCEWARE_MIRROR)/gcc/infrastructure/mpc-$(MPC_VER).tar.gz
	wget -N $(SOURCEWARE_MIRROR)/gcc/infrastructure/mpfr-$(MPFR_VER).tar.bz2
	wget -N $(GNU_MIRROR)/binutils/binutils-$(BINUTILS_VER).tar.bz2
	wget -N $(GNU_MIRROR)/gcc/gcc-$(GCC_VER)/gcc-$(GCC_VER).tar.bz2

install:
	tar -xf gmp-$(GMP_VER).tar.bz2
	tar -xf isl-$(ISL_VER).tar.bz2
	tar -xf mpc-$(MPC_VER).tar.gz
	tar -xf mpfr-$(MPFR_VER).tar.bz2
	tar -xf binutils-$(BINUTILS_VER).tar.bz2
	tar -xf gcc-$(GCC_VER).tar.bz2
	cd gcc-$(GCC_VER) && \
		ln -s ../gmp-$(GMP_VER) gmp && \
		ln -s ../isl-$(ISL_VER) isl && \
		ln -s ../mpc-$(MPC_VER) mpc && \
		ln -s ../mpfr-$(MPFR_VER) mpfr
	-cd gcc-$(GCC_VER) && \
		for f in ../binutils-$(BINUTILS_VER)/* ; do ln -s "$$f" ; done
	mkdir build
	cd build && \
		../gcc-$(GCC_VER)/configure --prefix=$(PREFIX) \
			--enable-languages=c,c++ \
			--disable-multilib \
			--disable-nls \
			--disable-bootstrap
	$(MAKE) -C build
	$(MAKE) -C build install

clean:
	rm -rf gmp-$(GMP_VER)
	rm -rf isl-$(ISL_VER)
	rm -rf mpc-$(MPC_VER)
	rm -rf mpfr-$(MPFR_VER)
	rm -rf binutils-$(BINUTILS_VER)
	rm -rf gcc-$(GCC_VER)
	rm -rf build

distclean: clean
	rm -f gmp-$(GMP_VER).tar.bz2
	rm -f isl-$(ISL_VER).tar.bz2
	rm -f mpc-$(MPC_VER).tar.gz
	rm -f mpfr-$(MPFR_VER).tar.bz2
	rm -f binutils-$(BINUTILS_VER).tar.bz2
	rm -f gcc-$(GCC_VER).tar.bz2
