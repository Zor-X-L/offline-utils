GMP_VER=4.3.2
ISL_VER=0.15
MPC_VER=0.8.1
MPFR_VER=2.4.2
BINUTILS_VER=2.27
GCC_VER=6.3.0
GDB_VER=7.12.1

GNU_MIRROR=http://mirrors.ustc.edu.cn/gnu
#GNU_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/gnu
SOURCEWARE_MIRROR=http://mirrors.kernel.org/sourceware

wget -N $SOURCEWARE_MIRROR/gcc/infrastructure/gmp-$GMP_VER.tar.bz2 || exit 1
wget -N $SOURCEWARE_MIRROR/gcc/infrastructure/isl-$ISL_VER.tar.bz2 || exit 1
wget -N $SOURCEWARE_MIRROR/gcc/infrastructure/mpc-$MPC_VER.tar.gz || exit 1
wget -N $SOURCEWARE_MIRROR/gcc/infrastructure/mpfr-$MPFR_VER.tar.bz2 || exit 1
wget -N $GNU_MIRROR/binutils/binutils-$BINUTILS_VER.tar.bz2 || exit 1
wget -N $GNU_MIRROR/gcc/gcc-$GCC_VER/gcc-$GCC_VER.tar.bz2 || exit 1
wget -N $GNU_MIRROR/gdb/gdb-$GDB_VER.tar.xz || exit 1

rm -rf gmp-$GMP_VER isl-$ISL_VER mpc-$MPC_VER mpfr-$MPFR_VER \
	binutils-$BINUTILS_VER gcc-$GCC_VER gdb-$GDB_VER || exit 1

tar -xf gmp-$GMP_VER.tar.bz2 || exit 1
tar -xf isl-$ISL_VER.tar.bz2 || exit 1
tar -xf mpc-$MPC_VER.tar.gz || exit 1
tar -xf mpfr-$MPFR_VER.tar.bz2 || exit 1
tar -xf binutils-$BINUTILS_VER.tar.bz2 || exit 1
tar -xf gcc-$GCC_VER.tar.bz2 || exit 1
tar -xf gdb-$GDB_VER.tar.xz || exit 1

cd gcc-$GCC_VER
ln -s ../gmp-$GMP_VER gmp
ln -s ../isl-$ISL_VER isl
ln -s ../mpc-$MPC_VER mpc
ln -s ../mpfr-$MPFR_VER mpfr
for f in ../binutils-$BINUTILS_VER/* ; do ln -s "$f" ; done

./configure --prefix=/opt/gcc-$GCC_VER \
	--enable-languages=c,c++ \
	--disable-multilib \
	--disable-nls \
	--disable-bootstrap

make

