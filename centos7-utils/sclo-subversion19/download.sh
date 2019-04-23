../repoquery-recursive.py \
	sclo-subversion19 sclo-subversion19-subversion-tools \
	| wget -Ni - || exit 1

rm -f *i686.rpm
