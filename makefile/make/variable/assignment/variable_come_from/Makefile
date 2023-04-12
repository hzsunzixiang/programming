# make CFLAGS=-g CPPFLAGS='-DBSD -DDEBUG'
# override LDFLAGS = -EB
# --environment-overrides (or -e)
#
#
#
TEST_CFLAGS = -g -x
TEST_CPPFLAGS='-DBSD -DDEBUG'
override TEST_LDFLAGS = -EB

all:
	@echo $(TEST_CFLAGS)
	@echo $(TEST_CPPFLAGS)
	@echo $(TEST_LDFLAGS)




#make TEST_CFLAGS=-g TEST_CPPFLAGS='-DCentos -DDEBUG' TEST_LDFLAGS=-TESTEB
#make -e TEST_CFLAGS=-g TEST_CPPFLAGS='-DCentos -DDEBUG' TEST_LDFLAGS=-TESTEB
# -g
# -DCentos -DDEBUG
# -EB

#make -e TEST_CFLAGS=-g TEST_CPPFLAGS='-DCentos -DDEBUG' TEST_LDFLAGS=-TESTEB
#export TEST_CPPFLAGS='-DDebian -DDEBUG'; make -e TEST_CFLAGS=-g  TEST_CPPFLAGS='-DCentos -DDEBUG' TEST_LDFLAGS=-TESTEB
#export TEST_CPPFLAGS='-DDebian -DDEBUG'; make -e TEST_CFLAGS=-g  TEST_LDFLAGS=-TESTEB



#ericksun@centos7-mq1:~/programming/makefile/make/variable/assignment/variable_come_from (master)$ export TEST_CPPFLAGS='-DDebian -DDEBUG'; make -e TEST_CFLAGS=-g  TEST_LDFLAGS=-TESTEB
#-g
#-DDebian -DDEBUG
#-EB
#ericksun@centos7-mq1:~/programming/makefile/make/variable/assignment/variable_come_from (master)$ export TEST_CPPFLAGS='-DDebian -DDEBUG'; make -e TEST_CFLAGS=-g  TEST_CPPFLAGS='-DCentos -DDEBUG' TEST_LDFLAGS=-TESTEB
#-g
#-DCentos -DDEBUG
#-EB

