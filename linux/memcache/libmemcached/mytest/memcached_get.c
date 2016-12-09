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

	rc = memcached_server_add(local_memc, "localhost", 11211);
	if(rc != MEMCACHED_SUCCESS)
	{
		fprintf(stderr, "memcached_server_add error.");
	}

	uint32_t num =  memcached_server_count(local_memc);
	printf("num:%d\n", num);

//memcached_set(), memcached_add(), and memcached_replace() are all used to store information on the server. All methods take a key, and its length to store the object. Keys are currently limited to 250 characters when using either a version of memcached(1) which is 1.4 or below, or when using the text protocol. You must supply both a value and a length. Optionally you store the object. Keys are currently limited to 250 characters by the memcached(1) server. You must supply both a value and a length. Optionally you may test an expiration time for the object and a 16 byte value (it is meant to be used as a bitmap). “flags” is a 4byte space that is stored alongside of the main value. Many sub libraries make use of this field, so in most cases users should avoid making use of it.
//
//memcached_set() will write an object to the server. If an object already exists it will overwrite what is in the server. If the object does not exist it will be written. If you are using the non-blocking mode this function will always return true unless a network error occurs.
//memcached_return_t memcached_set(memcached_st *ptr, const char *key, size_t key_length, const char *value, size_t value_length, time_t expiration, uint32_t flags)

	char *key = "hello";
	char *value = "world";
	rc = memcached_set(local_memc, key, strlen(key), value, strlen(value), 0, 0);
	if (rc == MEMCACHED_SUCCESS || rc == MEMCACHED_BUFFERED)
	{
		printf("set success\n");
	}
	else
	{
		printf("set fail\n");
	}


//	memcached_get() is used to fetch an individual value from the server. You must pass in a key and its length to fetch the object. You must supply three pointer variables which will give you the state of the returned object. A uint32_t pointer to contain whatever flags you stored with the value, a size_t pointer which will be filled with size of of the object, and a memcached_return_t pointer to hold any error. The object will be returned upon success and NULL will be returned on failure. Any object returned by memcached_get() must be released by the caller application.

//	char * memcached_get(memcached_st *ptr, const char *key, size_t key_length, size_t *value_length, uint32_t *flags, memcached_return_t *error)

//memcached_get() will return NULL on error. You must look at the value of error to determine what the actual error was.
	char *key1 = "hello1";
	size_t value_length = 0;
	uint32_t flags = 0;
	//char *val = memcached_get(local_memc, key1, strlen(key1), &value_length, &flags, &rc);
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
}



//首先包含 config.h
// gcc -Wall -g  memcached_create.c  -I.. -o memcached_create
// In file included from memcached_create.c:12:0:
// ../config.h:10:2: error: #error "You should include config.h as your first include file"
//  #error "You should include config.h as your first include file"
//   ^
// Makefile:14: recipe for target 'memcached_create' failed

