./repoquery-recursive.py \
	tmux python-ipython-console python34 pssh clusterssh \
	inxi lshw \
	sysbench bonnie++ fio iperf3 \
	collectl glances atop statgrab-tools \
	htop iotop \
	iptraf-ng nethogs iftop vnstat jnettop ngrep nload \
	rh-git29-git-all \
	| wget -Ni - || exit 1

rm -f *i686*.rpm

wget -N 'http://www.slac.stanford.edu/~abh/bbcp/bin/amd64_rhel60/bbcp' || exit 1

wget -N 'https://downloads.sourceforge.net/project/nmon/nmon16e_x86_rhel65'||exit 1

wget -N 'https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/8-07-14_MegaCLI.zip' || exit 1
