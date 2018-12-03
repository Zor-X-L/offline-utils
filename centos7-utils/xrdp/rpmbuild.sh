# xrdp-selinux and xorgxrdp depends on newest CentOS point release
# we have to build them from source for older releases

rm -rf ~/rpmbuild && \
	   mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} && \
	   git clone https://src.fedoraproject.org/rpms/xrdp.git && \
	   cd xrdp && \
	   sudo yum-builddep xrdp.spec && \
	   cp * ~/rpmbuild/SOURCES/ && \
	   rpmbuild --undefine=_disable_source_fetch -bb ~/rpmbuild/SOURCES/xrdp.spec && \
	   rm -rf ~/rpmbuild/SOURCES/* && \
	   cd .. && \
	   cp ~/rpmbuild/RPMS/x86_64/xrdp-*.rpm . && \
	   git clone https://src.fedoraproject.org/rpms/xorgxrdp.git && \
	   cd xorgxrdp && \
	   sudo yum-builddep xorgxrdp.spec && \
	   cp * ~/rpmbuild/SOURCES/ && \
	   rpmbuild --undefine=_disable_source_fetch -bb ~/rpmbuild/SOURCES/xorgxrdp.spec && \
	   rm -rf ~/rpmbuild/SOURCES/* && \
	   cd .. && \
	   cp ~/rpmbuild/RPMS/x86_64/xorgxrdp-*.rpm .
