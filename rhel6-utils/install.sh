chmod +x bbcp && \
cp bbcp /usr/local/bin/ || exit 1

chmod +x nmon16e_x86_rhel65 && \
cp nmon16e_x86_rhel65 /usr/local/bin/ && \
ln -s /usr/local/bin/nmon /usr/local/bin/nmon16e_x86_rhel65 || exit 1

mkdir megacli && \
cd megacli && \
unzip ../8-07-14_MegaCLI.zip && \
cp Linux/MegaCli-8.07.14-1.noarch.rpm ../ && \
cd .. && \
rm -rf megacli || exit 1

yum -y install \
	screen hdparm dstat sysstat procps \
	tcpdump net-tools arpwatch iproute ethtool traceroute iptstate nmap nc \
	lsof psacct strace \
	./*.rpm
