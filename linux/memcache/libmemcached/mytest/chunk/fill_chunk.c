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
	memcached_return rc;

	local_memc = memcached_create(NULL);
	rc = memcached_server_add(local_memc, "127.0.0.1", 11211);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}

	uint32_t num =  memcached_server_count(local_memc);
	printf("num:%d\n", num);

	int i = 0;
	int j = 0;
	for (j = 0; j < 100; j++)
	{
		for (i = 0; i < 1024*1024+1; i=i+1024)
		{
			char key[100];
			snprintf(key, sizeof(key), "key_%d_%d", i, j);
			char *value = malloc(i);
			memset (value ,'a', i);
			rc = memcached_set(local_memc, key, strlen(key), value, strlen(value), 0, 0);
			if (rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED)
			{
				//printf("set success\n");
			}
			else
			{
				char const *retVal = memcached_strerror(NULL, rc);
				fprintf(stderr, "error memcached_set key:%s. msg:%s\n", key, retVal);
				//goto ERROR;
			}
			free(value);
		}
	}

	memcached_free(local_memc);

	printf("success \n");
	return 0;
}



//首先包含 config.h
// gcc -Wall -g  memcached_create.c  -I.. -o memcached_create
// In file included from memcached_create.c:12:0:
// ../config.h:10:2: error: #error "You should include config.h as your first include file"
//  #error "You should include config.h as your first include file"
//   ^
// Makefile:14: recipe for target 'memcached_create' failed

