sudo yum install rpm-build nasm xorg-x11-server-devel xrdp-devel libXfont-devel libXfont2-devel
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
rpmbuild --undefine=_disable_source_fetch -ba xorgxrdp.spec
cp ~/rpmbuild/RPMS/x86_64/xorgxrdp-*.rpm .
