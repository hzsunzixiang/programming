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

	//rc = memcached_server_add(local_memc, "localhost", 11211);
	//if(rc != MEMCACHED_SUCCESS)
	//{
	//	fprintf(stderr, "memcached_server_add error.");
	//}

	uint32_t num =  memcached_server_count(local_memc);
	printf("num:%d\n", num);

	const char *key= "fun";
	size_t key_length= strlen(key);
	const char *value= "we the people";
	const char* keys[2] = { key, NULL };
	size_t keylengths[2] = { strlen(key), 0 };
	size_t value_length = strlen(value);
	const char *value2= "change the value";
	size_t value2_length= strlen(value2);

	memcached_result_st results_obj;
	memcached_result_st *results;
	unsigned int set= 1;

	rc= memcached_flush(local_memc, 0);
	if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
	{
		fprintf(stderr, "memcached_flush:%d rc:%d\n", MEMCACHED_SUCCESS, rc);
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "error memcached_flush:%s rc:%d\n", retVal, rc);
		goto ERROR;
	}


	memcached_behavior_set(local_memc, MEMCACHED_BEHAVIOR_SUPPORT_CAS, set);

	rc= memcached_set(local_memc, key, strlen(key),
			value, strlen(value),
			(time_t)0, (uint32_t)0);
	if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
	{
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "error memcached_set .%s\n", retVal);
		goto ERROR;
	}

	// 必须调用这个函数才能往下走
	rc= memcached_mget(local_memc, keys, keylengths, 1);

	results= memcached_result_create(local_memc, &results_obj);

	results= memcached_fetch_result(local_memc, &results_obj, &rc);
	if (!results || rc != MEMCACHED_SUCCESS || !(results->item_cas))
	{
		printf("error, memcached_fetch_result\n");
		goto ERROR;
	}

	uint64_t cas = memcached_result_cas(results);
	if(cas == 0) 
	{
		printf("error, memcached_result_cas\n");
		goto ERROR;
	}

	printf("cas:%lu\n", cas);
	memcached_result_free(&results_obj);

	sleep(20);
	// 此时在另一个客户端修改 key的 值 此时 这里会失败
	//error memcached_cas:CONNECTION DATA EXISTS

  	rc= memcached_cas(local_memc, key, key_length, value2, value2_length, 0, 0, cas);
	if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
	{
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "error memcached_cas:%s\n", retVal);
		goto ERROR;
	}
	else
	{
		printf("success, memcached_cas\n");
	}

	///*
	// * The item will have a new cas value, so try to set it again with the old
	// * value. This should fail!
	// */
	//rc= memcached_cas(local_memc, key, key_length, value2, value2_length, 0, 0, cas);
	//if (!(rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED))
	//{
	//	char const *retVal = memcached_strerror(NULL, rc);
	//	fprintf(stderr, "error memcached_cas:%s\n", retVal);
	//	//goto ERROR;
	//}
	//else
	//{
	//	printf("success, memcached_cas\n");
	//}



	uint32_t flags = 0;
	char *val = memcached_get(local_memc, key, strlen(key), &value_length, &flags, &rc);
	if(val !=NULL)
	{
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "success .%s\n", retVal);
		fprintf(stderr, "value.%s\n", val);

	}
	else
	{
		char const *retVal = memcached_strerror(NULL, rc);
		fprintf(stderr, "error.%s\n", retVal);
	}



	memcached_free(local_memc);

	printf("success \n");
	return 0;
ERROR:
	printf("error \n");
	return 1;

}

