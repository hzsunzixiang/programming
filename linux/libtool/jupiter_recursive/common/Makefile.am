
noinst_LIBRARIES = libjupcommon.a  # PLV product list variable (PLV),
libjupcommon_a_SOURCES = jupcommon.h print.c #   Product Source Variables
libjupcommon_a_CFLAGS = -fPIC

#*** Warning: Linking the shared library libjupiter.la against the
#*** static library ../common/libjupcommon.a is not portable!
#libtool: link: gcc -shared  -fPIC -DPIC  .libs/libjupiter_la-jup_print.o   ../common/libjupcommon.a -lpthread  -O2   -Wl,-soname -Wl,libjupiter.so.0 -o .libs/libjupiter.so.0.0.0
#/usr/bin/ld: ../common/libjupcommon.a(print.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
#/usr/bin/ld: final link failed: Nonrepresentable section on output
#collect2: error: ld returned 1 exit status

