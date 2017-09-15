chmod +x bbcp && \
cp bbcp /usr/local/bin/ || exit 1

tar xf nmon16g_x86.tar.gz
chmod +x nmon16g_x86_rhel72 && \
cp nmon16g_x86_rhel72 /usr/local/bin/ && \
rm -f /usr/local/bin/nmon && \
ln -s /usr/local/bin/nmon16g_x86_rhel72 /usr/local/bin/nmon || exit 1

mkdir megacli && \
cd megacli && \
unzip ../8-07-14_MegaCLI.zip && \
cp Linux/MegaCli-8.07.14-1.noarch.rpm ../ && \
cd .. && \
rm -rf megacli || exit 1

yum --disablerepo=sl,sl-security,epel,softwarecollections -y install \
	screen hdparm dstat sysstat procps \
	tcpdump net-tools arpwatch iproute ethtool traceroute iptstate nmap nc \
	lsof psacct strace \
	*.rpm
