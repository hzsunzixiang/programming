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

	unsigned int set= 1;
	memcached_behavior_set(local_memc, MEMCACHED_DISTRIBUTION_MODULA, set);

	rc = memcached_server_add(local_memc, "127.0.0.1", 11211);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}

	rc = memcached_server_add(local_memc, "127.0.0.1", 11212);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}

	rc = memcached_server_add(local_memc, "127.0.0.1", 11213);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}

	rc = memcached_server_add(local_memc, "127.0.0.1", 11214);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}
	rc = memcached_server_add(local_memc, "127.0.0.1", 11215);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}
	uint32_t num =  memcached_server_count(local_memc);
	printf("num:%d\n", num);

	rc= memcached_flush(local_memc, 0);
	if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
	{
		fprintf(stderr, "memcached_flush:%d rc:%d\n", MEMCACHED_SUCCESS, rc);
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "error memcached_flush:%s rc:%d\n", retVal, rc);
		goto ERROR;
	}





	int i = 0;
	for(i = 0; i < 100000; i++)
	{
		char key[64];
		char value[64];
		snprintf(key, sizeof(key), "tkey_%05d", i);
		snprintf(value, sizeof(value), "tvalue_%05d", i);
		rc= memcached_set(local_memc, key, strlen(key), value, strlen(value), (time_t)0, (uint32_t)0);
		if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
		{
			char const *retVal = memcached_strerror(NULL, rc);
			fprintf(stderr, "error memcached_set .%s\n", retVal);
			goto ERROR;
		}

	}
	memcached_free(local_memc);

	printf("success \n");
	return 0;
ERROR:
	printf("error \n");
	return 1;

}

