# /bin/sh

libtoolize --force --automake

#rm -f config.cache
#rm -f config.log
#aclocal
#autoheader
#autoconf
autoreconf -i
automake -a

./configure 
