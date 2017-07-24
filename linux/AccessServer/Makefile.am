noinst_PROGRAMS = AccessServer

AM_CXXFLAGS =

INCLUDES = -I$(top_srcdir)\
		   -I$(top_srcdir)/External/boost/include\
		   -I$(top_srcdir)/External/protobuf/include\
		   -I$(top_srcdir)/External/libxml2/include\
		   -I$(top_srcdir)/External/libevent/include

AccessServer_SOURCES =\
					  access_task.cpp\
					  access_task_manager.cpp\
					  access_intertask.cpp\
					  access_task_parser.cpp\
					  access_intertask_parser.cpp\
					  access_httpserver.cpp\
					  access_httpclient.cpp\
					  access_httpclient_parser.cpp\
					  access_config_manager.cpp\
					  access_server.cpp


AccessServer_LDFLAGS =

AccessServer_LDADD =\
					$(top_srcdir)/Framework/@FRAMEWORK@\
					$(top_srcdir)/Cmd/libCmd.la\
					$(top_srcdir)/External/clog/libclog.la\
					$(top_srcdir)/External/protobuf/lib/libprotobuf.a\
					$(top_srcdir)/External/libevent/lib/libevent.a\
					$(top_srcdir)/External/libxml2/lib/libxml2.a\
					$(top_srcdir)/External/jsoncpp/libjsoncpp.la\
					$(top_srcdir)/GameLib/utils/libUtils.la\
					$(top_srcdir)/GameLib/icpack/libicpack.la

