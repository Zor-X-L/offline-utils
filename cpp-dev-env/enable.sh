if [ -z "$PATH" ]; then
	PATH=$PREFIX/bin
else
	PATH=$PREFIX/bin:$PATH
fi

if [ -z "$LD_LIBRARY_PATH" ]; then
	LD_LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib
else
	LD_LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib:$LD_LIBRARY_PATH
fi

if [ -z "$MANPATH" ]; then
	MANPATH=$PREFIX/share/man
else
	MANPATH=$PREFIX/share/man:$MANPATH
fi

if [ -z "$INFOPATH" ]; then
	INFOPATH=$PREFIX/share/info
else
	INFOPATH=$PREFIX/share/info:$INFOPATH
fi

if [ -z "$CPATH" ]; then
	CPATH=$PREFIX/include
else
	CPATH=$PREFIX/include:$CPATH
fi

if [ -z "$LIBRARY_PATH" ]; then
	LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib
else
	LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib:$LIBRARY_PATH
fi

export PATH LD_LIBRARY_PATH MANPATH INFOPATH CPATH LIBRARY_PATH
export PS1="(cpp-dev-env) "$PS1
