bin_PROGRAMS = urandom 

AM_CPPFLAGS = -g -Wall -fpermissive -std=c++11 -O0 -I$(srcdir)
#-I$(top_srcdir)/common/
# 特别注意 不能使用top_srcdir变量
urandom_SOURCES = urandom.cpp
				 
#	Poker.cpp
#	by_logger.cpp

#	$(top_srcdir)/common/Poker.cpp
#	$(top_srcdir)/logger/by_logger.cpp
# 新版本会生成一个奇怪的目录?
# 新版本 加VPATH不会错 老版本会报错
#VPATH = $(top_srcdir)/common $(top_srcdir)/logger

urandom_LDFLAGS = 

urandom_LDADD =-lrt

#AUTOMAKE_OPTIONS = subdir-objects
# 或者在configure.ac中
#AM_INIT_AUTOMAKE([subdir-objects])



