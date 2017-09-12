noinst_PROGRAMS = StateServer

AM_CXXFLAGS =

INCLUDES = -I$(top_srcdir)\
		   -I$(top_srcdir)/External/boost/include\
		   -I$(top_srcdir)/External/protobuf/include\
		   -I$(top_srcdir)/External/libxml2/include\
		   -I$(top_srcdir)/External/libevent/include\
		   -I$(top_srcdir)/External/libmemcached/include

StateServer_SOURCES =\
					  state_httptask.cpp\
					  state_httptask_parser.cpp\
					  state_user_msgparser.cpp\
					  state_config_manager.cpp\
					  state_shared_parser.cpp\
					  state_forward_msgparser.cpp\
					  state_server.cpp


StateServer_LDFLAGS =

StateServer_LDADD =\
				   $(top_srcdir)/Framework/@FRAMEWORK@\
				   $(top_srcdir)/GameLib/utils/libUtils.la\
				   $(top_srcdir)/GameLib/access-cli/libAccessCli.la\
				   $(top_srcdir)/Cmd/libCmd.la\
				   $(top_srcdir)/External/clog/libclog.la\
				   $(top_srcdir)/External/hiredis/libhiredis.la\
				   $(top_srcdir)/External/protobuf/lib/libprotobuf.a\
				   $(top_srcdir)/External/libevent/lib/libevent.a\
				   $(top_srcdir)/GameLib/notify-cli/libNotifyCli.la\
				   $(top_srcdir)/GameLib/memcached/libMemcachedClient.la\
				   $(top_srcdir)/External/libxml2/lib/libxml2.a\
				   $(top_srcdir)/External/libmemcached/lib/libmemcached.a\
					$(top_srcdir)/GameLib/icpack/libicpack.la
