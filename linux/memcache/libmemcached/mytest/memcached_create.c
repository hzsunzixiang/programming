#include<config.h>
#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <signal.h>
#include <unistd.h>
#include <time.h>

#include "libmemcached/common.h"
#include "libmemcached/memcached_util.h"


int main()
{

	memcached_st *local_memc;

	local_memc = memcached_create(NULL);

	memcached_free(local_memc);

	return 0;
}



//首先包含 config.h
// gcc -Wall -g  memcached_create.c  -I.. -o memcached_create
// In file included from memcached_create.c:12:0:
// ../config.h:10:2: error: #error "You should include config.h as your first include file"
//  #error "You should include config.h as your first include file"
//   ^
// Makefile:14: recipe for target 'memcached_create' failed

