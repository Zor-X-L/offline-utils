# rh-git29-git-all \
# devtoolset-6-gcc-c++ devtoolset-6-gdb \
./repoquery-recursive.py \
	pssh clusterssh htop iftop iperf3 fio inxi lshw ansible \
	python2-pip python2-paramiko python-ipython-console \
	python34 python34-setuptools python34-pip python34-paramiko python34-pg8000 \
	tmux collectl glances atop statgrab-tools sysbench bonnie++ \
	iptraf-ng nethogs vnstat jnettop ngrep nload \
	| wget -Ni - || exit 1

rm -f *i686.rpm

wget -N 'http://www.slac.stanford.edu/~abh/bbcp/bin/amd64_rhel60/bbcp' || exit 1

#wget -N 'https://downloads.sourceforge.net/project/nmon/nmon16e_x86_rhel65'||exit 1
wget -N 'https://downloads.sourceforge.net/project/nmon/nmon16g_x86.tar.gz'||exit 1

#wget -N 'https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/8-07-14_MegaCLI.zip' || exit 1
