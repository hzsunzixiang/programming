# _LTLIBRARIES 是 Automake 支持 Libtool 的原语
lib_LTLIBRARIES = libcompress.la 
libcompress_la_SOURCES = compress.c 
# 可以通过 _LDFLAGS 传递选项给 Libtool 
libcompress_la_LDFLAGS = 
# 通过 _LIBADD 可以指定库依赖关系
libcompress_la_LIBADD  = -lz

bin_PROGRAMS = main 
main_SOURCES = main.c 
main_LDFLAGS = 
main_LDADD   = libcompress.la
