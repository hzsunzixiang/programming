# /bin/sh


# http://www.delorie.com/gnu/docs/libtool/libtool_29.html
#`--automake'
#Work silently, and assume that Automake libtool support is used.
#`libtoolize --automake' is used by Automake to add libtool files to your package, when AC_PROG_LIBTOOL appears in your `configure.in'.

#8.3.9.1 Error: ‘required file `./ltmain.sh' not found’
#
#Libtool comes with a tool called libtoolize that will install libtool’s supporting files into a package. Running this command will install ltmain.sh. You should execute it before aclocal and automake.
#
#People upgrading old packages to newer autotools are likely to face this issue because older Automake versions used to call libtoolize. Therefore old build scripts do not call libtoolize.
#
#Since Automake 1.6, it has been decided that running libtoolize was none of Automake’s business. Instead, that functionality has been moved into the autoreconf command (see Using autoreconf in The Autoconf Manual). If you do not want to remember what to run and when, just learn the autoreconf command. Hopefully, replacing existing bootstrap or autogen.sh scripts by a call to autoreconf should also free you from any similar incompatible change in the future.
#

libtoolize --force --automake

#rm -f config.cache
#rm -f config.log
#aclocal
#autoheader
#autoconf
autoreconf -i
automake -a

./configure 
